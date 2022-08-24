package com.rootPackage.Controller;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.rootPackage.DAO.AccountDAO;
import com.rootPackage.Entity.Account;
import com.rootPackage.Services.SessionService;

@Controller
public class ManagementUserController {
	@Autowired
	SessionService sessionService;
	@Autowired
	AccountDAO accountDAO;
	@Autowired
	ServletContext app;

	@ModelAttribute("lstAccount")
	public List<Account> lstAccount(){
		
	return accountDAO.findAll();
	}

	@GetMapping("/ManagementAccount")
	public String indexManagementAccount(Model model) {
		Account a = sessionService.get("username");
		if (a == null) {
			model.addAttribute("isLogin", 1);
			return "redirect:/index";
		}
//		model.addAttribute("lstAccount", accountDAO.findAll());
		model.addAttribute("pageAdminChanged", "/views/admin/ManagementUser.jsp");
		return "admin/indexAdmin";
	}

	@RequestMapping("/ManagementAccount/edit/{username}")
	public String edit(Model model, @PathVariable("username") String username) {
		Account account = new Account();
		account = accountDAO.findByUsername(username);
		model.addAttribute("account", account);
		model.addAttribute("photos", account.getPhoto());
		model.addAttribute("pageAdminChanged", "/views/admin/ManagementUser.jsp");

		return "admin/indexAdmin";
	}
	@RequestMapping("/ManagementAccount/create")
	public String create(Model model, 
			@RequestParam("username") String username
			, @RequestParam("password") String password
			, @RequestParam("fullname") String fullname
			, @RequestParam("email") String email
			, @RequestParam("activated") Optional<String> activated
			, @RequestParam("admin") Boolean admin
			, @RequestParam("photo") MultipartFile photo
			) {
		if(username == null || password == null || fullname == null || email == null ) {
			model.addAttribute("successCreate", "FAILED");
			return "redirect:/ManagementAccount";
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
			
			
			if(activated.isPresent()) {
				account.setActivated(true);
			}else {
				account.setActivated(false);
			}
			
			account.setAdmin(admin);
			accountDAO.save(account);
			model.addAttribute("successCreate", "SUCCESS");
			return "redirect:/ManagementAccount";
		}
		
		
	}
	
	@RequestMapping("/ManagementAccount/delete/{username}")
	public String delete(@PathVariable("username") String username) {
		accountDAO.deleteById(username);
	    return "redirect:/ManagementAccount";
	} 
}
