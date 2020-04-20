package oademo.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import oademo.biz.MailBiz;
import oademo.biz.UserBiz;
import oademo.entity.Mail;
import oademo.entity.User;


@Controller
public class HomeController {
	@Autowired
	private  MailBiz mailBiz;
	
	@Autowired
	private UserBiz userBiz;
	//登录验证
		@RequestMapping(value = "/login", method = RequestMethod.POST)
		public String login(Model model,String username, String password, HttpSession session) {
			User loginUser = userBiz.checkLogin(username, password);
			List<User> User= userBiz.userList();
			if(loginUser!=null) {
				//所有员工
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("User", User);
			
				

				return "redirect:/index";
			}else {

				model.addAttribute("error", "用户名或密码有误");
				return "login";
			}
		}
		//注册页面
		@RequestMapping(value = "/register", method = RequestMethod.GET)
		public String register(Model model) {
			
			return "register";
		}
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	@RequestMapping("/datepicker")
	public String datepicker() {
		return "datepicker";
	}
	@RequestMapping("/modal")
	public String modal() {
		return "modal";
	}
	@RequestMapping("/movies")
	public String movies() {
		return "movies";
	}
	@RequestMapping("/typeahead")
	public String typeahead() {
		return "typeahead";
	}
	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/user-add")
	public String userAdd() {
		return "user-add";
	}
	@RequestMapping("/user-info")
	public String userInfo() {
		return "user-info";
	}
	@RequestMapping("/user-code")
	public String userCode() {
		return "user-code";
	}
	@RequestMapping("/user-list")
	public String userList() {
		return "user-list";
	}
	@RequestMapping("/permission")
	public String permission() {
		return "permission";
	}
	@RequestMapping("/user-role")
	public String userRole() {
		return "user-role";
	}
	@RequestMapping("/folder-files")
	public String folderFiles() {
		return "folder-files";
	}
	@RequestMapping(value = "/email-putList", method = RequestMethod.GET)
	public String emailPutList(Model model, 
			@RequestParam(name = "stateId",required = false,defaultValue = "0")int stateId,
			@RequestParam(name = "addresser",required = false,defaultValue = "null")String addresser,
			@RequestParam(name = "addressee",required = false,defaultValue = "null")String addressee,
			@RequestParam(name = "title",required = false,defaultValue = "null")String title,
		Integer importanceInt) {
		
		if (stateId==1) {
			model.addAttribute("state", "草稿箱");
			model.addAttribute("stateId", 1);
			
		}else if (stateId==3) {
			model.addAttribute("state", "已发邮件");
			model.addAttribute("stateId", 3);
			
		}else if (stateId==0){
			model.addAttribute("state", "收件箱");
			model.addAttribute("stateId", 0);
			
		}

		importanceInt=importanceInt==null?0:importanceInt;
		model.addAttribute("addresser", addresser);
		model.addAttribute("addressee", addressee);
		model.addAttribute("title", title);
		model.addAttribute("importanceInt", importanceInt);
		
		return "email-putList";
		
	}	
	//查看单个邮件
	@RequestMapping(value = "/email-statusList", method = RequestMethod.GET)
		public String emailStatusList(Model model,Integer id) {
		Mail movies =mailBiz.findById(id);
		model.addAttribute("movies", movies);
			return "email-statusList";
		}
	@RequestMapping("/email-write")
	public String emailWrite() {

		return "email-write";
	}


}
