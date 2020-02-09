package com.situ.layoa.role.controller;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.situ.layoa.commons.LayResult;
import com.situ.layoa.role.domain.Role;
import com.situ.layoa.role.service.RoleService;
@Controller
@RequestMapping("/role1")
public class RoleController1 implements Serializable {

	private static final long serialVersionUID = 1L;
	private static final String PAGE_INDEX_ROLE = "role_add_edit";
	@Autowired
	private RoleService roleService;
	@ResponseBody
    @RequestMapping("/find")
	public LayResult doFind (Integer page,Integer limit,Role searchRole) {
		System.out.println(page);
		System.out.println(limit);
		Integer count=roleService.getRoleCount(searchRole);
		List<Role> roleList=roleService.findByPage(searchRole,page, limit);
		return new LayResult(0, "", roleList, count);
		
	}
	@ResponseBody
	@RequestMapping("/add")
	public Long doAddRole(Role role) {
		

		return roleService.saveRole(role);
	}
	@RequestMapping("/goadd")
	public ModelAndView goIndex(ModelAndView modelAndView) {
		modelAndView.setViewName(PAGE_INDEX_ROLE);
		return modelAndView;
	}
	@ResponseBody
	@RequestMapping("/checkRoleName")
	public Integer checkname(String roleName) {
		Integer result=1;
		if(roleService.findByName(roleName)!=null) {
			
			result=0;
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/goupdate/{rowId}")
	public ModelAndView goUpdate(@PathVariable("rowId") Long rowId,ModelAndView modelAndView) {
		
		modelAndView.addObject("roleEdit", roleService.findRoleById(rowId));
		modelAndView.setViewName(PAGE_INDEX_ROLE);
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/doupdate")
	public Long doUpdateRole(Role role) {
		return this.roleService.doUpdate(role);
	}
	
	@ResponseBody
	@RequestMapping("/dodelete/{rowId}")
	public Long doDelete(@PathVariable Long rowId) {
		return this.roleService.doDeleteRole(rowId);
	}
}
