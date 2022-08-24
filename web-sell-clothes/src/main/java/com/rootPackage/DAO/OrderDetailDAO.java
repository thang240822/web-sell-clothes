package com.rootPackage.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rootPackage.Entity.OrderDetail;


public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer>{

}
