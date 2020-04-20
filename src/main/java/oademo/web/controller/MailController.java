package oademo.web.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import oademo.biz.MailBiz;
import oademo.biz.UserBiz;
import oademo.entity.Mail;
import oademo.entity.User;

@Controller
public class MailController {
	@Autowired
	private  MailBiz mailBiz;
	@Autowired
	private  UserBiz userBiz;
	//发邮件
	@RequestMapping("/email-save")
	public String emailStatusList(Model model,String addresser, String addressee, String title, String description,
			 int importanceInt,int stateId) {
		Mail mail =new Mail(0,addresser,addressee,title, null, description,
				new Date(System.currentTimeMillis()), importanceInt, stateId);
		if (stateId==1) {
			
			mailBiz.draftEmailAdd(mail);
		}else if (stateId==2){
			mailBiz.setEmailAdd(mail);
			
		}else {
			return "redirect:/index";
		}
		 
		return "redirect:/email-write-ok";
	}
	
		
	@RequestMapping("/email-write-ok")
	public String emailwriteok() {
		
		return "email-write-ok";
	}
}
