package oademo.entity;

import java.sql.Timestamp;

public class Schedule {
    private int id;
    private String title;
    private String description;
    private int typeInt;
    private Timestamp  startTime;
    private Timestamp endTime;
    private String address;
    private int creatorId;
    private String username;
    private Timestamp createTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getTypeInt() {
		return typeInt;
	}
	public void setTypeInt(int typeInt) {
		this.typeInt = typeInt;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public Schedule() {}
	public Schedule(int id, String title, String description, int typeInt, Timestamp startTime, Timestamp endTime,
			String address, int creatorId, String username, Timestamp createTime) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.typeInt = typeInt;
		this.startTime = startTime;
		this.endTime = endTime;
		this.address = address;
		this.creatorId = creatorId;
		this.username = username;
		this.createTime = createTime;
	}
    
}
