package oademo.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oademo.biz.MailBiz;
import oademo.entity.Mail;
import oademo.mapper.MailMapper;


@Service
public class MailBizImpl implements MailBiz {
	
	@Autowired
	private MailMapper mailMapper;

	@Override
	public void setEmailAdd(Mail mail) {
		mailMapper.draftEmailAdd(mail);
		
	}

	@Override
	public void draftEmailAdd(Mail mail) {
		mailMapper.setEmailAdd(mail);
		
	}

	@Override
	public List<Mail> receiveEmaiList( int stateId,String addresser,String addressee,String title,int importanceInt,int page,int limit) {
		
		return mailMapper.receiveEmaiList(stateId,addresser,addressee, title, importanceInt,page,limit);
	}

	

	@Override
	public List<Mail> sentEmaiList( int stateId,String addresser,String addressee,String title,int importanceInt,int page,int limit) {
		// TODO Auto-generated method stub
		return mailMapper.sentEmaiList(stateId,addresser,addressee, title, importanceInt,page,limit);
	}


	@Override
	public Mail findById(int id) {
		Mail mail =mailMapper.findById(id);
		return mail;
	}

	@Override
	public int findMailsRows(int stateId, String addresser, String addressee, String title, int importanceInt) {
		
		return mailMapper.findMailsRows(stateId,addresser,addressee,title,importanceInt);
	}
}