package oademo.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Mail {
	private int id;	
	private String addresser;
	private String addressee;
	private String title;
	private String accessorySite;
	private String description;
	@JsonFormat(pattern="yyyy/MM/dd HH:mm:ss",timezone = "GMT+8")//显示为json的格式
	@DateTimeFormat(pattern="yyyy/MM/dd HH:mm:ss")	//接收的格式
	private Date writeTime;
	private int importanceInt;
	private int stateId;
	public Mail() {}
	public Mail(int id, String addresser, String addressee, String title, String accessorySite, String description,
			Date writeTime, int importanceInt, int stateId) {
		super();
		this.id = id;
		this.addresser = addresser;
		this.addressee = addressee;
		this.title = title;
		this.accessorySite = accessorySite;
		this.description = description;
		this.writeTime = writeTime;
		this.importanceInt = importanceInt;
		this.stateId = stateId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAddresser() {
		return addresser;
	}
	public void setAddresser(String addresser) {
		this.addresser = addresser;
	}
	public String getAddressee() {
		return addressee;
	}
	public void setAddressee(String addressee) {
		this.addressee = addressee;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAccessorySite() {
		return accessorySite;
	}
	public void setAccessorySite(String accessorySite) {
		this.accessorySite = accessorySite;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getWriteTime() {
		return writeTime;
	}
	public void setWriteTime(Date writeTime) {
		this.writeTime = writeTime;
	}
	public int getImportanceInt() {
		return importanceInt;
	}
	public void setImportanceInt(int importanceInt) {
		this.importanceInt = importanceInt;
	}
	public int getStateId() {
		return stateId;
	}
	public void setStateId(int stateId) {
		this.stateId = stateId;
	}
	

}
