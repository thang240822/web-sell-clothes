package com.rootPackage.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rootPackage.DAO.AccountDAO;
import com.rootPackage.Entity.Account;

@Controller
public class AccountController {

	@Autowired
	AccountDAO dao;

	@RequestMapping("/acc/list")
	public String list(Model model) {
		Account item = new Account();
		model.addAttribute("item", item);
		List<Account> items = dao.findAll();
		model.addAttribute("items", items);
		return "admin/list";
	}

	@RequestMapping("/acc/edit/{username}")
	public String edit(Model model, @PathVariable("username") String username) {
		Account item = dao.findById(username).get();
		model.addAttribute("item", item);
		List<Account> items = dao.findAll();
		model.addAttribute("items", items);
		return "admin/list";
	}

	@RequestMapping("/acc/create")
	public String create(Account item) {
		dao.save(item);
		return "redirect:/acc/list";
	}

	@RequestMapping("/acc/update")
	public String update(Account item) {
		dao.save(item);
		return "redirect:/acc/edit/" + item.getUsername();
	}

	@RequestMapping("/acc/delete/{username}")
	public String create(@PathVariable("username") String username) {
		dao.deleteById(username);
		return "redirect:/acc/list";
	}
}
