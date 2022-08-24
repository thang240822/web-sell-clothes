package com.rootPackage.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rootPackage.Entity.Order;

public interface OrderDAO extends JpaRepository<Order, Integer>{

}
