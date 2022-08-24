package com.rootPackage.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rootPackage.DAO.AccountDAO;
import com.rootPackage.Entity.Account;
import com.rootPackage.Services.SessionService;

@Controller
public class LoginController {
	@Autowired
	SessionService  SessionService;
	@Autowired
	AccountDAO accountDAO;
	
	@PostMapping("index")
	public String login(Model model, @RequestParam("username") String username, @RequestParam("password") String password) {
		Account account = accountDAO.findByUsername(username);
		int role = 1;
		if(account!=null && account.getPassword().equals(password)) {
			if(account.getAdmin()) {
				role=3;
				model.addAttribute("isLogin",3);
			}else {
				role=2;
				model.addAttribute("isLogin",2);
			}
			SessionService.set("islogin", role);
			SessionService.set("username",account);
		}else {
			role=1;
			model.addAttribute("isLogin",1);
			SessionService.set("islogin", role);
		}
		model.addAttribute("pageChanged","/views/users/home.jsp");
		return "users/index";
	}
}
