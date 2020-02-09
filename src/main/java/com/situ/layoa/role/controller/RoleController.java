package com.situ.layoa.role.controller;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.situ.layoa.commons.LayResult;
import com.situ.layoa.role.domain.Role;
import com.situ.layoa.role.service.RoleService;
@RestController
@RequestMapping("/role")
public class RoleController implements Serializable {

	private static final long serialVersionUID = 1L;
	private static final String PAGE_INDEX_ROLE = "role_add_edit";
    @Autowired
	private RoleService roleService;
	@PostMapping
    public Long doAddRole(Role role) {
		

		return roleService.saveRole(role);
	}
	@GetMapping("/checkname")
	public Role checkname(String roleName) {
		
		return roleService.findByName(roleName);
	}
	@GetMapping("/{page}/{limit}")
	public LayResult doFind (@PathVariable("page")Integer page,@PathVariable("limit")Integer limit,Role formData) {
		
		System.out.println(formData);
		Integer count=roleService.getRoleCount(formData);
		List<Role> roleList=roleService.findByPage(formData,page, limit);
		return new LayResult(0, "", roleList, count);
		
	}
	@GetMapping("/goadd")
	public ModelAndView goAdd(ModelAndView modelAndView) {
		modelAndView.setViewName(PAGE_INDEX_ROLE);
		return modelAndView;
	}
	@GetMapping("/{rowId}")
   public ModelAndView goUpdate(@PathVariable("rowId") Long rowId,ModelAndView modelAndView) {
		
		modelAndView.addObject("roleEdit", roleService.findRoleById(rowId));
		modelAndView.setViewName(PAGE_INDEX_ROLE);
		return modelAndView;
	}
	@DeleteMapping("/{rowId}")
	public Long doDelete(@PathVariable("rowId") Long rowId) {
		return this.roleService.doDeleteRole(rowId);
	}
	@PutMapping
	public Long doUpdateRole(Role role) {
		return this.roleService.doUpdate(role);
	}
}
