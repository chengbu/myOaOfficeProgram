package oademo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import oademo.entity.Mail;

public interface MailMapper {
	void setEmailAdd(Mail mail);//写好的邮件变成对方未读的邮件
	void draftEmailAdd(Mail mail);//写好的邮件变成草稿
	//检索收件箱
	List<Mail> receiveEmaiList(@Param("stateId") int stateId,@Param("addresser")String addresser,@Param("addressee")String addressee,@Param("title")String title,@Param("importanceInt")int importanceInt,@Param("page")int page,@Param("limit")int limit);
	//检索已发件箱
	List<Mail> sentEmaiList(@Param("stateId") int stateId,@Param("addresser")String addresser,@Param("addressee")String addressee,@Param("title")String title,@Param("importanceInt")int importanceInt,@Param("page")int page,@Param("limit")int limit);
	//检索收件箱的邮件数
	int findMailsRows(@Param("stateId") int stateId,@Param("addresser")String addresser,@Param("addressee")String addressee,@Param("title")String title,@Param("importanceInt")int importanceInt);
	

	//打开单个邮件
	Mail findById(@Param("id")int id);
}
