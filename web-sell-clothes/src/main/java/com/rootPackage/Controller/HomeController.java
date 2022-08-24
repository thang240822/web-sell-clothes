package com.rootPackage.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.rootPackage.DAO.AccountDAO;
import com.rootPackage.DAO.CategoryDAO;
import com.rootPackage.DAO.OrderDAO;
import com.rootPackage.DAO.OrderDetailDAO;
import com.rootPackage.DAO.ProductDAO;
import com.rootPackage.Entity.Account;
import com.rootPackage.Entity.Product;
import com.rootPackage.Services.SessionService;

@Controller
public class HomeController {
	@Autowired
	SessionService SessionService;
	@Autowired
	AccountDAO accountDAO;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	OrderDetailDAO orderDetailDAO;
	@Autowired
	ProductDAO productDAO;
	@ModelAttribute("lstProduct")
	public List<Product> lstProduct(){
		
	return productDAO.findAll();
	}
	@GetMapping("index")
	public String index(Model model) {
		Account account = SessionService.get("username");
		if (account != null) {
			if (account.getAdmin()) {
				model.addAttribute("isLogin", 3);
			} else {
				model.addAttribute("isLogin", 2);
			}
			SessionService.set("username", account);
		} else {
			model.addAttribute("isLogin", 1);
		}
		model.addAttribute("pageChanged", "/views/users/home.jsp");
		return "users/index";
	}

	@GetMapping("login/form")
	public String loginForm() {
		return "users/login";
	}


	
	@GetMapping("logout")
	public String logout(Model model) {
		model.addAttribute("isLogin",1);
		SessionService.remove("username");
		model.addAttribute("pageChanged", "/views/users/home.jsp");
		return "redirect:/index";
	}

	@GetMapping("about")
	public String about(Model model) {
		model.addAttribute("pageChanged", "/views/users/about.jsp");
		return "users/index";
	}


	
}
