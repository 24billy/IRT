package tw.com.pmt.catsofun.core.business.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.pmt.catsofun.core.common.test.BaseTest;
import tw.com.pmt.catsofun.core.db.model.Response;

public class ResponseServiceImplTest extends BaseTest {

	@Autowired
	IResponseService responseService;
	
	@Test
	public void testGetAllResponse() {
		System.out.println(responseService.getAllResponse());
	}

	@Test
	public void testGetResponseById() {
		Long responseId = new Long(2);
		
		
		System.out.println(responseService.getResponseById(responseId));
	}

	@Test
	public void testInsertResponse() {
		Response response = new Response();
		response.setId(new Long(8));
		response.setOption01("選項一");
		response.setOption02("選項二");
		response.setOption03("選項三");
		response.setOption04("選項四");
		response.setOption05("選項五");
		response.setGuild("指導語一");
		
		responseService.insertResponse(response);
	}

	@Test
	public void testUpdateResponse() {
		Response response = new Response();
		response.setId(new Long(1));
		response.setOption01("選項A");
		response.setOption02("選項B");
		response.setOption03("選項C");
		response.setOption04("選項D");
		response.setOption05("選項E");
		response.setGuild("指導語2");
		
		responseService.updateResponse(response);
	}

	@Test
	public void testDeleteResponse() {
		Response response = new Response();
		response.setId(new Long(1));
		
		responseService.deleteResponse(responseService.getResponseById(1l));
	}

}
