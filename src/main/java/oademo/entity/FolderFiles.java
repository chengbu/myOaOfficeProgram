package oademo.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.rmi.CORBA.Tie;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FolderFiles {
	private int id;	//INT	PRIMARY KEY AUTO_INCREMENT COMMENT '主键',	
	private String name;	//VARCHAR(50)	NOT NULL COMMENT '文件夹、文件标题',
	private String description;	//TEXT	COMMENT '文档内容/文件夹备注',
	private String type; //`type` VARCHAR(10) NOT NULL COMMENT '是文件夹还是文件？',
	private String fileUrl;  //VARCHAR(100) COMMENT '文档存储路径',	
	private int creatorId;	//INT	COMMENT 'foreignKey(USER) 创建者',	
	@JsonFormat(pattern="yyyy/MM/dd HH:mm:ss",timezone = "GMT+8")//显示为json的格式
	@DateTimeFormat(pattern="yyyy/MM/dd HH:mm:ss")	//接收的格式
	private Date createDate;	//DATETIME	NOT NULL COMMENT '创建日期',	
    private int parentId;	//INT	 COMMENT 'parentId',	               
	private int status;	//INT COMMENT '0(已删除)/1(使用中)状态'	
	private String size;//文档大小kb
	private String username;//创建者
	private List<FolderFiles> children=new ArrayList<FolderFiles>();
	public FolderFiles() {
		super();
		// TODO Auto-generated constructor stub
	}
	//带children
	public FolderFiles(int id, String name, String description, String type, String fileUrl, int creatorId,
			Date createDate, int parentId, int status, String size, String username, List<FolderFiles> children) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.type = type;
		this.fileUrl = fileUrl;
		this.creatorId = creatorId;
		this.createDate = createDate;
		this.parentId = parentId;
		this.status = status;
		this.size = size;
		this.username = username;
		this.children = children;
	}
	//无children
	public FolderFiles(int id, String name, String description, String type, String fileUrl, int creatorId,
			Date createDate, int parentId, int status, String size) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.type = type;
		this.fileUrl = fileUrl;
		this.creatorId = creatorId;
		this.createDate = createDate;
		this.parentId = parentId;
		this.status = status;
		this.size = size;
		this.username = username;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	public int getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public List<FolderFiles> getChildren() {
		return children;
	}
	public void setChildren(List<FolderFiles> children) {
		this.children = children;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	


	
	
}
