package dance_company.usermanagement.dao;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.*;

import dance_company.usermanagement.model.*;

public class UserDAO {
	public Connection con;

	public String query;
	public PreparedStatement pst;
	public ResultSet rs;

	public UserDAO() {}
	
	public UserDAO(Connection con) {
		super();
		this.con = con;
	}

	public User userLogin(String email, String password) {
		User user = null;
		try {
			query = "select * from user where email=? and password=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		return user;
	}

	public void insertUser(User user) throws SQLException {

		try {

			query = "INSERT INTO user" + "  (name, email, password, mobile) VALUES " + " (?, ?, ?, ?);";
			pst = this.con.prepareStatement(query);
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getMobile());
			System.out.println(pst);
			pst.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public User selectUser(int id) {
		User user = null;
		try {

			query = "select id,name,email,password from user where id =?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			System.out.println(pst);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String password = rs.getString("password");
				user = new User(id, name, email, password);
			}
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return user;
	}

	public List<User> selectAllUsers() {

		List<User> users = new ArrayList<>();
		
		try {
			query = "select * from user";
	        pst = this.con.prepareStatement(query);
	        rs = pst.executeQuery();

			while (rs.next()) {
				User row = new User();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name")); 
				row.setEmail(rs.getString("email"));
				row.setPassword(rs.getString("password"));
				row.setMobile(rs.getString("mobile"));
				users.add(row);
			}
		} catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println(e.getMessage());
		}
		return users;
	}

	public boolean deleteUser(int id) throws SQLException {
		boolean rowDeleted;
		
			query = "delete from user where id = ?;";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rowDeleted = pst.executeUpdate() > 0;
		return rowDeleted;
	}

	public boolean updateUser(User User) throws SQLException {
		boolean rowUpdated;
			
			query = "update user set name = ?,email= ?, password =? where id = ?;";
			pst = this.con.prepareStatement(query);
			pst.setString(1, User.getName());
			pst.setString(2, User.getEmail());
			pst.setString(3, User.getPassword());
			pst.setInt(4, User.getId());

			rowUpdated = pst.executeUpdate() > 0;
		return rowUpdated;
	}
	

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}
