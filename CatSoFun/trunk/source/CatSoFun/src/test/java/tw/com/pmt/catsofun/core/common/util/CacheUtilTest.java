package tw.com.pmt.catsofun.core.common.util;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.pmt.catsofun.core.business.service.IItemService;
import tw.com.pmt.catsofun.core.business.service.IResponseService;
import tw.com.pmt.catsofun.core.common.test.BaseTest;
import tw.com.pmt.catsofun.core.db.model.Item;
import tw.com.pmt.catsofun.core.db.model.Response;

public class CacheUtilTest extends BaseTest {

	private static IItemService itemService;
	private static IResponseService responseService;
	
	private static List<Item> catItems = new ArrayList<Item>();
	private static List<Response> catResponses = new ArrayList<Response>();
	
	@Autowired
	public void setItemService(IItemService itemService) {
		CacheUtilTest.itemService = itemService;
	}
	
	@Autowired
	public void setResponseService(IResponseService responseService) {
		CacheUtilTest.responseService = responseService;
	}
	
	@Test
	public void testGetCatItems() {
		System.out.println(CacheUtil.getCatItems());
	}

	@Test
	public void testGetCatResponses() {
	}

}
