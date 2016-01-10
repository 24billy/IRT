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
		int roleCount = roleServise.getAllRole().size();
		role.setId(new Long(roleCount + 1));
		role.setUserName("Steven");
		role.setUserPassword("1234");
		
		roleServise.insertRole(role);
		
		System.out.println(roleServise.getAllRole());
	}
	
	@Test
	public void testGetRoleByUserName() {
		String userName = new String("Billy");
		System.out.println(roleServise.getRoleByUserName(userName));
		System.out.println(roleServise.getRoleByUserName(userName).getUserPassword().equals("4321"));
	}

	@Test
	public void testGetAll() {
		System.out.println(roleServise.getAllRole());
	}

	@Test 
	public void testUpdateRole() {
		Role role = new Role();
		role.setId(5l);
		role.setUserName("Steven");
		role.setUserPassword("123456");
		System.out.println(roleServise.updateRole(role));
	}
	
	@Test
	public void testDeleteRole() {
		Role role = new Role();
		role.setId(5l);
		role.setUserName("Steven");
		role.setUserPassword("1234");
		
		roleServise.deleteRole(role);
	}
	
}