package tw.com.pmt.catsofun.core.business.service;

import java.util.List;

import tw.com.pmt.catsofun.core.db.model.Role;

public interface IRoleServise {
	
	List<Role> getAllRole();
	
	Role getRoleByUserName(String userName);
	
	Role insertRole(Role role);
	
	Role getRoleByUserNameAndPwd(String userName, String userPassword);

	List<Role> getAllExaminerRole();
	
	Role insertExaminerRole(Role role);
	
}
