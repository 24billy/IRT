package tw.com.pmt.catsofun.core.business.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.pmt.catsofun.core.common.test.BaseTest;

public class ItemServiceImplTest extends BaseTest {

	@Autowired
	IItemService itemService;
	
	@Test
	public void testFindAllItem() {
		System.out.println(itemService.getAllItem());
	}

	@Test
	public void testFindItemById() {
		Long id = 1L;
		
		System.out.println(itemService.getItemById(id));
	}

}
