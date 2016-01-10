package tw.com.pmt.catsofun.core.db.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.pmt.catsofun.core.common.test.BaseTest;

public class RoleDaoTest extends BaseTest {

	@Autowired
	RoleDao roleDao;
	
	@Test
	public void testFindRoleByUserName() {
		System.out.println(roleDao.findAll());
	}

	@Test
	public void testFindRoleByUserNameAndUserPassword() {
		System.out.println(roleDao.findRoleByUserNameAndUserPassword("Billy", "4321"));
	}

	@Test
	public void testFindMaxRoleId() {
		System.out.println(roleDao.findMaxRoleId());
	}

}
