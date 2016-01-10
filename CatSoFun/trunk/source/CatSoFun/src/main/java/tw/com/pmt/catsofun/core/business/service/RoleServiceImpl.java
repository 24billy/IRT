package tw.com.pmt.catsofun.core.business.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.pmt.catsofun.core.common.dao.GenericDao;
import tw.com.pmt.catsofun.core.common.service.GenericService;
import tw.com.pmt.catsofun.core.db.dao.RoleDao;
import tw.com.pmt.catsofun.core.db.model.Role;

@Service
public class RoleServiceImpl extends GenericService<Role> implements IRoleServise {

	@Autowired
	RoleDao roleDao;

	@Override
	protected GenericDao<Role> getDao() {
		return roleDao;
	}
	
	@Override
	public Role getRoleByUserName(String userName) {
		return roleDao.findRoleByUserName(userName);
	}

	@Override
	public Role insertRole(Role role) {
		return roleDao.insert(role);
	}

	@Override
	public List<Role> getAllRole() {
		return roleDao.findAll();
	}

	@Override
	public Role getRoleByUserNameAndPwd(String userName, String userPassword) {
		return roleDao.findRoleByUserNameAndUserPassword(userName, userPassword);
	}

	@Override
	public List<Role> getAllExaminerRole() {
		List<Role> allRoleList = roleDao.findAll();
		List<Role> resultList = new ArrayList<Role>();
		
		// 僅將施測者帳號回傳
		for (Role role : allRoleList) {
			if("examiner".equals(role.getRoleType())) {
				resultList.add(role);
			}
		}
		
		return resultList;
	}

	@Override
	public Role insertExaminerRole(Role role) {
		role.setRoleType("examiner");
		return roleDao.insert(role);
	}

	@Override
	public Role updateRole(Role role) {
		return roleDao.update(role);
	}
	
	@Override
	public void deleteRole(Role role) {
		roleDao.delete(role);
	}
	
	@Override
	public Long getMaxRoleId() {
		return roleDao.findMaxRoleId();
	}
	
}