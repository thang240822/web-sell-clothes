package com.rootPackage.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rootPackage.Entity.Category;

public interface CategoryDAO extends JpaRepository<Category, String>{

}
