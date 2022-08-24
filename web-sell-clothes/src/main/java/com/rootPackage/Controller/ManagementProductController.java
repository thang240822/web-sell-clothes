package com.rootPackage.Controller;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.rootPackage.DAO.CategoryDAO;
import com.rootPackage.DAO.ProductDAO;
import com.rootPackage.Entity.Account;
import com.rootPackage.Entity.Category;
import com.rootPackage.Entity.Product;
import com.rootPackage.Services.SessionService;

@Controller
public class ManagementProductController {
	@Autowired
	SessionService sessionService;
	@Autowired
	ProductDAO productDAO;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	ServletContext app;
	@ModelAttribute("lstProduct")
	public List<Product> lstProduct(){
		
	return productDAO.findAll();
	}
	@ModelAttribute("lstCategory")
	public List<Category> lstCategory(){
		
	return categoryDAO.findAll();
	}
	@GetMapping("/ManagementProduct")
	public String indexManagementProduct(Model model, @RequestParam("p") Optional<Integer> p ,@RequestParam("keyworks") Optional<String> kw) {
		String kworks = kw.orElse(sessionService.get("keyworks",""));
		sessionService.set("keyworks", kworks);
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Product> page = productDAO.findByKeywords("%" + kworks + "%", pageable);
		model.addAttribute("page", page);
		model.addAttribute("isChoose", "a");
		model.addAttribute("pageAdminChanged", "/views/admin/ManagementProduct.jsp");
		return "admin/indexAdmin";
	}
	
	@RequestMapping("/ManagementProduct/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id, @RequestParam("p") Optional<Integer> p ) {
		
		Product product = new Product();
		product = productDAO.getById(id);
		model.addAttribute("photos", product.getImage());
		model.addAttribute("product",product);
		model.addAttribute("isChoose", product.getCategory().getId());
		
	
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Product> page =productDAO.findAll(pageable);
		model.addAttribute("page", page);
		
		model.addAttribute("pageAdminChanged", "/views/admin/ManagementProduct.jsp");
		return "admin/indexAdmin";
	}
	@RequestMapping("/ManagementProduct/create")
	public String create(Model model, 
			@RequestParam("name") String name
			, @RequestParam("price") String price
			, @RequestParam("image") MultipartFile image
			, @RequestParam("createDate") String createDate
			, @RequestParam("available") Optional<String> available
			,	@RequestParam("categoryId") String valueCategory
			) {
		if(name == null || price == null || createDate==null || image ==null) {
			model.addAttribute("successCreate", "FAILED");
			return "redirect:/ManagementProduct";
		}else {
			boolean settingImage = false;
			try {
				Path path = Paths.get(app.getRealPath("/")+ "views/uploads/products/");
				InputStream ips = image.getInputStream();
				Files.copy(ips, path.resolve(image.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);
				settingImage = true;
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("create product: "+ e.getMessage());
			}
			Product product = new Product();
			product.setName(name);
			product.setPrice(Double.parseDouble(price));
			
			
			try {
			    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			   Date dF = formatter.parse(createDate);
			   product.setCreateDate(dF);
			 } catch (Exception e) {
			    System.out.println("Error : Convert Date");
			 }
			Category category = categoryDAO.getById(valueCategory);
			product.setCategory(category);
			product.setImage(image.getOriginalFilename());
			if(available.isPresent()) {
				
				product.setAvailable(true);
				
			}else {
				product.setAvailable(false);
			}
			
	
			productDAO.save(product);
			model.addAttribute("successCreate", "SUCCESS");
			return "redirect:/ManagementProduct";
		}
		
		
	}
	@RequestMapping("/ManagementProduct/update/{id}")
	public String update(Model model, @PathVariable("id") Integer id
			,@RequestParam("name") String name
			, @RequestParam("price") String price
			, @RequestParam("image") MultipartFile image
			, @RequestParam("createDate") String createDate
			, @RequestParam("available") Optional<String> available
			,	@RequestParam("categoryId") String valueCategory
			) {
		if(name == null || price == null || createDate==null || image ==null) {
			model.addAttribute("successCreate", "FAILED");
			return "redirect:/ManagementProduct";
		}else {
			Product product = new Product();
			if(!image.isEmpty()) {
				try {
					Path path = Paths.get(app.getRealPath("/")+ "views/uploads/products/");
					InputStream ips = image.getInputStream();
					Files.copy(ips, path.resolve(image.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);
					product.setImage(image.getOriginalFilename());
					
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println("create product: "+ e.getMessage());
				}
			}else {
				product.setImage(productDAO.findById(id).get().getImage());
			}
			
			
			product.setId(id);
			product.setName(name);
			product.setPrice(Double.parseDouble(price));
			
			
			try {
			    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			   Date dF = formatter.parse(createDate);
			   product.setCreateDate(dF);
			 } catch (Exception e) {
			    System.out.println("Error : Convert Date");
			 }
			Category category = categoryDAO.getById(valueCategory);
			product.setCategory(category);
			
			if(available.isPresent()) {
				
				product.setAvailable(true);
				
			}else {
				product.setAvailable(false);
			}
			
	
			productDAO.save(product);
			model.addAttribute("successCreate", "SUCCESS");
			return "redirect:/ManagementProduct";
		}
		
		
	}
	@RequestMapping("/ManagementProduct/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		productDAO.deleteById(id);
	    return "redirect:/ManagementProduct";
	} 
}
