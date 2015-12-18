package tw.com.pmt.catsofun.core.common.service;

import java.util.List;

import tw.com.pmt.catsofun.core.common.dao.GenericDao;
import tw.com.pmt.catsofun.core.common.entity.GenericEntity;

import com.google.gson.Gson;

public abstract class GenericService<T extends GenericEntity> {

	protected abstract GenericDao<T> getDao();

	public List<T> getAll() {
		return getDao().findAll();
	}
	
	public T getById(Long id) {
		return getDao().findById(id);
	}
	
	public T insert(T entity) {
		return getDao().insert(entity);
	}
	
	public T update(T entity) {
		return getDao().update(entity);
	}
	
	public void delete(T entity) {
		getDao().delete(entity);
	}
	
	public String getAllJSON() {
		String toJson = new Gson().toJson(getDao().findAll()); 
		//import com.google.gson.Gson;
		//用 new Gson().toJson 與用 將findAll()得出的bean list 轉成Json型態
		return toJson;
	}
		
}
