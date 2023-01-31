package dance_company.usermanagement.dao;

import java.sql.*;
import dance_company.usermanagement.model.User;
public class UserDatabase {
    Connection con ;

    public UserDatabase(Connection con) {
        this.con = con;
    }
    
    //for register user 
    public boolean saveUser(User User){
        boolean set = false;
        try{
            //Insert register data to database
            String query = "insert into user(name,email,password) values(?,?,?)";
           
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setString(1, User.getName());
           pt.setString(2, User.getEmail());
           pt.setString(3, User.getPassword());
           
           pt.executeUpdate();
           set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
}


