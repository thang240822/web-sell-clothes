package com.rootPackage.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.rootPackage.Entity.Account;
import com.rootPackage.Services.SessionService;

@Controller
public class AdminController {

	@Autowired
	SessionService sessionService;
	
	@GetMapping("admin/index")
	public String adminForm() {
		Account account = sessionService.get("username");
		
		if(account!= null && account.getAdmin()==true) {
			return "admin/ManagementUser";
		}else {
			return "users/index";
		}
		
		
	}
}
