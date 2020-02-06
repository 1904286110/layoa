package com.situ.layoa.role.service;

import com.situ.layoa.role.domain.Role;

public interface RoleService {
   Long saveRole(Role role);
   Role findByName(String roleName);
}
