package tw.com.pmt.catsofun.core.business.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.pmt.catsofun.core.common.dao.GenericDao;
import tw.com.pmt.catsofun.core.common.service.GenericService;
import tw.com.pmt.catsofun.core.db.dao.ItemDao;
import tw.com.pmt.catsofun.core.db.model.Item;

@Service
public class ItemServiceImpl extends GenericService<Item> implements IItemService {

	@Autowired
	ItemDao itemDao;
	
	@Override
	protected GenericDao<Item> getDao() {
		return itemDao;
	}
	
	@Override
	public List<Item> getAllItem() {
		return itemDao.findAll();
	}

	@Override
	public Item getItemById(Long id) {
		return itemDao.findById(id);
	}

}
