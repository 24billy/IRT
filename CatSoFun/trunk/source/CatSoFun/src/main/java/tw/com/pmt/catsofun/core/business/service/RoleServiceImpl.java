package tw.com.pmt.catsofun.core.business.service;

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

}