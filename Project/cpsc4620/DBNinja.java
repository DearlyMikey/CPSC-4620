package cpsc4620;

import java.io.IOException;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/*
 * This file is where you will implement the methods needed to support this application.
 * You will write the code to retrieve and save information to the database and use that
 * information to build the various objects required by the applicaiton.
 * 
 * The class has several hard coded static variables used for the connection, you will need to
 * change those to your connection information
 * 
 * This class also has static string variables for pickup, delivery and dine-in. 
 * DO NOT change these constant values.
 * 
 * You can add any helper methods you need, but you must implement all the methods
 * in this class and use them to complete the project.  The autograder will rely on
 * these methods being implemented, so do not delete them or alter their method
 * signatures.
 * 
 * Make sure you properly open and close your DB connections in any method that
 * requires access to the DB.
 * Use the connect_to_db below to open your connection in DBConnector.
 * What is opened must be closed!
 */

/*
 * A utility class to help add and retrieve information from the database
 */

public final class DBNinja {
	private static Connection conn;

	// DO NOT change these variables!
	public final static String pickup = "pickup";
	public final static String delivery = "delivery";
	public final static String dine_in = "dinein";

	public final static String size_s = "Small";
	public final static String size_m = "Medium";
	public final static String size_l = "Large";
	public final static String size_xl = "XLarge";

	public final static String crust_thin = "Thin";
	public final static String crust_orig = "Original";
	public final static String crust_pan = "Pan";
	public final static String crust_gf = "Gluten-Free";

	public enum order_state {
		PREPARED,
		DELIVERED,
		PICKEDUP
	}


	private static boolean connect_to_db() throws SQLException, IOException 
	{

		try {
			conn = DBConnector.make_connection();
			return true;
		} catch (SQLException e) {
			return false;
		} catch (IOException e) {
			return false;
		}

	}

	public static void addOrder(Order o) throws SQLException, IOException 
	{
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
//			System.out.println("Connection is closed: " + conn.isClosed());
//			System.out.println("Connection auto-commit: " + conn.getAutoCommit());
			if (conn == null || conn.isClosed()) {
				connect_to_db();
			}
            conn.setAutoCommit(false);

			String sql =
					"INSERT INTO ordertable " +
							"(customer_CustID, ordertable_OrderType, ordertable_OrderDateTime, " +
							"ordertable_CustPrice, ordertable_BusPrice) " +
							"VALUES (?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			// Checks if CustID is -1 if DineIN
			ps.setObject(1, o.getCustID() == -1 ? null : o.getCustID(), java.sql.Types.INTEGER);
			ps.setString(2, o.getOrderType());
			ps.setString(3, o.getDate());
			ps.setDouble(4, o.getCustPrice());
			ps.setDouble(5, o.getBusPrice());
			ps.executeUpdate();

			rs = ps.getGeneratedKeys();
			if(!rs.next()) {
				throw new SQLException("Failed to retrieve Order ID.");
			}
			int orderID = rs.getInt(1);
			o.setOrderID(orderID);

			if (o instanceof DeliveryOrder) {
				DeliveryOrder delivery = (DeliveryOrder) o;
				sql = "INSERT INTO delivery " +
						"(ordertable_OrderID, delivery_HouseNum, delivery_Street, delivery_City, delivery_State, " +
						"delivery_Zip, delivery_IsDelivered) " +
						"VALUES (?, ?, ?, ?, ?, ?, ?)";
				try (PreparedStatement deliveryPs = conn.prepareStatement(sql)) {
					deliveryPs.setInt(1, orderID);
					String[] addressParts = delivery.getAddress().split(",");
					deliveryPs.setInt(2, Integer.parseInt(addressParts[0].trim())); // HouseNum
					deliveryPs.setString(3, addressParts[1].trim()); // Street
					deliveryPs.setString(4, addressParts[2].trim()); // City
					deliveryPs.setString(5, addressParts[3].trim()); // State
					deliveryPs.setInt(6, Integer.parseInt(addressParts[4].trim())); // Zip
					deliveryPs.setBoolean(7, delivery.getIsComplete());
					deliveryPs.executeUpdate();
				}
			} else if (o instanceof PickupOrder) {
				PickupOrder pickup = (PickupOrder) o;
				sql = "INSERT INTO pickup (ordertable_OrderID, pickup_IsPickedUp) VALUES (?, ?)";
				try (PreparedStatement pickupPs = conn.prepareStatement(sql)) {
					pickupPs.setInt(1, orderID);
					pickupPs.setBoolean(2, pickup.getIsPickedUp());
					pickupPs.executeUpdate();
				}
			} else if (o instanceof DineinOrder) {
				DineinOrder dinein = (DineinOrder) o;
				sql = "INSERT INTO dinein (ordertable_OrderID, dinein_TableNum) VALUES (?, ?)";
				try (PreparedStatement dineinPs = conn.prepareStatement(sql)) {
					dineinPs.setInt(1, orderID);
					dineinPs.setInt(2, dinein.getTableNum());
					dineinPs.executeUpdate();
				}
			}

			// Pizzas
			for (Pizza pizza : o.getPizzaList()) {
				String dateString = o.getDate();
				SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
				java.util.Date utilDate = sdf.parse(dateString);
				addPizza(utilDate, orderID, pizza);
			}

			// Order discounts
			for (Discount discount : o.getDiscountList()) {
				sql = "INSERT INTO order_discount (ordertable_OrderID, discount_DiscountID) VALUES (?, ?)";
				try (PreparedStatement discountPs = conn.prepareStatement(sql)) {
					discountPs.setInt(1, orderID);
					discountPs.setInt(2, discount.getDiscountID());
					discountPs.executeUpdate();
				}
			}

			conn.commit();
		} catch (SQLException e) {
			if (conn != null) {
				conn.rollback();
			}
			throw e;
		} catch (ParseException e) {
            throw new RuntimeException(e);
        } finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) {
				conn.setAutoCommit(true);
				conn.close();
			}
		}
		/*
		 * add code to add the order to the DB. Remember that we're not just
		 * adding the order to the order DB table, but we're also recording
		 * the necessary data for the delivery, dinein, pickup, pizzas, toppings
		 * on pizzas, order discounts and pizza discounts.
		 * 
		 * This is a KEY method as it must store all the data in the Order object
		 * in the database and make sure all the tables are correctly linked.
		 * 
		 * Remember, if the order is for Dine In, there is no customer...
		 * so the customer id coming from the Order object will be -1.
		 * 
		 */

	}
	
	public static int addPizza(java.util.Date d, int orderID, Pizza p) throws SQLException, IOException
	{
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
//			System.out.println("Connection is closed: " + conn.isClosed());
//			System.out.println("Connection auto-commit: " + conn.getAutoCommit());
//			if (conn == null || conn.isClosed()) {
//				connect_to_db(); // Ensure connection is open
//			}
			String sql =
					"INSERT INTO pizza " +
						"(ordertable_OrderID, pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, " +
							"pizza_CustPrice, pizza_BusPrice) " +
						"VALUES (?, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, orderID);
			ps.setString(2, p.getSize());
			ps.setString(3, p.getCrustType());
			ps.setString(4, p.getPizzaState());
			ps.setDate(5, new java.sql.Date(d.getTime()));
			ps.setDouble(6, p.getCustPrice());
			ps.setDouble(7, p.getBusPrice());

			ps.executeUpdate();
			rs = ps.getGeneratedKeys();
			if (!rs.next()) {
				throw new SQLException("Failed to retrieve Pizza ID.");
			}
			int pizzaID = rs.getInt(1);

			// Add topping
			for (Topping topping : p.getToppings()) {
				sql = "INSERT INTO pizza_topping " +
						"(pizza_PizzaID, topping_TopID, pizza_topping_IsDouble) " +
						"VALUES (?, ?, ?)";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, pizzaID);
				ps.setInt(2, topping.getTopID());
				ps.setInt(3, topping.getDoubled() ? 1 : 0);
				ps.executeUpdate();

				double unitsNeeded = 0.0;

				if (p.getSize().equals(DBNinja.size_s)) {
					unitsNeeded = topping.getSmallAMT();
				} else if (p.getSize().equals(DBNinja.size_m)) {
					unitsNeeded = topping.getMedAMT();
				} else if (p.getSize().equals(DBNinja.size_l)) {
					unitsNeeded = topping.getLgAMT();
				} else {
					unitsNeeded = topping.getXLAMT();
				}

				if (topping.getDoubled()) {
					unitsNeeded *= 2;
				}

				// Update inventory
				sql = "UPDATE topping " +
						"SET topping_CurINVT = topping_CurINVT - ? " +
						"WHERE topping_TopID = ?";
				ps = conn.prepareStatement(sql);
				ps.setDouble(1, unitsNeeded);
				ps.setInt(2, topping.getTopID());
				ps.executeUpdate();
			}

			// Add discount
			for (Discount discount : p.getDiscounts()) {
				sql = "INSERT INTO pizza_discount " +
						"(pizza_PizzaID, discount_DiscountID) " +
						"VALUES (?, ?)";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, pizzaID);
				ps.setInt(2, discount.getDiscountID());
				ps.executeUpdate();
			}
			return pizzaID;
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
		}

		/*
		 * Add the code needed to insert the pizza into the database.
		 * Keep in mind you must also add the pizza discounts and toppings
		 * associated with the pizza.
		 * 
		 * NOTE: there is a Date object passed into this method so that the Order
		 * and ALL its Pizzas can be assigned the same DTS.
		 * 
		 * This method returns the id of the pizza just added.
		 * 
		 */

	}
	
	public static int addCustomer(Customer c) throws SQLException, IOException
	 {
		 PreparedStatement ps = null;
		 ResultSet rs = null;

		 try {
			 if (conn == null || conn.isClosed()) {
				 connect_to_db();
			 }
			 String sql = "INSERT INTO customer (customer_FName, customer_LName, customer_PhoneNum) VALUES (?, ?, ?)";
			 ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			 ps.setString(1, c.getFName());
			 ps.setString(2, c.getLName());
			 ps.setString(3, c.getPhone());

			 ps.executeUpdate();

			 rs = ps.getGeneratedKeys();
			 if (!rs.next()) {
				 throw new SQLException("Failed to get Customer ID.");
			 }

			 return rs.getInt(1);
		 } catch (SQLException e) {
			 throw e;
		 } finally {
			 if (rs != null) rs.close();
			 if (ps != null) ps.close();
			 if (conn != null) conn.close();
		 }


		/*
		 * This method adds a new customer to the database.
		 * 
		 */
	}

	public static void completeOrder(int OrderID, order_state newState ) throws SQLException, IOException
	{
		PreparedStatement ps = null;

		try {
			if (conn == null || conn.isClosed()) {
				connect_to_db();
			}
			String sql;

			switch (newState) {
				case PREPARED:
					sql = "UPDATE ordertable SET ordertable_IsComplete = 1 WHERE ordertable_OrderID = ?";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, OrderID);
					ps.executeUpdate();

					sql = "UPDATE pizza SET pizza_PizzaState = 'Completed' WHERE ordertable_OrderID = ?";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, OrderID);
					ps.executeUpdate();
					break;
				case DELIVERED:
					sql = "UPDATE delivery SET delivery_IsDelivered = 1 WHERE ordertable_OrderID = ?";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, OrderID);
					ps.executeUpdate();
					break;
				case PICKEDUP:
					sql = "UPDATE pickup SET pickup_IsPickedUp = 1 WHERE ordertable_OrderID = ?";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, OrderID);
					ps.executeUpdate();
					break;
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (ps != null) ps.close();
		}
		/*
		 * Mark that order as complete in the database.
		 * Note: if an order is complete, this means all the pizzas are complete as well.
		 * However, it does not mean that the order has been delivered or picked up!
		 *
		 * For newState = PREPARED: mark the order and all associated pizza's as completed
		 * For newState = DELIVERED: mark the delivery status
		 * FOR newState = PICKEDUP: mark the pickup status
		 * 
		 */

	}

	public static ArrayList<Order> getOrders(int status) throws SQLException, IOException {
		ArrayList<Order> orders = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			if (conn == null || conn.isClosed()) {
				connect_to_db();
			}

			String sql = "SELECT ordertable_OrderID, customer_CustID, ordertable_OrderType, ordertable_OrderDateTime, " +
					"ordertable_CustPrice, ordertable_BusPrice, ordertable_isComplete " +
					"FROM ordertable ";

			if (status == 1) {
				sql += "WHERE ordertable_isComplete = 0 ";
			} else if (status == 2) {
				sql += "WHERE ordertable_isComplete = 1 ";
			}

			sql += "ORDER BY ordertable_OrderDateTime ASC";

			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				int orderID = rs.getInt("ordertable_OrderID");
				int custID = rs.getInt("customer_CustID");
				String orderType = rs.getString("ordertable_OrderType");
				String orderDateTime = rs.getString("ordertable_OrderDateTime");
				double custPrice = rs.getDouble("ordertable_CustPrice");
				double busPrice = rs.getDouble("ordertable_BusPrice");
				boolean isComplete = rs.getBoolean("ordertable_isComplete");

				Order order = null;

				switch (orderType) {
					case DBNinja.delivery: {
						String deliverySql = "SELECT delivery_HouseNum, delivery_Street, delivery_City, delivery_State, delivery_Zip, delivery_IsDelivered " +
								"FROM delivery WHERE ordertable_OrderID = ?";
						try (PreparedStatement deliveryPs = conn.prepareStatement(deliverySql)) {
							deliveryPs.setInt(1, orderID);
							try (ResultSet deliveryRs = deliveryPs.executeQuery()) {
								if (deliveryRs.next()) {
									String address = deliveryRs.getInt("delivery_HouseNum") + "\t" +
											deliveryRs.getString("delivery_Street") + "\t" +
											deliveryRs.getString("delivery_City") + "\t" +
											deliveryRs.getString("delivery_State") + "\t" +
											deliveryRs.getInt("delivery_Zip");
									boolean isDelivered = deliveryRs.getBoolean("delivery_IsDelivered");
									order = new DeliveryOrder(orderID, custID, orderDateTime, custPrice, busPrice, isComplete, address, isDelivered);
								}
							}
						}
						break;
					}
					case DBNinja.pickup: {
						String pickupSql = "SELECT pickup_IsPickedUp FROM pickup WHERE ordertable_OrderID = ?";
						try (PreparedStatement pickupPs = conn.prepareStatement(pickupSql)) {
							pickupPs.setInt(1, orderID);
							try (ResultSet pickupRs = pickupPs.executeQuery()) {
								if (pickupRs.next()) {
									boolean isPickedUp = pickupRs.getBoolean("pickup_IsPickedUp");
									order = new PickupOrder(orderID, custID, orderDateTime, custPrice, busPrice, isPickedUp, isComplete);
								}
							}
						}
						break;
					}
					case DBNinja.dine_in: {
						String dineInSql = "SELECT dinein_TableNum FROM dinein WHERE ordertable_OrderID = ?";
						try (PreparedStatement dineInPs = conn.prepareStatement(dineInSql)) {
							dineInPs.setInt(1, orderID);
							try (ResultSet dineInRs = dineInPs.executeQuery()) {
								if (dineInRs.next()) {
									int tableNum = dineInRs.getInt("dinein_TableNum");
									order = new DineinOrder(orderID, custID, orderDateTime, custPrice, busPrice, isComplete, tableNum);
								}
							}
						}
						break;
					}
				}
				if (order != null) {
					// Populate pizzas and discounts
					ArrayList<Pizza> pizzas = getPizzas(order);
					ArrayList<Discount> discounts = getDiscounts(order);
					order.setPizzaList(pizzas);
					order.setDiscountList(discounts);
					orders.add(order);
				}
			}
			return orders;
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}

	 /*
	 *  Return an ArrayList of orders.
	 * 	status   == 1 => return a list of open (ie order is not completed)
	 *           == 2 => return a list of completed orders (ie order is complete)
	 *           == 3 => return a list of all the orders
	 * Remember that in Java, we account for supertypes and subtypes
	 * which means that when we create an arrayList of orders, that really
	 * means we have an arrayList of dineinOrders, deliveryOrders, and pickupOrders.
	 *
	 * You must fully populate the Order object, this includes order discounts,
	 * and pizzas along with the toppings and discounts associated with them.
	 *
	 * Don't forget to order the data coming from the database appropriately.
	 *
	 */
	}
	
	public static Order getLastOrder() throws SQLException, IOException
	{
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			if (conn == null || conn.isClosed()) {
				connect_to_db();
			}

			String sql = "SELECT ordertable_OrderID, customer_CustID, ordertable_OrderType, ordertable_OrderDateTime, " +
						 "ordertable_CustPrice, ordertable_BusPrice, ordertable_isComplete " +
						 "FROM ordertable ORDER BY ordertable_OrderID DESC LIMIT 1";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			if (rs.next()) {
				int orderID = rs.getInt("ordertable_OrderID");
				int custID = rs.getInt("customer_CustID");
				String orderType = rs.getString("ordertable_OrderType");
				String orderDateTime = rs.getString("ordertable_OrderDateTime");
				double custPrice = rs.getDouble("ordertable_CustPrice");
				double busPrice = rs.getDouble("ordertable_BusPrice");
				boolean isComplete = rs.getBoolean("ordertable_isComplete");

				Order order = null;

				switch (orderType) {
					case DBNinja.delivery: {
						String deliverySql = "SELECT delivery_HouseNum, delivery_Street, delivery_City, delivery_State, delivery_Zip, delivery_IsDelivered " +
											 "FROM delivery WHERE ordertable_OrderID = ?";
						try (PreparedStatement deliveryPs = conn.prepareStatement(deliverySql)) {
							deliveryPs.setInt(1, orderID);
							try (ResultSet deliveryRs = deliveryPs.executeQuery()) {
								if (deliveryRs.next()) {
									String address = deliveryRs.getInt("delivery_HouseNum") + "\t" +
													 deliveryRs.getString("delivery_Street") + "\t" +
													 deliveryRs.getString("delivery_City") + "\t" +
													 deliveryRs.getString("delivery_State") + "\t" +
													 deliveryRs.getInt("delivery_Zip");
									boolean isDelivered = deliveryRs.getBoolean("delivery_IsDelivered");
									order = new DeliveryOrder(orderID, custID, orderDateTime, custPrice, busPrice, isComplete, address, isDelivered);
								}
							}
						}
						break;
					}
					case DBNinja.pickup: {
						String pickupSql = "SELECT pickup_IsPickedUp FROM pickup WHERE ordertable_OrderID = ?";
						try (PreparedStatement pickupPs = conn.prepareStatement(pickupSql)) {
							pickupPs.setInt(1, orderID);
							try (ResultSet pickupRs = pickupPs.executeQuery()) {
								if (pickupRs.next()) {
									boolean isPickedUp = pickupRs.getBoolean("pickup_IsPickedUp");
									order = new PickupOrder(orderID, custID, orderDateTime, custPrice, busPrice, isPickedUp, isComplete);
								}
							}
						}
						break;
					}
					case DBNinja.dine_in: {
						String dineInSql = "SELECT dinein_TableNum FROM dinein WHERE ordertable_OrderID = ?";
						try (PreparedStatement dineInPs = conn.prepareStatement(dineInSql)) {
							dineInPs.setInt(1, orderID);
							try (ResultSet dineInRs = dineInPs.executeQuery()) {
								if (dineInRs.next()) {
									int tableNum = dineInRs.getInt("dinein_TableNum");
									order = new DineinOrder(orderID, custID, orderDateTime, custPrice, busPrice, isComplete, tableNum);
								}
							}
						}
						break;
					}
				}

				if (order != null) {
					ArrayList<Pizza> pizzas = getPizzas(order);
					ArrayList<Discount> discounts = getDiscounts(order);
					order.setPizzaList(pizzas);
					order.setDiscountList(discounts);
				}

				return order;
			} else {
				throw new SQLException("No orders found.");
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		/*
		 * Query the database for the LAST order added
		 * then return an Order object for that order.
		 * NOTE...there will ALWAYS be a "last order"!
		 */
	}

	public static ArrayList<Order> getOrdersByDate(String date) throws SQLException, IOException
	{
		ArrayList<Order> orders = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			if (conn == null || conn.isClosed()) {
				connect_to_db();
			}

			String sql = "SELECT ordertable_OrderID, customer_CustID, ordertable_OrderType, ordertable_OrderDateTime, " +
						 "ordertable_CustPrice, ordertable_BusPrice, ordertable_isComplete " +
						 "FROM ordertable WHERE DATE(ordertable_OrderDateTime) = ? ORDER BY ordertable_OrderDateTime ASC";
			ps = conn.prepareStatement(sql);
			ps.setString(1, date);
			rs = ps.executeQuery();

			while (rs.next()) {
				int orderID = rs.getInt("ordertable_OrderID");
				int custID = rs.getInt("customer_CustID");
				String orderType = rs.getString("ordertable_OrderType");
				String orderDateTime = rs.getString("ordertable_OrderDateTime");
				double custPrice = rs.getDouble("ordertable_CustPrice");
				double busPrice = rs.getDouble("ordertable_BusPrice");
				boolean isComplete = rs.getBoolean("ordertable_isComplete");

				Order order = null;

				switch (orderType) {
					case DBNinja.delivery: {
						String deliverySql = "SELECT delivery_HouseNum, delivery_Street, delivery_City, delivery_State, delivery_Zip, delivery_IsDelivered " +
											 "FROM delivery WHERE ordertable_OrderID = ?";
						try (PreparedStatement deliveryPs = conn.prepareStatement(deliverySql)) {
							deliveryPs.setInt(1, orderID);
							try (ResultSet deliveryRs = deliveryPs.executeQuery()) {
								if (deliveryRs.next()) {
									String address = deliveryRs.getInt("delivery_HouseNum") + "\t" +
													 deliveryRs.getString("delivery_Street") + "\t" +
													 deliveryRs.getString("delivery_City") + "\t" +
													 deliveryRs.getString("delivery_State") + "\t" +
													 deliveryRs.getInt("delivery_Zip");
									boolean isDelivered = deliveryRs.getBoolean("delivery_IsDelivered");
									order = new DeliveryOrder(orderID, custID, orderDateTime, custPrice, busPrice, isComplete, address, isDelivered);
								}
							}
						}
						break;
					}
					case DBNinja.pickup: {
						String pickupSql = "SELECT pickup_IsPickedUp FROM pickup WHERE ordertable_OrderID = ?";
						try (PreparedStatement pickupPs = conn.prepareStatement(pickupSql)) {
							pickupPs.setInt(1, orderID);
							try (ResultSet pickupRs = pickupPs.executeQuery()) {
								if (pickupRs.next()) {
									boolean isPickedUp = pickupRs.getBoolean("pickup_IsPickedUp");
									order = new PickupOrder(orderID, custID, orderDateTime, custPrice, busPrice, isPickedUp, isComplete);
								}
							}
						}
						break;
					}
					case DBNinja.dine_in: {
						String dineInSql = "SELECT dinein_TableNum FROM dinein WHERE ordertable_OrderID = ?";
						try (PreparedStatement dineInPs = conn.prepareStatement(dineInSql)) {
							dineInPs.setInt(1, orderID);
							try (ResultSet dineInRs = dineInPs.executeQuery()) {
								if (dineInRs.next()) {
									int tableNum = dineInRs.getInt("dinein_TableNum");
									order = new DineinOrder(orderID, custID, orderDateTime, custPrice, busPrice, isComplete, tableNum);
								}
							}
						}
						break;
					}
				}
				if (order != null) {
					ArrayList<Pizza> pizzas = getPizzas(order);
					ArrayList<Discount> discounts = getDiscounts(order);
					order.setPizzaList(pizzas);
					order.setDiscountList(discounts);
					orders.add(order);
				}
			}
			return orders;
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		/*
		 * Query the database for ALL the orders placed on a specific date
		 * and return a list of those orders.
		 *
		 */
	}
		
	public static ArrayList<Discount> getDiscountList() throws SQLException, IOException 
	{
		ArrayList<Discount> discountList = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			if (conn == null || conn.isClosed()) {
				connect_to_db();
			}

			String sql = "SELECT discount_DiscountID, discount_DiscountName, discount_Amount, discount_IsPercent " +
					"FROM discount ORDER BY discount_DiscountName ASC";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				int discountID = rs.getInt("discount_DiscountID");
				String discountName = rs.getString("discount_DiscountName");
				double amount = rs.getDouble("discount_Amount");
				boolean isPercent = rs.getInt("discount_IsPercent") == 1;

				Discount discount = new Discount(discountID, discountName, amount, isPercent);
				discountList.add(discount);
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		return discountList;
		/* 
		 * Query the database for all the available discounts and 
		 * return them in an arrayList of discounts ordered by discount name.
		 * 
		*/
	}

	public static Discount findDiscountByName(String name) throws SQLException, IOException 
	{
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			if (conn == null || conn.isClosed()) {
				connect_to_db();
			}
			String sql = "SELECT discount_DiscountID, discount_DiscountName, discount_Amount, discount_IsPercent " +
					"FROM discount WHERE discount_DiscountName = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();

			if (rs.next()) {
				int discountID = rs.getInt("discount_DiscountID");
				String discountName = rs.getString("discount_DiscountName");
				double amount = rs.getDouble("discount_Amount");
				boolean isPercent = rs.getInt("discount_IsPercent") == 1;

				return new Discount(discountID, discountName, amount, isPercent);
			} else {
				return null;
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		/*
		 * Query the database for a discount using it's name.
		 * If found, then return an OrderDiscount object for the discount.
		 * If it's not found....then return null
		 *  
		 */
	}


	public static ArrayList<Customer> getCustomerList() throws SQLException, IOException 
	{
		ArrayList<Customer> customerList = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			if (conn == null || conn.isClosed()) {
				connect_to_db();
			}
			String sql = "SELECT customer_CustID, customer_FName, customer_LName, customer_PhoneNum FROM customer " +
					"ORDER BY customer_LName, customer_FName, customer_PhoneNum";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				int custID = rs.getInt("customer_CustID");
				String fName = rs.getString("customer_FName");
				String lName = rs.getString("customer_LName");
				String phone = rs.getString("customer_PhoneNum");

				Customer customer = new Customer(custID, fName, lName, phone);
				customerList.add(customer);
			}
			return customerList;
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		/*
		 * Query the data for all the customers and return an arrayList of all the customers. 
		 * Don't forget to order the data coming from the database appropriately.
		 * 
		*/
	}

	public static Customer findCustomerByPhone(String phoneNumber)  throws SQLException, IOException 
	{
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			if (conn == null || conn.isClosed()) {
				connect_to_db();
			}

			String sql = "SELECT customer_CustID, customer_FName, customer_LName " +
					"FROM customer WHERE customer_PhoneNum = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, phoneNumber);
			rs = ps.executeQuery();

			if (rs.next()) {
				int custID = rs.getInt("customer_CustID");
				String fName = rs.getString("customer_FName");
				String lName = rs.getString("customer_LName");

				return new Customer(custID, fName, lName, phoneNumber);
			} else {
				return null;
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		/*
		 * Query the database for a customer using a phone number.
		 * If found, then return a Customer object for the customer.
		 * If it's not found....then return null
		 *  
		 */
	}

	public static String getCustomerName(int CustID) throws SQLException, IOException 
	{
		/*
		 * COMPLETED...WORKING Example!
		 * 
		 * This is a helper method to fetch and format the name of a customer
		 * based on a customer ID. This is an example of how to interact with
		 * your database from Java.  
		 * 
		 * Notice how the connection to the DB made at the start of the 
		 *
		 */

		 connect_to_db();

		/* 
		 * an example query using a constructed string...
		 * remember, this style of query construction could be subject to sql injection attacks!
		 * 
		 */
		String cname1 = "";
		String cname2 = "";
		String query = "Select customer_FName, customer_LName From customer WHERE customer_CustID=" + CustID + ";";
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery(query);

		while(rset.next())
		{
			cname1 = rset.getString(1) + " " + rset.getString(2);
		}

		/* 
		* an BETTER example of the same query using a prepared statement...
		* with exception handling
		* 
		*/
		try {
			PreparedStatement os;
			ResultSet rset2;
			String query2;
			query2 = "Select customer_FName, customer_LName From customer WHERE customer_CustID=?;";
			os = conn.prepareStatement(query2);
			os.setInt(1, CustID);
			rset2 = os.executeQuery();
			while(rset2.next())
			{
				cname2 = rset2.getString("customer_FName") + " " + rset2.getString("customer_LName"); // note the use of field names in the getSting methods
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// process the error or re-raise the exception to a higher level
		}

		conn.close();

		return cname1;
		// OR
		// return cname2;

	}


	public static ArrayList<Topping> getToppingList() throws SQLException, IOException 
	{
		ArrayList<Topping> toppingList = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			if (conn == null || conn.isClosed()) {
				connect_to_db();
			}

			String sql = "SELECT topping_TopID, topping_TopName, topping_SmallAMT, topping_MedAMT, topping_LgAMT, " +
					"topping_XLAMT, topping_CustPrice, topping_BusPrice, topping_MinINVT, topping_CurINVT " +
					"FROM `topping` ORDER BY topping_TopName ASC";

			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();


			while (rs.next()) {
				int topID = rs.getInt("topping_TopID");
				String topName = rs.getString("topping_TopName");
				double smallAMT = rs.getDouble("topping_SmallAMT");
				double medAMT = rs.getDouble("topping_MedAMT");
				double lgAMT = rs.getDouble("topping_LgAMT");
				double xlAMT = rs.getDouble("topping_XLAMT");
				double custPrice = rs.getDouble("topping_CustPrice");
				double busPrice = rs.getDouble("topping_BusPrice");
				int minINVT = rs.getInt("topping_MinINVT");
				int curINVT = rs.getInt("topping_CurINVT");

				Topping topping = new Topping(topID, topName, smallAMT, medAMT, lgAMT, xlAMT, custPrice, busPrice, minINVT, curINVT);
				toppingList.add(topping);
			}
			return toppingList;
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
	}

	public static Topping findToppingByName(String name) throws SQLException, IOException 
	{
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			if (conn == null || conn.isClosed()) {
				connect_to_db();
			}

			String sql = "SELECT topping_TopID, topping_TopName, topping_SmallAMT, topping_MedAMT, " +
					"topping_LgAMT, topping_XLAMT, topping_CustPrice, topping_BusPrice, topping_MinINVT, " +
					"topping_CurINVT FROM topping WHERE topping_TopName = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();

			if (rs.next()) {
				int topID = rs.getInt("topping_TopID");
				String topName = rs.getString("topping_TopName");
				double smallAMT = rs.getDouble("topping_SmallAMT");
				double medAMT = rs.getDouble("topping_MedAMT");
				double lgAMT = rs.getDouble("topping_LgAMT");
				double xlAMT = rs.getDouble("topping_XLAMT");
				double custPrice = rs.getDouble("topping_CustPrice");
				double busPrice = rs.getDouble("topping_BusPrice");
				int minINVT = rs.getInt("topping_MinINVT");
				int curINVT = rs.getInt("topping_CurINVT");

				return new Topping(topID, topName, smallAMT, medAMT, lgAMT, xlAMT, custPrice, busPrice, minINVT, curINVT);
			} else {
				return null;
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		/*
		 * Query the database for the topping using it's name.
		 * If found, then return a Topping object for the topping.
		 * If it's not found....then return null
		 *  
		 */
	}

	public static ArrayList<Topping> getToppingsOnPizza(Pizza p) throws SQLException, IOException 
	{
		ArrayList<Topping> toppings = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
//			if (conn == null || conn.isClosed()) {
//				connect_to_db();
//			}

			String sql = "SELECT t.topping_TopID, t.topping_TopName, t.topping_SmallAMT, t.topping_MedAMT, " +
					"t.topping_LgAMT, t.topping_XLAMT, t.topping_CustPrice, t.topping_BusPrice, t.topping_MinINVT, " +
					"t.topping_CurINVT, pt.pizza_topping_IsDouble " +
					"FROM pizza_topping pt " +
					"JOIN topping t ON pt.topping_TopID = t.topping_TopID " +
					"WHERE pt.pizza_PizzaID = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, p.getPizzaID());
			rs = ps.executeQuery();

			while (rs.next()) {
				int topID = rs.getInt("topping_TopID");
				String topName = rs.getString("topping_TopName");
				double smallAMT = rs.getDouble("topping_SmallAMT");
				double medAMT = rs.getDouble("topping_MedAMT");
				double lgAMT = rs.getDouble("topping_LgAMT");
				double xlAMT = rs.getDouble("topping_XLAMT");
				double custPrice = rs.getDouble("topping_CustPrice");
				double busPrice = rs.getDouble("topping_BusPrice");
				int minINVT = rs.getInt("topping_MinINVT");
				int curINVT = rs.getInt("topping_CurINVT");
				boolean isDouble = rs.getInt("pizza_topping_IsDouble") == 1;

				Topping topping = new Topping(topID, topName, smallAMT, medAMT, lgAMT, xlAMT, custPrice, busPrice,
						minINVT, curINVT);
				topping.setDoubled(isDouble);

				toppings.add(topping);

			}
			return toppings;
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
		}
		/* 
		 * This method builds an ArrayList of the toppings ON a pizza.
		 * The list can then be added to the Pizza object elsewhere in the
		 */
	}

	public static void addToInventory(int toppingID, double quantity) throws SQLException, IOException 
	{
		PreparedStatement ps = null;

		try {
			if (conn == null || conn.isClosed()) {
				connect_to_db();
			}

			String sql = "UPDATE topping SET topping_CurINVT = topping_CurINVT + ? WHERE topping_TopID = ?";
			ps = conn.prepareStatement(sql);
			ps.setDouble(1, quantity);
			ps.setInt(2, toppingID);

			ps.executeUpdate();
		} catch (SQLException e) {
			throw e;
		} finally {
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		/*
		 * Updates the quantity of the topping in the database by the amount specified.
		 * 
		 * */
	}
	
	
	public static ArrayList<Pizza> getPizzas(Order o) throws SQLException, IOException 
	{
		ArrayList<Pizza> pizzas = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
//			if (conn == null || conn.isClosed()) {
//				connect_to_db();
//			}

			String sql = "SELECT pizza_PizzaID, pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, " +
					"pizza_CustPrice, pizza_BusPrice " +
					"FROM pizza " +
					"WHERE ordertable_OrderID = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, o.getOrderID());

			rs = ps.executeQuery();

			while (rs.next()) {
				int pizzaID = rs.getInt("pizza_PizzaID");
				String CrustType = rs.getString("pizza_CrustType");
				String Size = rs.getString("pizza_Size");
				int OrderID = o.getOrderID();
				String PizzaState = rs.getString("pizza_PizzaState");
				String PizzaDate = rs.getString("pizza_PizzaDate");
				double CustPrice = rs.getDouble("pizza_CustPrice");
				double BusPrice = rs.getDouble("pizza_BusPrice");

				Pizza pizza = new Pizza(pizzaID, Size, CrustType, OrderID, PizzaState, PizzaDate, CustPrice, BusPrice);

				ArrayList<Topping> toppings = getToppingsOnPizza(pizza);
				for (Topping topping : toppings) {
					pizza.addToppings(topping, topping.getDoubled());
				}

				ArrayList<Discount> discounts = getDiscounts(pizza);
				for (Discount discount : discounts) {
					pizza.addDiscounts(discount);
				}

				pizzas.add(pizza);
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
		}

		/*
		 * Build an ArrayList of all the Pizzas associated with the Order.
		 * 
		 */
		return pizzas;
	}

	public static ArrayList<Discount> getDiscounts(Order o) throws SQLException, IOException 
	{
		ArrayList<Discount> discounts = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
//			if (conn == null || conn.isClosed()) {
//				connect_to_db();
//			}

			String sql = "SELECT d.discount_DiscountID, d.discount_DiscountName, d.discount_Amount, " +
					"d.discount_IsPercent " +
					"FROM order_discount od " +
					"JOIN discount d ON od.discount_DiscountID = d.discount_DiscountID " +
					"WHERE od.ordertable_OrderID = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, o.getOrderID());

			rs = ps.executeQuery();

			while (rs.next()) {
				int discountID = rs.getInt("discount_DiscountID");
				String discountName = rs.getString("discount_DiscountName");
				double amount = rs.getDouble("discount_Amount");
				boolean isPercent = rs.getInt("discount_IsPercent") == 1;

				Discount discount = new Discount(discountID, discountName, amount, isPercent);
				discounts.add(discount);
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
		}
		return discounts;
		/* 
		 * Build an array list of all the Discounts associated with the Order.
		 * 
		 */

	}

	public static ArrayList<Discount> getDiscounts(Pizza p) throws SQLException, IOException 
	{
		ArrayList<Discount> discounts = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
//			if (conn == null || conn.isClosed()) {
//				connect_to_db();
//			}

			String sql = "SELECT d.discount_DiscountID, d.discount_DiscountName, d.discount_Amount, " +
					"d.discount_IsPercent " +
					"FROM pizza_discount pd " +
					"JOIN discount d ON pd.discount_DiscountID = d.discount_DiscountID " +
					"WHERE pd.pizza_PizzaID = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, p.getPizzaID());

			rs = ps.executeQuery();

			while (rs.next()) {
				int discountID = rs.getInt("discount_DiscountID");
				String discountName = rs.getString("discount_DiscountName");
				double amount = rs.getDouble("discount_Amount");
				boolean isPercent = rs.getInt("discount_IsPercent") == 1;

				Discount discount = new Discount(discountID, discountName, amount, isPercent);
				discounts.add(discount);
			}
			return discounts;
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
		}
		/* 
		 * Build an array list of all the Discounts associted with the Pizza.
		 * 
		 */
	}

	public static double getBaseCustPrice(String size, String crust) throws SQLException, IOException 
	{
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			if (conn == null || conn.isClosed()) {
				connect_to_db();
			}

			String sql = "SELECT baseprice_CustPrice FROM baseprice " +
					"WHERE baseprice_Size = ? AND baseprice_CrustType = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, size);
			ps.setString(2, crust);
			rs = ps.executeQuery();

			if (rs.next()) {
				return rs.getDouble("baseprice_CustPrice");
			} else {
				return 0.0;
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		/* 
		 * Query the database fro the base customer price for that size and crust pizza.
		 * 
		*/
	}

	public static double getBaseBusPrice(String size, String crust) throws SQLException, IOException 
	{
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			if (conn == null || conn.isClosed()) {
				connect_to_db();
			}

			String sql = "SELECT baseprice_BusPrice FROM baseprice " +
					"WHERE baseprice_Size = ? AND baseprice_CrustType = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, size);
			ps.setString(2, crust);
			rs = ps.executeQuery();

			if (rs.next()) {
				return rs.getDouble("baseprice_BusPrice");
			} else {
				return 0.0;
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		/* 
		 * Query the database fro the base business price for that size and crust pizza.
		 * 
		*/
	}

	
	public static void printToppingPopReport() throws SQLException, IOException
	{
		/*
		 * Prints the ToppingPopularity view. Remember that this view
		 * needs to exist in your DB, so be sure you've run your createViews.sql
		 * files on your testing DB if you haven't already.
		 * 
		 * The result should be readable and sorted as indicated in the prompt.
		 * 
		 * HINT: You need to match the expected output EXACTLY....I would suggest
		 * you look at the printf method (rather that the simple print of println).
		 * It operates the same in Java as it does in C and will make your code
		 * better.
		 * 
		 */
	}
	
	public static void printProfitByPizzaReport() throws SQLException, IOException 
	{
		/*
		 * Prints the ProfitByPizza view. Remember that this view
		 * needs to exist in your DB, so be sure you've run your createViews.sql
		 * files on your testing DB if you haven't already.
		 * 
		 * The result should be readable and sorted as indicated in the prompt.
		 * 
		 * HINT: You need to match the expected output EXACTLY....I would suggest
		 * you look at the printf method (rather that the simple print of println).
		 * It operates the same in Java as it does in C and will make your code
		 * better.
		 * 
		 */
	}
	
	public static void printProfitByOrderType() throws SQLException, IOException
	{
		/*
		 * Prints the ProfitByOrderType view. Remember that this view
		 * needs to exist in your DB, so be sure you've run your createViews.sql
		 * files on your testing DB if you haven't already.
		 * 
		 * The result should be readable and sorted as indicated in the prompt.
		 *
		 * HINT: You need to match the expected output EXACTLY....I would suggest
		 * you look at the printf method (rather that the simple print of println).
		 * It operates the same in Java as it does in C and will make your code
		 * better.
		 * 
		 */
	}
	
	
	
	/*
	 * These private methods help get the individual components of an SQL datetime object. 
	 * You're welcome to keep them or remove them....but they are usefull!
	 */
	private static int getYear(String date)// assumes date format 'YYYY-MM-DD HH:mm:ss'
	{
		return Integer.parseInt(date.substring(0,4));
	}
	private static int getMonth(String date)// assumes date format 'YYYY-MM-DD HH:mm:ss'
	{
		return Integer.parseInt(date.substring(5, 7));
	}
	private static int getDay(String date)// assumes date format 'YYYY-MM-DD HH:mm:ss'
	{
		return Integer.parseInt(date.substring(8, 10));
	}

	public static boolean checkDate(int year, int month, int day, String dateOfOrder)
	{
		if(getYear(dateOfOrder) > year)
			return true;
		else if(getYear(dateOfOrder) < year)
			return false;
		else
		{
			if(getMonth(dateOfOrder) > month)
				return true;
			else if(getMonth(dateOfOrder) < month)
				return false;
			else
			{
				if(getDay(dateOfOrder) >= day)
					return true;
				else
					return false;
			}
		}
	}


}