package dance_company.usermanagement.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dance_company.usermanagement.model.*;

public class ReviewDAO {
  private Connection connection;

  public ReviewDAO(Connection connection) {
    this.connection = connection;
  }

  public void insertReview(Review review) throws SQLException {
    PreparedStatement pst = connection.prepareStatement(
        "INSERT INTO review (product_id, user_id, rating, comment, date) VALUES (?, ?, ?, ?, ?)");
    pst.setInt(1, review.getProductId());
    pst.setInt(2, review.getUserId());
    pst.setInt(3, review.getRating());
    pst.setString(4, review.getComment());
    pst.setDate(5, new Date(System.currentTimeMillis()));
    pst.executeUpdate();
  }

  public List<Review> getReviewsByProductId(int productId) throws SQLException {
    PreparedStatement pst = connection.prepareStatement(
        "SELECT review.*, user.id, user.name \r\n"
        + "FROM dance_company.review\r\n"
        + "join user on review.user_id = user.id WHERE product_id = ?");
    pst.setInt(1, productId);
    ResultSet rs = pst.executeQuery();
    List<Review> reviews = new ArrayList<>();
    while (rs.next()) {
      int id = rs.getInt("id");
      int userId = rs.getInt("user_id");
      String userName = rs.getString("name");
      int rating = rs.getInt("rating");
      String comment = rs.getString("comment");
      Date date = rs.getDate("date");
      Review review = new Review(id, productId, userId, userName, comment, rating, date);
      reviews.add(review);
    }
    return reviews;
  }
}
