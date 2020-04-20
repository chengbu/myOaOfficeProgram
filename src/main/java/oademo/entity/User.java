package oademo.entity;

import java.sql.Date;

public class User {
	private int id; 
	private String username;
	private String password;
	private String phone;
	private String idNumber;
	private String email;
	private String address;
	private int age;
	private Date dateOfEnty;
	private int jobNumber;
	private String gender;
	private String photo;
	private int departmentId;
	private boolean status;
	private String remarks;
	private boolean isManager;
	public User() {}
	//带idNumer的构造方法
	public User(int id, String username, String password, String phone, String idNumber, String email, String address,
			int age, Date dateOfEnty, int jobNumber, String gender, String photo, int departmentId, boolean status,
			String remarks, boolean isManager) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.idNumber = idNumber;
		this.email = email;
		this.address = address;
		this.age = age;
		this.dateOfEnty = dateOfEnty;
		this.jobNumber = jobNumber;
		this.gender = gender;
		this.photo = photo;
		this.departmentId = departmentId;
		this.status = status;
		this.remarks = remarks;
		this.isManager = isManager;
	}
	//没有idNumer的构造方法
	public User(int id, String username, String password, String phone, String email, String address, int age,
			Date dateOfEnty, int jobNumber, String gender, String photo, int departmentId, boolean status,
			String remarks, boolean isManager) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.age = age;
		this.dateOfEnty = dateOfEnty;
		this.jobNumber = jobNumber;
		this.gender = gender;
		this.photo = photo;
		this.departmentId = departmentId;
		this.status = status;
		this.remarks = remarks;
		this.isManager = isManager;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Date getDateOfEnty() {
		return dateOfEnty;
	}
	public void setDateOfEnty(Date dateOfEnty) {
		this.dateOfEnty = dateOfEnty;
	}
	public int getJobNumber() {
		return jobNumber;
	}
	public void setJobNumber(int jobNumber) {
		this.jobNumber = jobNumber;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public boolean getStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public boolean getIsManager() {
		return isManager;
	}
	public void setManager(boolean isManager) {
		this.isManager = isManager;
	}
	


}
