package com.rootPackage.Controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.rootPackage.DAO.AccountDAO;
import com.rootPackage.DAO.CategoryDAO;
import com.rootPackage.DAO.OrderDAO;
import com.rootPackage.DAO.OrderDetailDAO;
import com.rootPackage.DAO.ProductDAO;
import com.rootPackage.Entity.Account;
import com.rootPackage.Entity.CartItem;
import com.rootPackage.Entity.Category;
import com.rootPackage.Entity.Product;
import com.rootPackage.Services.SessionService;

@Controller
public class ProductController {
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
	public List<Product> lstProduct() {

		return productDAO.findAll();
	}

	@ModelAttribute("lstCategory")
	public List<Category> lstCategory() {

		return categoryDAO.findAll();
	}

	List<CartItem> lstCartItem = new ArrayList<>();

	@GetMapping("/products")
	public String products(Model model, @RequestParam("p") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> kw) {
		String kwords = kw.orElse(SessionService.get("keywords", ""));
		if (SessionService.get("username") == null) {
			SessionService.set("isLogin", 1);
		} else {
			Account account = SessionService.get("username");
			SessionService.set("isLogin", account.getAdmin() ? 3 : 2);
		}
		if (kwords != null) {
			SessionService.set("keywords", kwords);
			;
		} else {
			SessionService.set("keywords", "");
		}
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Product> page = productDAO.findByKeywords("%" + kwords + "%", pageable);
		model.addAttribute("page", page);
		model.addAttribute("lstCategory", lstCategory());

		return "users/product";
	}

	@GetMapping("/products/{id}")
	public String products(Model model, @RequestParam("p") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> kw, @PathVariable("id") String id) {
		String kwords = kw.orElse(SessionService.get("keywords", ""));
		if (SessionService.get("username") == null) {
			SessionService.set("isLogin", 1);
		} else {
			Account account = SessionService.get("username");
			SessionService.set("isLogin", account.getAdmin() ? 3 : 2);
		}
		if (kwords != null) {
			SessionService.set("keywords", kwords);
			;
		} else {
			SessionService.set("keywords", "");
		}
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Product> page = productDAO.findByCategory(id, pageable);
		model.addAttribute("page", page);
		model.addAttribute("lstCategory", lstCategory());

		return "users/product";
	}

	@GetMapping("/products/productInfomation/{id}")
	public String infomationProduct(Model model, @PathVariable("id") Integer id) {
		Product product = productDAO.getById(id);
		model.addAttribute("product", product);
		model.addAttribute("photo", product.getImage());
		return "users/shop-single";
	}

	@GetMapping("/products/cartItem")
	public String addToCart(Model model, @RequestParam("productId") Integer id) {
		CartItem cartItem = new CartItem();
		Product product = productDAO.getById(id);

		int vt = -1;

		for (int i = 0; i < lstCartItem.size(); i++) {
			if (lstCartItem.get(i).getProductId() == id) {
				vt = i;
			}
		}
		if (vt >= 0) {
			// tìm thấy

			lstCartItem.get(vt).setQuantity(lstCartItem.get(vt).getQuantity() + 1);
		} else {
			cartItem.setProductId(id);
			cartItem.setName(product.getName());
			cartItem.setImage(product.getImage());
			cartItem.setPrice(product.getPrice());
			cartItem.setQuantity(1);
			lstCartItem.add(cartItem);
		}

		return "redirect:/products/productInfomation/" + id;
	}

	@GetMapping("/products/cardItemInfo")
	public String indexCartItemInfo(Model model) {
		model.addAttribute("lstCart", lstCartItem);
		return "users/cartItem";
	}
}
