package com.rootPackage.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rootPackage.Entity.Account;

public interface AccountDAO extends JpaRepository<Account, String>{
	Account findByUsername(String username);
}
