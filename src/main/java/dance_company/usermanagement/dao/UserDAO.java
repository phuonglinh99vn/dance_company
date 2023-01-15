package dance_company.usermanagement.dao;

import java.sql.*;
import dance_company.usermanagement.model.user;

public class UserDAO {
	public Connection con;

	public String query;
	public PreparedStatement pst;
	public ResultSet rs;

	public UserDAO(Connection con) {
		this.con = con;
	}
	
	public user userLogin(String email, String password) {
		user user = null;
        try {
            query = "select * from user where email=? and password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if(rs.next()){
            	user = new user();
            	user.setId(rs.getInt("id"));
            	user.setName(rs.getString("name"));
            	user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }
}
