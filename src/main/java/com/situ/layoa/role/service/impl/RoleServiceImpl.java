package com.situ.layoa.role.service.impl;

import java.io.Serializable;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.layoa.role.dao.RoleDao;
import com.situ.layoa.role.domain.Role;
import com.situ.layoa.role.service.RoleService;
@Service
public class RoleServiceImpl implements RoleService, Serializable {

	private static final long serialVersionUID = 1L;
    @Autowired
	private RoleDao roleDao;
	@Override
	public Long saveRole(Role role) {
		
		role.setCreateBy("admin");
		role.setCreateDate(new Date());
		return roleDao.save(role);
	}
	@Override
	public Role findByName(String roleName) {
		
		return roleDao.findByName(roleName);
	}

}
