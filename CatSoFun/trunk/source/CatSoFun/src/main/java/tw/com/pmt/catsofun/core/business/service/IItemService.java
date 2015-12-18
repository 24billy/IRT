package tw.com.pmt.catsofun.core.business.service;

import java.util.List;

import tw.com.pmt.catsofun.core.db.model.Item;

public interface IItemService {

	List<Item> findAllItem();
	
	Item findItemById(Long id);
	
}
