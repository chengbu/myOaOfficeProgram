DROP DATABASE IF EXISTS mycompany;
CREATE DATABASE mycompany;
USE mycompany;

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
	id	INT	PRIMARY KEY AUTO_INCREMENT COMMENT '主键',	
	NAME	VARCHAR(50)	NOT NULL COMMENT '部门名',	
	fixedPhone	VARCHAR(50)	NOT NULL COMMENT '部门固话',	
	mobilePhone	VARCHAR(50)	NOT NULL COMMENT '移动电话',	
	email	VARCHAR(50)	NOT NULL COMMENT '邮箱'	

)ENGINE INNODB;

INSERT INTO department VALUES
	(1,'后勤部','7654321','12345678123','1234567@qq.com');
INSERT INTO department VALUES
	(2,'人事部','7654321','12345678123','1234567@qq.com');
INSERT INTO department VALUES
	(3,'财务部','7654321','12345678123','1234567@qq.com');	
INSERT INTO department VALUES
	(4,'安全部','7654321','12345678123','1234567@qq.com');
INSERT INTO department VALUES
	(5,'生产部','7654321','12345678123','1234567@qq.com');
INSERT INTO department VALUES
	(6,'仓库物流部','7654321','12345678123','1234567@qq.com');
INSERT INTO department VALUES
	(7,'研发部','7654321','12345678123','1234567@qq.com');
INSERT INTO department VALUES
	(8,'销售部','7654321','12345678123','1234567@qq.com');
INSERT INTO department VALUES
	(9,'总经办','7654321','12345678123','1234567@qq.com');

DROP TABLE IF EXISTS USER;
CREATE TABLE USER (
	id INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
	username VARCHAR(50) NOT NULL COMMENT '用户名',
	PASSWORD VARCHAR(50) NOT NULL COMMENT '密码',
	phone	VARCHAR(50) NOT NULL COMMENT '手机号码',
	idNumber VARCHAR(50) NOT NULL COMMENT '身份证号码',
	email	VARCHAR(50)	NOT NULL COMMENT '邮箱',
	address	VARCHAR(128)	NOT NULL COMMENT '地址',
	age INT NOT NULL COMMENT '年龄',
	dateOfEnty DATE	NOT NULL COMMENT '入职日期',
	JobNumber INT	NOT NULL COMMENT '工号',
	gender VARCHAR(5)	NOT NULL COMMENT '性别',
	photo VARCHAR(20) NOT NULL COMMENT '照片',
	departmentId INT COMMENT '所属部门',	
	STATUS	BOOLEAN	NOT NULL COMMENT '用户状态（是否禁用）',
	remarks	VARCHAR(500)COMMENT '备注',	
	isManager BOOLEAN NOT NULL COMMENT '是否部门负责人'

)ENGINE INNODB;
ALTER TABLE USER ADD CONSTRAINT fk_user_department FOREIGN KEY(departmentId) REFERENCES department(Id);
INSERT INTO `user` VALUES
	(1,'王刚','123','12345678901','123456789987654321','11782290@qq.com','海珠区洪德路',25,'2015-1-1',1001,'男','p1.jpg',1,1,NULL,1);
INSERT INTO `user` VALUES
	(2,'李芳','123','12345678902','123456789987654322','11782291@qq.com','海珠区洪德路',26,'2015-1-1',1002,'女','p2.jpg',2,1,NULL,1);
INSERT INTO `user` VALUES
	(3,'曹霁','123','12345678903','123456789987654323','11782292@qq.com','海珠区洪德路',27,'2015-1-1',1003,'男','p1.jpg',3,1,NULL,1);
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
	id	INT	PRIMARY KEY AUTO_INCREMENT COMMENT '主键',	
	NAME	VARCHAR(50)	NOT NULL COMMENT '角色名',	
	remark	VARCHAR(128) COMMENT '备注信息'		

)ENGINE INNODB;

INSERT INTO role VALUES
	(1,'管理员','1');
INSERT INTO role VALUES
	(2,'经理','2');
INSERT INTO role VALUES
	(3,'员工','3');
	
DROP TABLE IF EXISTS `userRole`;
CREATE TABLE `userRole` (
	userId	INT COMMENT '用户ID',	
	roleId	INT COMMENT '角色ID'	

)ENGINE INNODB;

ALTER TABLE UserRole ADD CONSTRAINT fk_UserRole_Users FOREIGN KEY(UserId) REFERENCES `User`(Id);
ALTER TABLE UserRole ADD CONSTRAINT fk_UserRole_Roles FOREIGN KEY(RoleId) REFERENCES Role(Id);

INSERT INTO UserRole VALUES(1,1);
INSERT INTO UserRole VALUES(1,3);
INSERT INTO UserRole VALUES(2,2);
INSERT INTO UserRole VALUES(3,3);

DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
	id	INT	PRIMARY KEY AUTO_INCREMENT COMMENT '主键',	
	NAME	VARCHAR(20)	NOT NULL COMMENT '权限名',	
	CODE	VARCHAR(20)	NOT NULL COMMENT '权限编号，在授权时和菜单中使用',	
        parentId	INT	COMMENT 'parentId'              

)ENGINE INNODB;

INSERT INTO Permission VALUES(10,'组织机构功能','org',NULL);
INSERT INTO Permission VALUES(11,'部门管理','org-dept',10);
INSERT INTO Permission VALUES(12,'员工管理','org-emp',10);
INSERT INTO Permission VALUES(20,'个人事务功能','personal',NULL);
INSERT INTO Permission VALUES(21,'时间表','personal-scheduler',20);
INSERT INTO Permission VALUES(22,'日程管理','personal-meeting',20);
INSERT INTO Permission VALUES(30,'权限功能','security',NULL);
INSERT INTO Permission VALUES(31,'用户管理','security-user',30);
INSERT INTO Permission VALUES(32,'角色维护','security-role',30);
INSERT INTO Permission VALUES(40,'文件功能','security',NULL);
INSERT INTO Permission VALUES(41,'文件管理','security-user',40);
INSERT INTO Permission VALUES(42,'文档管理','security-role',40);

DROP TABLE IF EXISTS `rolePermission`;
CREATE TABLE `rolePermission` (
	roleId	INT COMMENT '角色ID',
	permissionId INT COMMENT '权限ID'

)ENGINE INNODB;

ALTER TABLE RolePermission ADD CONSTRAINT fk_RolePermission_Role FOREIGN KEY(RoleId) REFERENCES Role(Id);
ALTER TABLE RolePermission ADD CONSTRAINT fk_RolePermission_Permission FOREIGN KEY(PermissionId) REFERENCES Permission(Id);
INSERT INTO RolePermission VALUES(1,30);
INSERT INTO RolePermission VALUES(1,31);
INSERT INTO RolePermission VALUES(1,32);
INSERT INTO RolePermission VALUES(2,20);
INSERT INTO RolePermission VALUES(2,21);
INSERT INTO RolePermission VALUES(2,22);
INSERT INTO RolePermission VALUES(3,10);
INSERT INTO RolePermission VALUES(3,11);
INSERT INTO RolePermission VALUES(3,12);
INSERT INTO RolePermission VALUES(1,40);
INSERT INTO RolePermission VALUES(1,41);
INSERT INTO RolePermission VALUES(1,42);

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
	id	INT	PRIMARY KEY AUTO_INCREMENT COMMENT '主键',	
	title	VARCHAR(50)	NOT NULL COMMENT '标题',		
	description	TEXT	NOT NULL COMMENT '内容',		
	typeInt	INT	COMMENT '0(娱乐)/1(商务)/2(事务）类型',		
	startTime	DATETIME	NOT NULL COMMENT '开始时间',		
	endTime	DATETIME	NOT NULL COMMENT '结束时间',		
	address	VARCHAR(200) NOT NULL COMMENT '地址',		
	creatorId	INT	COMMENT '创建者(引用用户表用户)',		
	createTime	DATETIME	NOT NULL COMMENT '创建时间'		

)ENGINE INNODB;

ALTER TABLE `schedule` ADD CONSTRAINT fk_schedule_User FOREIGN KEY(creatorId) REFERENCES `User`(ID);
INSERT INTO `schedule` VALUES
	(1,'周末加班1','重大项目1',1,'2019-10-10 10：00','2019-10-10 12：00','小会议室',1,'2019-10-9 10：00');
INSERT INTO `schedule` VALUES
	(2,'周末加班2','重大项目2',1,'2019-10-10 10：00','2019-10-10 12：00','小会议室',1,'2019-10-9 10：00');
INSERT INTO `schedule` VALUES
	(3,'周末加班3','重大项目3',1,'2019-10-10 10：00','2019-10-10 12：00','小会议室',1,'2019-10-9 10：00');

DROP TABLE IF EXISTS `scheduleParticipant`;
CREATE TABLE `scheduleParticipant` (
	scheduleId	INT COMMENT '日程ID',		
	userId	INT COMMENT '参与者ID'		

)ENGINE INNODB;

ALTER TABLE `scheduleParticipant` ADD CONSTRAINT fk_sp_schedule FOREIGN KEY(scheduleId) REFERENCES `schedule`(ID);
ALTER TABLE `scheduleParticipant` ADD CONSTRAINT fk_sp_user FOREIGN KEY(userId) REFERENCES `user`(ID);
INSERT INTO scheduleParticipant VALUES(1,1);
INSERT INTO scheduleParticipant VALUES(1,3);
INSERT INTO scheduleParticipant VALUES(2,2);
INSERT INTO scheduleParticipant VALUES(3,3);

DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
	id	INT	PRIMARY KEY AUTO_INCREMENT COMMENT '主键',	
	scheduleId INT COMMENT 'foreignKey(Schedule)日程',
	approverId	INT	COMMENT 'foreignKey(USER)审批者',	
	statusInt	INT COMMENT '0(不通过)/1(审批中)/2(通过）状态',		
	approverTime	DATETIME NOT NULL COMMENT '时间'
	#title	varchar(50)	 COMMENT 'foreignKey(SCHEDULE)标题',	
	#description	text	 COMMENT 'foreignKey(SCHEDULE)内容',	
	#creatorId	varchar(50)	 COMMENT 'foreignKey(USER)创建者'	
		
)ENGINE INNODB;

ALTER TABLE document ADD CONSTRAINT fk_document_schedule FOREIGN KEY(scheduleId) REFERENCES `schedule`(Id);
ALTER TABLE document ADD CONSTRAINT fk_document_user FOREIGN KEY(approverId) REFERENCES `user`(Id);
INSERT INTO document VALUES
	(1,1,1,1,'2019-10-11 13:00');
INSERT INTO document VALUES
	(2,2,1,3,'2019-10-11 13:00');	
INSERT INTO document VALUES
	(3,3,1,2,'2019-10-11 13:00');


DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
	id	INT	PRIMARY KEY AUTO_INCREMENT COMMENT '主键',	
	addresser	VARCHAR(50)	NOT NULL COMMENT '发件人',
	getEmail VARCHAR(50)	COMMENT 'foreignKey(USER)收件人',	
	title	VARCHAR(50)	NOT NULL COMMENT '邮件标题',
	accessorySite	VARCHAR(50)	NOT NULL COMMENT '附件',
	description	TEXT	NOT NULL COMMENT '邮件内容',	
	writeTime	DATETIME	NOT NULL COMMENT '书写时间',	
	importanceInt	INT COMMENT '0(普通)/1(重要)/2(紧急）重要性',		
	stateId	INT COMMENT '状态（1.草稿，2.已发，3.未读，4.已读，5.垃圾箱）'	
	
)ENGINE INNODB;

ALTER TABLE mail ADD CONSTRAINT fk_mail_user FOREIGN KEY(creatorId) REFERENCES `user`(Id);
INSERT INTO mail VALUES
	(1,'吃鸡1','吃鸡','2019-10-19 20：00',1,2,'11782291@qq.com','11782292@qq.com');
INSERT INTO mail VALUES
	(2,'吃鸡2','吃鸡','2019-10-19 20：00',1,2,'11782292@qq.com','11782293@qq.com');
INSERT INTO mail VALUES
	(3,'吃鸡3','吃鸡','2019-10-19 20：00',1,2,'11782293@qq.com','11782291@qq.com');

DROP TABLE IF EXISTS `annex`;
CREATE TABLE `annex` (
	id	INT	PRIMARY KEY COMMENT '主键',	
	NAME	VARCHAR(50)	NOT NULL COMMENT '附件名',	
	content	TEXT	NOT NULL COMMENT '内容',	
	fileName	VARCHAR(100)	NOT NULL COMMENT '文件路径'	
 
)ENGINE INNODB;

INSERT INTO annex VALUES
	(1,'客户名单1','王王1，兔兔','文件夹/子文件夹');
INSERT INTO annex VALUES
	(2,'客户名单2','王王2，兔兔','文件夹/子文件夹');
INSERT INTO annex VALUES
	(3,'客户名单3','王王2，兔兔','文件夹/子文件夹');

DROP TABLE IF EXISTS `annexMail`;
CREATE TABLE `annexMail` (
	annexId	INT	COMMENT 'foreignKey(annex)附件ID',	
	mailId	INT	COMMENT 'foreignKey(role)邮件ID'	

)ENGINE INNODB;

ALTER TABLE annexMail ADD CONSTRAINT fk_annexMail_annex FOREIGN KEY(annexId) REFERENCES annex(Id);
ALTER TABLE annexMail ADD CONSTRAINT fk_annexMail_mail FOREIGN KEY(mailId) REFERENCES mail(Id);
INSERT INTO annexMail VALUES(1,2);
INSERT INTO annexMail VALUES(1,2);
INSERT INTO annexMail VALUES(2,1);
INSERT INTO annexMail VALUES(2,3);
INSERT INTO annexMail VALUES(3,2);
INSERT INTO annexMail VALUES(3,2);

DROP TABLE IF EXISTS `getEmail`;
CREATE TABLE `getEmail` (
	id	INT	PRIMARY KEY AUTO_INCREMENT COMMENT '主键',	
	recipeTime	DATETIME COMMENT '接收时间',	
	recipientId INT  COMMENT '接收邮件引用mail表'
)ENGINE INNODB;

ALTER TABLE getEmail ADD CONSTRAINT fk_getEmail_mail FOREIGN KEY(recipientId) REFERENCES mail(Id);
INSERT INTO getEmail VALUES(1,'2019-10-19 10:20',1);
INSERT INTO getEmail VALUES(2,'2019-10-19 10:20',2);
INSERT INTO getEmail VALUES(3,'2019-10-19 10:20',3);

DROP TABLE IF EXISTS `folder`;
CREATE TABLE `folder` (
	id	INT	PRIMARY KEY AUTO_INCREMENT COMMENT '主键',	
	title	VARCHAR(50)	NOT NULL COMMENT '文件夹标题',	
	creatorId	INT	COMMENT 'foreignKey(USER) 创建者',	
	createDate	DATETIME	NOT NULL COMMENT '创建日期',	
        parentId	INT	 COMMENT 'parentId',	               
	`status`	INT COMMENT '0(已删除)/1(使用中)状态'	 	
)ENGINE INNODB;
ALTER TABLE folder ADD CONSTRAINT fk_folder_user FOREIGN KEY(creatorId) REFERENCES `user`(Id);
INSERT INTO folder VALUES(10,'生产日程',2,'2019-10-10 10：00',NULL,1);
INSERT INTO folder VALUES(11,'生产日程1',2,'2019-10-10 10：00',10,1);
INSERT INTO folder VALUES(20,'生产日程',2,'2019-10-10 10：00',NULL,1);
INSERT INTO folder VALUES(21,'生产日程1',2,'2019-10-10 10：00',20,1);

DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
	id	INT	PRIMARY KEY AUTO_INCREMENT COMMENT '主键',	
	title	VARCHAR(50)	NOT NULL COMMENT '文档标题',	
	description	TEXT	NOT NULL COMMENT '文档内容',	
	creatorId	INT	COMMENT 'foreignKey(USER)创建者',	
	createDate	DATETIME	NOT NULL COMMENT '创建日期',
	inFolderId	INT COMMENT '存在与哪一个文件夹',	
	`status` INT	COMMENT '0(已删除)/1(使用中)状态'	
)ENGINE INNODB;
ALTER TABLE files ADD CONSTRAINT fk_files_user FOREIGN KEY(creatorId) REFERENCES `user`(Id);
ALTER TABLE files ADD CONSTRAINT fk_files_folder FOREIGN KEY(inFolderId) REFERENCES folder(Id);
INSERT INTO files VALUES(1,'员工建议','少一些加班',1,'2019-10-10 10：20',21,1);
INSERT INTO files VALUES(2,'员工建议','少一些加班',1,'2019-10-10 10：20',11,1);
INSERT INTO files VALUES(3,'员工建议','少一些加班',1,'2019-10-10 10：20',20,1);
INSERT INTO files VALUES(4,'员工建议','少一些加班',1,'2019-10-10 10：20',21,1);
	
DROP TABLE IF EXISTS `filesAnnex`;
CREATE TABLE `filesAnnex` (
	filesId	INT	COMMENT 'foreignKey(files)文档ID',
	annexId	INT	COMMENT 'foreignKey(annex)附件ID'			
)ENGINE INNODB;
ALTER TABLE filesAnnex ADD CONSTRAINT fk_filesAnnex_annex FOREIGN KEY(annexId) REFERENCES `annex`(Id);
ALTER TABLE filesAnnex ADD CONSTRAINT fk_filesAnnex_files FOREIGN KEY(filesId) REFERENCES `files`(Id);
INSERT INTO filesAnnex VALUES(1,1);
INSERT INTO filesAnnex VALUES(1,2);
INSERT INTO filesAnnex VALUES(2,1);
INSERT INTO filesAnnex VALUES(3,1);


	
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
	permissionId	INT	COMMENT 'foreignKey(permission)权限ID',	
	NAME	VARCHAR(50)	COMMENT 'foreignKey(permission)权限名',	
	CODE	VARCHAR(50)	COMMENT 'foreignKey(permission)权限编号',	
	entry	INT	NOT NULL COMMENT '界面入口',	
	icon	INT	COMMENT 'foreignKey(annex)图标',	
	parentId	INT	COMMENT 'foreignKey(permission)parentId'	
)ENGINE INNODB;
INSERT INTO Menu VALUES(10,'组织机构功能','org','org/index','1.ico',NULL);
INSERT INTO Menu VALUES(11,'部门管理','org-dept','org/dept-list','1.ico',10);
INSERT INTO Menu VALUES(12,'员工管理','org-emp','org/emp-list','1.ico',10);
INSERT INTO Menu VALUES(20,'个人事务功能','personal','personal/index','1.ico',NULL);
INSERT INTO Menu VALUES(21,'时间表','personal-scheduler','personal/scheduler','1.ico',20);
INSERT INTO Menu VALUES(22,'日程管理','personal-meeting','personal/meeting','1.ico',20);
INSERT INTO Menu VALUES(30,'权限管理功能','security','security/index','1.ico',NULL);
INSERT INTO Menu VALUES(31,'用户管理','security-user','security/user-list','1.ico',30);
INSERT INTO Menu VALUES(32,'角色维护','security-role','security/role-list','1.ico',30);
INSERT INTO Menu VALUES(40,'文件功能','folder-files','folder/index','1.ico',NULL);
INSERT INTO Menu VALUES(41,'文件管理','folder-folder','folder/folder-list','1.ico',40);
INSERT INTO Menu VALUES(42,'文档管理','folder-files','files/files-list','1.ico',40);

