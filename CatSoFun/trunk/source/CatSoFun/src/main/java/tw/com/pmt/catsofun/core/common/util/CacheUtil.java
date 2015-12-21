package tw.com.pmt.catsofun.core.common.util;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


import tw.com.pmt.catsofun.core.business.service.IItemService;
import tw.com.pmt.catsofun.core.business.service.IResponseService;
import tw.com.pmt.catsofun.core.db.model.Item;
import tw.com.pmt.catsofun.core.db.model.Response;

/**
 * 快取產生工具
 * 
 * @author Billy
 *
 */
public class CacheUtil {

	private static IItemService itemService; 
	private static IResponseService responseService;
	
	private static List<Item> catItems;
	private static List<Response> catResponses;
	
	@Autowired
	public void setItemService(IItemService itemService) {
		CacheUtil.itemService = itemService;
	}
	
	@Autowired
	public void setResponseService(IResponseService responseService) {
		CacheUtil.responseService = responseService;
	}
	
	/**
	 * 取得快取中試題
	 * 
	 * @return List<Item>
	 */
	public static List<Item> getCatItems() {
		checkCache();
		
		return catItems;
	}
	
	/**
	 * 取得快取中作答反應
	 * 
	 * @return List<Response>
	 */
	public static List<Response> getCatResponses() {
		checkCache();
		
		return catResponses;
	}
	
	/**
	 * 緩初始化快取參數
	 */
	private static void checkCache() {
		if (catItems == null) {
			catItems = itemService.findAllItem();
		}
		
		if (catResponses == null) {
			catResponses = responseService.getAllResponse();
		}
	}
}
