package tw.com.pmt.catsofun.core.web.app.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import tw.com.pmt.catsofun.core.business.service.IItemService;
import tw.com.pmt.catsofun.core.business.service.IResponseService;
import tw.com.pmt.catsofun.core.db.model.Item;
import tw.com.pmt.catsofun.core.db.model.Response;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 「測驗」控制器
 * @author Billy
 *
 */
public class TestAction extends ActionSupport {

	private static final long serialVersionUID = 352281438045676179L;

	private String selectedOption;
	private static List<String> selectedOptions;
	private static List<Integer> chooseItemPool;

	@Autowired
	private IItemService itemService;
	
	@Autowired
	private IResponseService responseService;
	
	private Item item;
	private Response response;
	private Boolean isEnd;
	
	public String showCatMainPage() {
		System.out.println("showCatMainContent() begin...");

		// 初始化可選題庫，選取題目
		//List<Integer> chooseItemPool = initChooseItemPool();
		isEnd = false;
		initChooseItemPool();
		selectedOptions = new ArrayList<String>();

		// 隨機選題與作答反應
//		item = chooseRandomItem(chooseItemPool);
//		int responseIndex = item.getAnswerType().intValue();
//		response = responseService.getAllResponse().get(responseIndex);

		return ActionSupport.SUCCESS;
	}

	public String chooseItem() {
		System.out.println("chooseItem() begin...");

		// 收到選項
		selectedOptions.add(selectedOption);
		System.out.println("本次選擇選項 : " + selectedOption);
		System.out.println("已選擇選項(清單) : " + selectedOptions);

		// 估計能力 選下一題
		// chooseNext();

		// 隨機「選題﹞與「作答反應」
		item = chooseRandomItem(chooseItemPool);
		int responseIndex = item.getAnswerType().intValue();
		
		response = responseService.getAllResponse().get(responseIndex - 1);
		
		System.out.println("本次所選題目：" + item);
		System.out.println("剩餘可選題目：" + chooseItemPool);
		System.out.println("本次所選題目選項：" + response);

		// 設定中止條件，作答十題結束
		if (chooseItemPool.size() < 15) {
			isEnd = true;
		} else {
			isEnd = false;
		}
		
		return ActionSupport.SUCCESS;
	}

	private Item chooseRandomItem(List<Integer> chooseItemPool) {
		// 根據目前可選題號隨機產生選題
		Integer chooseSize = chooseItemPool.size();
		int choosedItemIndex = (int) Math.round(Math.random() * (chooseSize - 1));

		// 由可選題號取出數字並移出備選清單
		Integer choosedItemNum = chooseItemPool.get(choosedItemIndex);
		chooseItemPool.remove(choosedItemIndex);

		return itemService.findAllItem().get(choosedItemNum);
	}

	private List<Integer> initChooseItemPool() {
		Integer itemPoolSize = 24;
		chooseItemPool = new ArrayList<Integer>();

		for (int i = 0; i < itemPoolSize; i++) {
			chooseItemPool.add(i);
		}

		return chooseItemPool;
	}

	public String getSelectedOption() {
		return selectedOption;
	}

	public void setSelectedOption(String selectedOption) {
		this.selectedOption = selectedOption;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public Response getResponse() {
		return response;
	}

	public void setResponse(Response response) {
		this.response = response;
	}

	public Boolean getIsEnd() {
		return isEnd;
	}

	public void setIsEnd(Boolean isEnd) {
		this.isEnd = isEnd;
	}

}
