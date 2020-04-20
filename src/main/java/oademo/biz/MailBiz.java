package oademo.biz;

import java.util.List;

import oademo.entity.Mail;

public interface MailBiz {
		void setEmailAdd(Mail mail);//写好的邮件变成对方未读的邮件
		void draftEmailAdd(Mail mail);//写好的邮件变成草稿
		//检索收件箱
		List<Mail> receiveEmaiList(int stateId,String addresser,String addressee,String title,int importanceInt,int page,int limit);
		
		//检索已发状态邮件
		List<Mail> sentEmaiList(int stateId,String addresser,String addressee,String title,int importanceInt,int page,int limit);
		//检索收件箱的邮件数
		int findMailsRows(int stateId,String addresser,String addressee,String title,int importanceInt);

		//打开单个邮件
		Mail findById(int id);
}
