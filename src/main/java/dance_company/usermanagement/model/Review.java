package dance_company.usermanagement.model;

import java.sql.Date;

public class Review {
	private int reviewId;
	private int productId;
	private int userId;
	private String userName;
	private String comment;
	private int rating;
	private Date reviewDate;

	public Review(int reviewId, int productId, int userId, String userName, String comment, int rating,
			Date reviewDate) {
		this.reviewId = reviewId;
		this.productId = productId;
		this.userId = userId;
		this.userName = userName;
		this.comment = comment;
		this.rating = rating;
		this.reviewDate = reviewDate;
	}

	public Review(int reviewId, int productId, int userId, String comment, int rating, Date reviewDate) {
		super();
		this.reviewId = reviewId;
		this.productId = productId;
		this.userId = userId;
		this.comment = comment;
		this.rating = rating;
		this.reviewDate = reviewDate;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
