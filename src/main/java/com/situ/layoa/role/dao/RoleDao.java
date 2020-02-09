package com.situ.layoa.role.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.situ.layoa.role.domain.Role;

@Repository
public interface RoleDao {
	Long save(Role role);
	Role findByName(String roleName);
	List<Role> find();
	void update(Role role);
    void delete(Long rowId);
    Role get(Long rowId);
    
	Integer getCount(@Param("searchRole")Role searchRole);
	List<Role> findByPage(@Param("searchRole")Role searchRole,@Param("firstResult") Integer firstResult, @Param("maxResults") Integer maxResults);
}
