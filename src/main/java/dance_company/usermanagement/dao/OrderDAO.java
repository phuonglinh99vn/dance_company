package dance_company.usermanagement.dao;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import dance_company.usermanagement.model.Order;

public class OrderDAO {

	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public OrderDAO(Connection con) {
		super();
		this.con = con;
	}

	public int addOrder(Order order) throws SQLException {

		try {
			query = "INSERT INTO `dance_company`.`order` (`userId`, `submitDate`, `approve`) VALUES (?,?,?)";
			pst = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

			pst.setInt(1, order.getUserId());
			pst.setDate(2, new Date(System.currentTimeMillis()));
			pst.setBoolean(3, order.isApprove());

			pst.execute();
			rs = pst.getGeneratedKeys();
			if (rs.next()) {
				int insertedId = rs.getInt(1);
				return insertedId;

			}
			return 0;
		} finally {
			close(con, pst, null);
		}

	}

	private void close(Connection con2, PreparedStatement pst, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (con != null) {

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public List<Order> getOrders(int id) {
		List<Order> order = new ArrayList<>();
		try {

			query = "select * from dance_company.order where userId=?";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();

			while (rs.next()) {
				Order row = new Order();
				row.setId(rs.getInt("id"));
				row.setUserId(rs.getInt("userId"));
				row.setSubmitDate(rs.getDate("submitDate"));
				row.setApprove(rs.getBoolean("approve"));

				order.add(row);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return order;
	}

	public List<Order> getAllOrders() {
		List<Order> orders = new ArrayList<>();
		query = "select od.*, us.name from dance_company.order od\r\n"
				+ "JOIN dance_company.user us on od.userId = us.id;";
		
		try {
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();

			while (rs.next()) {
				Order row = new Order();
				row.setId(rs.getInt("id"));
				row.setUserId(rs.getInt("userId"));
				row.setUserName(rs.getString("name"));
				row.setSubmitDate(rs.getDate("submitDate"));
				row.setApprove(rs.getBoolean("approve"));
				orders.add(row);
			}
		} catch (SQLException e) {
		}
		return orders;
	}

	public void approveOrder(int id) {
		query = "UPDATE dance_company.order SET approve=1 WHERE id=?";
		try {	
			pst = this.con.prepareStatement(query);
//			rs = pst.executeQuery();
	        pst.setInt(1, id); // set parameter for order ID
	        pst.executeUpdate(); // execute update, no need to use ResultSet

		} catch (SQLException e) {
			System.out.println("Error approving order: " + e.getMessage());
		}
	}

	public Order getOrderById(int orderId) {
		Order row = new Order();
		try {
			// prepare statement to select order by ID
			pst = this.con.prepareStatement("SELECT * FROM orders WHERE id = ?");
			pst.setInt(1, orderId);

			// execute query
			rs = pst.executeQuery();

			// if order found, create Order object
			if (rs.next()) {
				row.setId(rs.getInt("id"));
				row.setUserId(rs.getInt("userId"));
				row.setSubmitDate(rs.getDate("submitDate"));
				row.setApprove(rs.getBoolean("approve"));
				// set other properties as needed
			}
		} catch (SQLException e) {
			// handle exception
		} finally {
			// close statement and result set
			try {
				if (rs != null) {
					rs.close();
				}
				if (pst != null) {
					pst.close();
				}
			} catch (SQLException e) {
				// handle exception
			}
			// close database connection
			// code to close connection

		}
		return row;
	}
}
//		} finally {
//			try {
//				if (pst != null) {
//					pst.close();
//				}
//				if (pst != null) {
//					pst.close();
//				}
//			} catch (SQLException e) {
//				// log the error
//				e.printStackTrace();
//			}
//		}
//	}

//	public boolean approveOrder(int id) throws SQLException {
//		try {
//		boolean rowUpdated;
//
//		query = "UPDATE dance_company.order SET approve=1 WHERE id=?";
//		pst = this.con.prepareStatement(query);
//		rowUpdated = pst.executeUpdate() > 0;
//		pst.setInt(1, id);
//		return rowUpdated;
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return false;
//	}
//	
