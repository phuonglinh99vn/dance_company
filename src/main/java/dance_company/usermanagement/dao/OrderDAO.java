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
//		Connection con = null;
//		PreparedStatement pstm = null;
//		ResultSet rs = null;

		try {
			// create sql for insert
			String sql = "INSERT INTO `dance_company`.`order` (`userId`, `submitDate`, `status`) VALUES (?,?,?)";
			pst = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			// set params
			pst.setInt(1, order.getUserId());
			pst.setDate(2, new Date(System.currentTimeMillis()));
			pst.setString(3, order.getStatus());

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
	
	public List<Order> getAllOrders(int id) {
		List<Order> order = new ArrayList<>();
	    try {

	        query = "select * from order where userId=?";
	        pst = this.con.prepareStatement(query);
	        rs = pst.executeQuery();

	        while (rs.next()) {
	        	Order row = new Order();
	            row.setId(rs.getInt("id"));
	            row.setUserId(rs.getInt("userId"));
	            row.setSubmitDate(rs.getDate("submitDate"));
	            row.setStatus(rs.getString("status"));
	            

	            order.add(row);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println(e.getMessage());
	    }
	    return order;
	} 

}
