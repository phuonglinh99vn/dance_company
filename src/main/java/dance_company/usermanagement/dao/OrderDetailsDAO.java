package dance_company.usermanagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.util.*;
import java.sql.Date;

import dance_company.usermanagement.model.*;

public class OrderDetailsDAO {
	private Connection con;

	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public OrderDetailsDAO(Connection con) {
		super();
		this.con = con;
	}

	public void addOrderDetails(OrderDetails orderDetails) throws SQLException {

//		try {
			String sql = "INSERT INTO `dance_company`.`order_details` (`order_id`, `schedule_id`) VALUES (?, ?)";

			pst = con.prepareStatement(sql);

			pst.setInt(1, orderDetails.getOrderId());
			pst.setInt(2, orderDetails.getscheduleId());

			pst.execute();

//		} finally {
//			close(con, pst, null);
//		}
	}

	private void close(Connection conn, Statement stm, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stm != null) {
				stm.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<OrderDetails> getOderDetails(int id) {
		List<OrderDetails> orderDetails = new ArrayList<>();
		try {
			query = "SELECT ods.id, userId, submitDate, od.status, order_id, sc.time, dc.name, dc.level, dc.teacher FROM dance_company.order od\r\n"
					+ "					join order_details ods on od.id = ods.order_id\r\n"
					+ "					join schedule sc on ods.schedule_id = sc.idschedule\r\n"
					+ "					join dance_class dc on sc.class_id = dc.id\r\n"
					+ "				where userId=?";

			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();

			while (rs.next()) {
				OrderDetails row = new OrderDetails();
				row.setId(rs.getInt("id"));
				row.setUserId(rs.getInt("userId"));
				row.setSubmitDate(rs.getDate("submitDate"));
				row.setStatus(rs.getString("status"));
				row.setOrderId(rs.getInt("order_id"));
				row.setName(rs.getString("name"));
				row.setLevel(rs.getString("level"));
				row.setTeacher(rs.getString("teacher"));
				row.setTime(rs.getString("time"));

				orderDetails.add(row);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return orderDetails;
	}
	
	public boolean deleteOrderDetails(int id) throws SQLException {
		boolean rowDeleted;
		
			query = "delete from order_details where id = ?;";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rowDeleted = pst.executeUpdate() > 0;
		return rowDeleted;
	}
	
	

}
