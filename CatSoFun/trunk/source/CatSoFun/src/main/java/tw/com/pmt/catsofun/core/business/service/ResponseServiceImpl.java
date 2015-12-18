package tw.com.pmt.catsofun.core.business.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.pmt.catsofun.core.common.dao.GenericDao;
import tw.com.pmt.catsofun.core.common.service.GenericService;
import tw.com.pmt.catsofun.core.db.dao.ResponseDao;
import tw.com.pmt.catsofun.core.db.model.Response;

@Service
public class ResponseServiceImpl extends GenericService<Response> implements
		IResponseService {

	@Autowired
	ResponseDao responseDao;

	@Override
	protected GenericDao<Response> getDao() {
		return responseDao;
	}

	@Override
	public List<Response> getAllResponse() {
		return responseDao.findAll();
	}

	@Override
	public Response getResponseById(Response response) {
		Long id = response.getId();

		return responseDao.findById(id);
	}

	@Override
	public Response insertResponse(Response response) {
		return responseDao.insert(response);
	}
	
	@Override
	public Response updateResponse(Response response) {
		return responseDao.update(response);
	}
	
	@Override
	public void deleteResponse(Response response) {
		responseDao.delete(response);
	}
	
}