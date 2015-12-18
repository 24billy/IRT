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
		Response response = new Response();
		Long responseId = new Long(2);
		response.setId(responseId);
		
		System.out.println(responseService.getResponseById(response));
	}

	@Test
	public void testInsertResponse() {
		Response response = new Response();
		response.setId(new Long(8));
		response.setResponseContent("試題內容");
		response.setGuild("指導語");
		
		responseService.insertResponse(response);
	}

	@Test
	public void testUpdateResponse() {
		Response response = new Response();
		response.setId(new Long(1));
		response.setResponseContent("試題內容");
		response.setGuild("指導語2");
		
		responseService.updateResponse(response);
	}

	@Test
	public void testDeleteResponse() {
		Response response = new Response();
		response.setId(new Long(1));
		
		responseService.deleteResponse(responseService.getResponseById(response));
	}

}