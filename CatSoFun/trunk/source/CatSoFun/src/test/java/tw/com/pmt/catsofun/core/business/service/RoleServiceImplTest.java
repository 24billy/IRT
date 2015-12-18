package tw.com.pmt.catsofun.core.business.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.pmt.catsofun.core.common.test.BaseTest;
import tw.com.pmt.catsofun.core.db.model.Role;

public class RoleServiceImplTest extends BaseTest {

	@Autowired
	IRoleServise roleServise;
	
	@Test
	public void testInsertRole() {
		Role role = new Role();
		role.setId(new Long(3));
		role.setUserName("Steven");
		role.setUserPassword("1234");
		
		roleServise.insertRole(role);
	}
	
	@Test
	public void testGetRoleByUserName() {
		String userName = new String("Billy");
		System.out.println(roleServise.getRoleByUserName(userName));
	}

	@Test
	public void testGetAll() {
		System.out.println(roleServise.getAllRole());
	}

}