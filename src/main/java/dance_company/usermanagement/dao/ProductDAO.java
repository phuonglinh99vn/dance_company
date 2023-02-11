package dance_company.usermanagement.dao;

import java.sql.*;
import java.util.*;

import dance_company.usermanagement.model.Product;

public class ProductDAO {
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    

	public ProductDAO(Connection con) {
		super();
		this.con = con;
	}
	
	public List<Product> getAllProducts() {
	    List<Product> book = new ArrayList<>();
	    try {

	        query = "select * from dance_class";
	        pst = this.con.prepareStatement(query);
	        rs = pst.executeQuery();

	        while (rs.next()) {
	        	Product row = new Product();
	            row.setId(rs.getInt("id"));
	            row.setName(rs.getString("name"));
	            row.setTeacher(rs.getString("teacher"));
	            row.setLevel(rs.getString("level"));
	            row.setImage(rs.getString("image"));

	            book.add(row);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println(e.getMessage());
	    }
	    return book;
	}


	 public Product getSingleProduct(int id) {
		 Product row = null;
	        try {
	            query = "select * from dance_class where id=? ";

	            pst = this.con.prepareStatement(query);
	            pst.setInt(1, id);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next()) {
	            	row = new Product();
	                row.setId(rs.getInt("id"));
	                row.setName(rs.getString("name"));
	                row.setTeacher(rs.getString("teacher"));
	                row.setLevel(rs.getString("level"));
	                row.setImage(rs.getString("image"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }

	        return row;
	    }
	 public Product getSingleSchedule(int id) {
		 Product row = null;
	        try {
	        	query = "SELECT idschedule, name, level, teacher, image, time from dance_class\r\n"
	            		+ "join schedule on dance_class.id = schedule.class_id where idschedule=? ";

	            pst = this.con.prepareStatement(query);
	            pst.setInt(1, id);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next()) {
	            	row = new Product();
	                row.setId(rs.getInt("idschedule"));
	                row.setName(rs.getString("name"));
	                row.setTeacher(rs.getString("teacher"));
	                row.setLevel(rs.getString("level"));
	                row.setImage(rs.getString("image"));
	                row.setTime(rs.getString("time"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }

	        return row;
	    }
	
	public List<Product> getSchedule(int id) {
	    List<Product> schedule = new ArrayList<>();
	    try {
            query = "SELECT idschedule, name, level, teacher, image, time from dance_class\r\n"
            		+ "	join schedule on dance_class.id = schedule.class_id where id=? ";

            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
            	Product row = new Product();
            	row = new Product();
                row.setId(rs.getInt("idschedule"));
                row.setName(rs.getString("name"));
                row.setTeacher(rs.getString("teacher"));
                row.setLevel(rs.getString("level"));
	            row.setTime(rs.getString("time"));

	            schedule.add(row);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println(e.getMessage());
	    }
	    return schedule;
	}

}