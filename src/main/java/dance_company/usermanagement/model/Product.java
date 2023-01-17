package dance_company.usermanagement.model;

import java.util.Date;


public class Product {

	public int id;
	public String name;
	public String level;
	public String teacher;
	public String image;
	public String time;
	
	public Product() {
	}
	
	public Product(String name, String level) {
		super();
		this.name = name;
		this.level = level;
	
	}
	
	public Product(int id, String time) {
		super();
		this.id = id;
		this.time = time;
	
	}
	
	
	
	public Product(int id, String name, String level, String teacher, String image, String time) {
		super();
		this.id = id;
		this.name = name;
		this.level = level;
		this.teacher = teacher;
		this.image = image;
		this.time = time;
	}

	public Product(int id, String name, String level, String teacher, String image) {
		super();
		this.id = id;
		this.name = name;
		this.level = level;
		this.teacher = teacher;
		this.image = image;
		
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
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
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", level=" + level + ", teacher=" + teacher + ", image="
				+ image + "]";
	}
}