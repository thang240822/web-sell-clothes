package com.rootPackage.Controller;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Optional;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.rootPackage.DAO.AccountDAO;
import com.rootPackage.Entity.Account;
import com.rootPackage.Services.SessionService;

@Controller
public class UserInfomationController {
	@Autowired
	SessionService sessionService;
	@Autowired
	AccountDAO accountDAO;
	@Autowired
	ServletContext app;
	@GetMapping("/infomation")
	public String indexInfomation(Model model) {
		Account account = sessionService.get("username");
		model.addAttribute("account", account);
		model.addAttribute("photos", account.getPhoto());
		model.addAttribute("isLogin", account.getAdmin() ? 3 : 2);
		model.addAttribute("pageChanged", "/views/users/infomation.jsp");
		return "users/index";
	}
	@RequestMapping("/infomation/create")
	public String create(Model model, 
			@RequestParam("username") String username
			, @RequestParam("password") String password
			, @RequestParam("fullname") String fullname
			, @RequestParam("email") String email		
			, @RequestParam("photo") MultipartFile photo
			) {
		if(username == null || password == null || fullname == null || email == null ) {
			model.addAttribute("successCreate", "FAILED");
			return "redirect:/infomation";
		}else {
			boolean settingImage = false;
			try {
				Path path = Paths.get(app.getRealPath("/")+ "views/uploads/users");
				InputStream ips = photo.getInputStream();
				Files.copy(ips, path.resolve(photo.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);
				settingImage = true;
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("create accout: "+ e.getMessage());
			}
			Account account = new Account();
			Account oldAccount = sessionService.get("username");
			account.setUsername(username);
			account.setPassword(password);
			account.setEmail(email);
			account.setFullname(fullname);
			
			if(accountDAO.findByUsername(username)==null) {
				account.setPhoto(photo.getOriginalFilename());
			}else {
				if(settingImage) {
					account.setPhoto(photo.getOriginalFilename());
				}else {
					account.setPhoto(accountDAO.findByUsername(username).getPhoto());
				}
				
			}
			
				account.setActivated(oldAccount.getActivated());
			
			
			account.setAdmin(oldAccount.getAdmin());
			accountDAO.save(account);
			model.addAttribute("successCreate", "SUCCESS");
			sessionService.set("username", account);
			return "redirect:/infomation";
		}
		
		
	}
}
