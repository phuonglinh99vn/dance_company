package dance_company.usermanagement.model;

import java.util.Date;

public class Order {
	private int id;
	private int userId;
	private Date submitDate;
	private String status;
	
	public Order() {
		super();
	}

	public Order(int id, int userId, Date submitDate, String status) {
		super();
		this.id = id;
		this.userId = userId;
		this.submitDate = submitDate;
		this.status = status;
	}

	public Order(int userId, String status) {
		super();
		this.userId = userId;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
}
