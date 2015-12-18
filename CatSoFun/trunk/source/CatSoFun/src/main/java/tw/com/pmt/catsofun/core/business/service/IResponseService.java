package tw.com.pmt.catsofun.core.business.service;

import java.util.List;

import tw.com.pmt.catsofun.core.db.model.Response;

public interface IResponseService {

	List<Response> getAllResponse();
	
	Response getResponseById(Response response);
	
	Response insertResponse(Response response);
	
	Response updateResponse(Response response);
	
	void deleteResponse(Response response);
	
}
