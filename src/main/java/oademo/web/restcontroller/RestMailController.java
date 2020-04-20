package oademo.web.restcontroller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import oademo.biz.MailBiz;
import oademo.biz.UserBiz;
import oademo.entity.Mail;
import oademo.mapper.MailMapper;

@RestController
public class RestMailController {
		
	@Autowired
	private  MailMapper mailMapper;
	
	@Autowired
	private UserBiz userBiz;
	@RequestMapping("/api/email-putList")
	@ResponseBody
	public Map<String, Object> list(
			Integer stateId,String addresser,String addressee,String title,Integer importanceInt,Integer page,Integer limit) {
		Map<String,Object> map = new HashMap<String, Object>();
		stateId=stateId==null?0:stateId;
		importanceInt=importanceInt==null?0:importanceInt;
		page=page==null?0:page-1;
		limit=limit==null?9:limit;
		
		if (stateId==3) {
			
			List<Mail> movies = mailMapper.sentEmaiList(stateId,addresser,addressee, title, importanceInt,page,limit);
			map.put("data", movies);
		}else {
			
		
			List<Mail> movies = mailMapper.receiveEmaiList(stateId,addresser,addressee, title, importanceInt,page,limit);
			map.put("data", movies);
		}
		
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", mailMapper.findMailsRows(stateId, addressee, addresser, title, importanceInt));
		//每页条数
	
		return map;
	}
		
}
