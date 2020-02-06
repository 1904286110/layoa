package com.situ.layoa.role.dao;

import org.springframework.stereotype.Repository;

import com.situ.layoa.role.domain.Role;

@Repository
public interface RoleDao {
	Long save(Role role);
	Role findByName(String roleName);
}
