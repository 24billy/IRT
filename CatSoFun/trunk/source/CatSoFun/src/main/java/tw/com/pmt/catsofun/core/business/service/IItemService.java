package tw.com.pmt.catsofun.core.business.service;

import java.util.List;

import tw.com.pmt.catsofun.core.db.model.Item;

public interface IItemService {

	/**
	 * 取得所有試題
	 * 
	 * @return List<Item>
	 */
	List<Item> getAllItem();
	
	/**
	 * 根據Id取得試題
	 * 
	 * @param id
	 * 
	 * @return Item
	 */
	Item getItemById(Long id);
	
}
