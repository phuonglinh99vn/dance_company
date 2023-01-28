package dance_company.usermanagement.model;

import java.util.Date;

public class OrderDetails {
	
	private int id;
	public int userId;
	private int scheduleId;
	private Date submitDate;
	private String status;
	private int orderId;
	public String name;
	public String level;
	public String teacher;
	public String time;
	
	public OrderDetails() {
	}

	
	
	public OrderDetails(int orderId, int scheduleId) {
		super();
		this.orderId = orderId;
		this.scheduleId = scheduleId;
	}

	public OrderDetails(int userId, Date submitDate, String status, int orderId, String name, String level,
			String teacher, String time) {
		super();
		this.userId = userId;
		this.submitDate = submitDate;
		this.status = status;
		this.orderId = orderId;
		this.name = name;
		this.level = level;
		this.teacher = teacher;
		this.time = time;
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



	public int getscheduleId() {
		return scheduleId;
	}

	public void setscheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
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

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	
	

	

	

}
