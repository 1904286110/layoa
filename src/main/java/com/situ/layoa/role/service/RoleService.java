package com.situ.layoa.role.service;

import java.util.List;

import com.situ.layoa.role.domain.Role;

public interface RoleService {
   Long saveRole(Role role);
   Role findByName(String roleName);
   List<Role> findAll();
   Role findRoleById(Long rowId);
   Long doUpdate(Role role);
   Long doDeleteRole(Long rowId);
   
   List<Role> findByPage(Role searchRole,Integer pageNo,Integer limit);
   Integer getRoleCount(Role searchRole);
}
