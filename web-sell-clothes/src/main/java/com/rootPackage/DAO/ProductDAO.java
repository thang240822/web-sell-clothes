package com.rootPackage.DAO;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.rootPackage.Entity.Product;

public interface ProductDAO extends JpaRepository<Product, Integer>{
	@Query("SELECT o FROM Product o WHERE o.name LIKE ?1")
	Page<Product> findByKeywords(String keywords, Pageable pageable);
	
	@Query("SELECT o FROM Product o WHERE categoryid LIKE ?1")
	Page<Product> findByCategory(String keywords, Pageable pageable);
}
