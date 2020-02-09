package com.situ.layoa.role.service.impl;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

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
	@Override
	public List<Role> findAll() {
		return roleDao.find();
	}
	@Override
	public Role findRoleById(Long rowId) {
		
		return roleDao.get(rowId);
	}
	@Override
	public Long doUpdate(Role role) {
		role.setUpdateBy("admin");
		role.setUpdateDate(new Date());
		roleDao.update(role);
		return 1L;
	}
	@Override
	public Long doDeleteRole(Long rowId) {
		roleDao.delete(rowId);
		return 1L;
	}
	@Override
	public List<Role> findByPage(Role searchRole,Integer pageNo, Integer limit) {
		// limit查询数据开始的下标
				Integer firstResult = (pageNo - 1) * limit;
				// limit查询数据 要显示的条数
				Integer maxResults = limit;
				return roleDao.findByPage(searchRole,firstResult, maxResults);
	}
	@Override
	public Integer getRoleCount(Role searchRole) {
		
		return roleDao.getCount(searchRole);
	}

}
