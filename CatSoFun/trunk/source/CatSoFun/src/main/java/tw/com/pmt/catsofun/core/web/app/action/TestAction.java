package tw.com.pmt.catsofun.core.web.app.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import tw.com.pmt.catsofun.core.common.util.CacheUtil;
import tw.com.pmt.catsofun.core.db.model.Item;
import tw.com.pmt.catsofun.core.db.model.Response;

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

	private Item item;
	private Response response;

	public String showCatMainPage() {
		return ActionSupport.SUCCESS;
	}
	
	public String showCatMainContent() {
		System.out.println("showCatMainContent() begin...");

		// 初始化可選題庫，選取題目
		List<Integer> chooseItemPool = initChooseItemPool();
		selectedOptions = new ArrayList<String>();

		// 隨機選題與作答反應
		item = chooseRandomItem(chooseItemPool);
		int responseIndex = item.getAnswerType().intValue();
		response = CacheUtil.getCatResponses().get(responseIndex);

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

		// 隨機選題與作答反應
		item = chooseRandomItem(chooseItemPool);
		int responseIndex = item.getAnswerType().intValue();
		response = CacheUtil.getCatResponses().get(responseIndex);

		System.out.println("本次所選題目：" + item);
		System.out.println("本次所選題目選項：" + response);

		return ActionSupport.SUCCESS;
	}

	private Item chooseRandomItem(List<Integer> chooseItemPool) {
		// 根據目前可選題號隨機產生選題
		Integer chooseSize = chooseItemPool.size();
		int choosedItemIndex = (int) Math.round(Math.random() * (chooseSize - 1));

		// 由可選題號取出數字並移出備選清單
		Integer choosedItemNum = chooseItemPool.get(choosedItemIndex);
		chooseItemPool.remove(choosedItemIndex);

		return CacheUtil.getCatItems().get(choosedItemNum);
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
	
}
