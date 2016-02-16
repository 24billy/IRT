package tw.com.pmt.catsofun.core.db.dao;

import static org.junit.Assert.fail;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.pmt.catsofun.core.common.test.BaseTest;
import tw.com.pmt.catsofun.core.db.model.Item;

public class ItemDaoTest extends BaseTest {

	@Autowired
	ItemDao itemDao;
	
	@Test
	public void testFindAll() {
		System.out.println(itemDao.findAll());
	}

	@Test
	public void testDelete() {
		for (long index = 1 ; index <= 24L ; index++) {
			Item item = new Item();
			item.setId(index);
			item.setItemContent("content");
			itemDao.delete(item);
		}
	}

}
