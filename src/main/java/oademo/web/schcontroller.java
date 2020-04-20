package oademo.web;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.SimpleTimeZone;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import oademo.biz.ScheduleBiz;
import oademo.biz.UserBiz;
import oademo.entity.Schedule;
import oademo.entity.User;

@Controller
public class schcontroller {
	@Autowired
	private ScheduleBiz schedulebiz;
	@Autowired
	private UserBiz userbiz;
	
	
	@RequestMapping("/date-endit")
	public String dateenit(Model model) {
		model.addAttribute("toolsRows", schedulebiz.fetchscheduleRows(0, null));
		return "date-endit";
	}
	
	//数据接口
	@RequestMapping("/dates")
	@ResponseBody
	public List<Schedule> dates(Integer page,Integer limit) {
		page=page==null?1:page;
		limit=limit==null?10:limit;
		return schedulebiz.findByIdTitle(0, null, page, limit);
	}
	
	//跳转编辑页面
	@RequestMapping("/endit")
	public String endit(Model model,int id) {	
			model.addAttribute("findid", schedulebiz.findById(id));
			return "endit";					
	}
	//跳转的页面
	@RequestMapping("/endits")
	public String endits() {		
		return "endit";		
	}
	 //发送删除请求到后台
	@RequestMapping(value="/menu/delete")
	public String enditsdel(int id) {		
		schedulebiz.delete(id);
		return "date-endit";
	}
	//
	@RequestMapping("/canendit")
	public String canendit(Model model,int id) {
		model.addAttribute("findid", schedulebiz.findById(id));
		return "endit-two";		
	}
	
	@RequestMapping("/findid")
	@ResponseBody
	public Schedule findid(Integer id) {	
		id=id==null?0:id;
		return schedulebiz.findById(id);
	}
	
	@RequestMapping("/date")
	public String date(Model model,String username) {
		model.addAttribute("users", userbiz.username(username));
		return "date";
	}
	
	//定制会议保存
	@RequestMapping(value = "datesave",method = RequestMethod.POST)
	public String datesaves(Model model,Schedule schedule,@RequestParam(value="userid[]") List<Integer>  userid) {
		for(int i=0;i<userid.size();i++) {
			User user=userbiz.checkusername(userid.get(i));
			schedule.setCreateTime(new Timestamp(System.currentTimeMillis()));
			schedule.setCreatorId(user.getId());
			schedulebiz.add(schedule);
		}		
		return "redirect:/date-endit";		
	}
	
	@RequestMapping("users")
	@ResponseBody
	public List<User> User(String username){
		return userbiz.username(username);		
	}
	
	@RequestMapping("/date-index")
	public String dateindex(Model model) {		
		return "date-index";
	}
	@RequestMapping("/datelogin")
	public String datelogin() {
		return "datelogin";
	}
	
	@RequestMapping("/indate")
	public String indate(Model model,String username) {	
		model.addAttribute("users", userbiz.username(username));
		return "indate";
	}
}
