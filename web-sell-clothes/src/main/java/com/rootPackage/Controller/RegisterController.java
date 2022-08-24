package com.rootPackage.Controller;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rootPackage.DAO.AccountDAO;
import com.rootPackage.Entity.Account;
import com.rootPackage.Services.SessionService;

@Controller
public class RegisterController {
	@Autowired
	AccountDAO accountDAO;
	@Autowired
	ServletContext application;
	@Autowired
	SessionService sessionService;
	@GetMapping("Register")
	public String registerForm(Model model) {
		if(sessionService.get("messageRegister") != null) {
			model.addAttribute("messageRegister", sessionService.get("messageRegister"));
		}
		return "users/register";
	}

	@PostMapping("register")
	public String register(RedirectAttributes model, @RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("fullname") String fullname,
			@RequestParam("email") String email, @RequestParam("photo") MultipartFile photo) {

		if (username.length() > 2 && password.length() > 2 && email.length() > 2 && fullname.length() > 2 ) {
			if (accountDAO.findByUsername(username) == null) {

				try {
					Path path = Paths.get(application.getRealPath("/") + "views/uploads/users/");
					InputStream ips = photo.getInputStream(); // java 6
					Files.copy(ips, path.resolve(photo.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println("save img:" + e.getMessage());
				}
				Account account = new Account();
				account.setUsername(username);
				account.setPassword(password);
				account.setFullname(fullname);
				account.setPhoto(photo.getOriginalFilename());
				account.setActivated(true);
				account.setAdmin(false);

				try {
					accountDAO.save(account);
					return "users/login";
				} catch (Exception e) {
					// TODO: handle exception
					sessionService.set("messageRegister", "FAILED");
					return "redirect:/Register";
				}
			}else {
				sessionService.set("messageRegister", "ACCOUNT IS EXISTED");
				
				return "redirect:/Register";
			}
		}else {
			sessionService.set("messageRegister", "FAILED");
			return "redirect:/Register";
		}
	}
}
