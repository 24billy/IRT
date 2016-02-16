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
		response.setOption01("選項一");
		response.setOption02("選項二");
		response.setOption03("選項三");
		response.setOption04("選項四");
		response.setOption05("選項五");
		response.setGuild("指導語44");
		responseDao.insert(response);
	}

	@Test
	public void testUpdate() {
	}

	@Test
	public void testDelete() {
		for (long index = 1 ; index <= 7l ; index++) {
			Response response = new Response();
			response.setId(new Long(index));
			response.setOption01("選項一");
			response.setOption02("選項二");
			response.setOption03("選項三");
			response.setOption04("選項四");
			response.setOption05("選項五");
			response.setGuild("指導語44");
			
			responseDao.delete(response);
		}
	}

}
