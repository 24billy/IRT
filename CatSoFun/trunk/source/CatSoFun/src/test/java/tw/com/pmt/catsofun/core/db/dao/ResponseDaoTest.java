package tw.com.pmt.catsofun.core.db.dao;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.pmt.catsofun.core.common.test.BaseTest;
import tw.com.pmt.catsofun.core.db.model.Response;

public class ResponseDaoTest extends BaseTest {

	@Autowired
	ResponseDao responseDao;
	
	@Test
	public void testFindAll() {
		System.out.println(responseDao.findAll());
	}

	@Test
	public void testFindById() {
	}

	@Test
	public void testInsert() {
		Response response = new Response();
		response.setId(new Long(10));
		response.setResponseContent("試題內容44");
		response.setGuild("指導語44");
		responseDao.insert(response);
	}

	@Test
	public void testUpdate() {
	}

	@Test
	public void testDelete() {
	}

}
