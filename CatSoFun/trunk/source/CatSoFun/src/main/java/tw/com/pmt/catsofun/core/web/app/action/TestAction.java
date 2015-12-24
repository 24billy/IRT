package tw.com.pmt.catsofun.core.web.app.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import tw.com.pmt.catsofun.core.business.service.IItemService;
import tw.com.pmt.catsofun.core.business.service.IRecordService;
import tw.com.pmt.catsofun.core.business.service.IResponseService;
import tw.com.pmt.catsofun.core.common.Parameter;
import tw.com.pmt.catsofun.core.common.util.ScopeUtil;
import tw.com.pmt.catsofun.core.common.util.ScopeUtil.Scope;
import tw.com.pmt.catsofun.core.db.model.Item;
import tw.com.pmt.catsofun.core.db.model.Record;
import tw.com.pmt.catsofun.core.db.model.Response;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 「測驗」控制器
 * 
 * @author Billy
 * 
 */
public class TestAction extends ActionSupport {

	private static final long serialVersionUID = 352281438045676179L;

	private String selectedOption;
	private static List<Long> selectedOptions;
	private static List<Item> selectedItems;

	private static List<Item> chooseItemPool;

	@Autowired
	private IItemService itemService;

	@Autowired
	private IResponseService responseService;

	@Autowired
	private IRecordService recordService;
	
	private Item item;
	private Response response;
	private Record record;
	
	private Boolean isFinished;
	private Double initAbility;
	private Double currentAbility;

	private static Double prior = Parameter.TEST_PRIOR;
	
	
	
	public String showCatMainPage() {
		System.out.println("showCatMainContent() begin...");

		// 初始化可選題庫，選取題目
		isFinished = false;
		initChooseItemPool();
		selectedOptions = new ArrayList<Long>();

		initAbility = (Math.random() * 1 - 0.5);
		currentAbility = initAbility;
		
		// 隨機選題與作答反應
//		item = chooseRandomItem(chooseItemPool);
		
		// 正式選題
		item = itemSelection(initAbility, chooseItemPool, prior);
		selectedItems.add(item);
		
		for (int i = 0 ; i < chooseItemPool.size() ; i++) {
			if (item.getId() == chooseItemPool.get(i).getId()) {
				chooseItemPool.remove(i);
			}
		}
		
		// 取得作答反應 
		int responseIndex = item.getAnswerType().intValue() - 1;
		response = responseService.getAllResponse().get(responseIndex);

		// 耕新選題結果
		Long[] selected = new Long[selectedItems.size()];

		for (int i = 0; i < selectedItems.size(); i++) {
			selected[i] = selectedItems.get(i).getId();
		}
		
		record = new Record();
		record.setSelectedItems(selected);
		record.setInitAbility(initAbility);
		record.setAbility(currentAbility);
		record.setIsFinished(false);

		// 使用同一組Record
		Map<String, Object> sessionMap = ScopeUtil.getScopeAttribute(Scope.SESSION);
		sessionMap.put("record", record);
		
		System.out.println("record(init) : " + record);
		
		return ActionSupport.SUCCESS;
	}

	public String chooseItem() {
		System.out.println("chooseItem() begin...");
		
		// Session取出初始化結果
		Map<String, Object> sessionMap = ScopeUtil.getScopeAttribute(Scope.SESSION);
		record = (Record) sessionMap.get("record");
		initAbility = record.getInitAbility();
		Double originalAbility = record.getAbility();

		if (record.getIsFinished()) {
			isFinished = true;
			return ActionSupport.SUCCESS;
		}
		
		// 收到選項
		selectedOptions.add(Long.parseLong(selectedOption) + 1);
		System.out.println("已選擇選項(清單) : " + selectedOptions);

		// 能力估計 
		record = abilityEstimate(selectedItems, originalAbility, selectedOptions);
		
		Double deltaAbility = Math.abs(originalAbility - currentAbility);
		
		if (deltaAbility < 0.001) {
			isFinished = true;
			record.setIsFinished(isFinished);
		} else {
			isFinished = false;
			record.setIsFinished(isFinished);
		}
		
		if (!isFinished) {
			// 隨機「選題﹞與「作答反應」
			//item = chooseRandomItem(chooseItemPool);
			
			item = itemSelection(currentAbility, chooseItemPool, prior);
			selectedItems.add(item);
			
			for (int i = 0 ; i < chooseItemPool.size() ; i++) {
				if (item.getId() == chooseItemPool.get(i).getId()) {
					chooseItemPool.remove(i);
				}
			} 
			
			
			// 取得作答反應
			int responseIndex = item.getAnswerType().intValue() - 1;
			response = responseService.getAllResponse().get(responseIndex);
	
			// 更新選題結果
			System.out.println("selectedItems : " + selectedItems);
			Long[] items = new Long[selectedItems.size()];
			for (int i = 0; i < selectedItems.size(); i++) {
				items[i] = selectedItems.get(i).getId();
			}
	
			Long[] options = new Long[selectedOptions.size()];
			selectedOptions.toArray(options);
	
			// 設定中止條件，作答十二題結束
			if (selectedItems.size() > Parameter.TEST_MAX_ITEM_LENGTH) {
				isFinished = true;
				record.setIsFinished(isFinished);
			} else {
				isFinished = false;
				record.setIsFinished(isFinished);
			}
		}
		
		if (isFinished) {
			List<Record> recordList = recordService.getAllRecord();
	
			if (recordList != null && !recordList.isEmpty()) {
				Integer newId = recordList.size();
				record.setId(newId.longValue() + 1);
			} else {
				record.setId(1L);
			}
			
			recordService.insertRecord(record);
		}

		System.out.println("record result: " + record);
		
		return ActionSupport.SUCCESS;
	}

	/**
	 * 選題方法
	 * 
	 * @param initAbility
	 * @param itemList
	 * @param prior
	 * @return
	 */
	private Item itemSelection(Double initAbility, List<Item> itemList,
			Double prior) {
		System.out.println("======== Start item selection ========");

		// 初始化參數
		Long chooseItem = 0l; // 初始化所選題目
		Double maxInformation = 0d; // 初始化最大訊息值

		for (Item item : itemList) {
			Double delta = item.getDelta();
			Double step1 = item.getStep1();
			Double step2 = item.getStep2();
			Double step3 = item.getStep3();
			Double step4 = item.getStep4();

			Double prob1 = 1d;
			Double prob2 = Math.exp(1 * initAbility - 1 * delta - (step1));
			Double prob3 = Math.exp(2 * initAbility - 2 * delta
					- (step1 + step2));
			Double prob4 = Math.exp(3 * initAbility - 3 * delta
					- (step1 + step2 + step3));
			Double prob5 = Math.exp(4 * initAbility - 4 * delta
					- (step1 + step2 + step3 + step4));

			Double probSum = prob1 + prob2 + prob3 + prob4 + prob5;

			prob1 = prob1 / probSum;
			prob2 = prob2 / probSum;
			prob3 = prob3 / probSum;
			prob4 = prob4 / probSum;
			prob5 = prob5 / probSum;

			Double betaProb = 0d;
			betaProb = (1 * 1 * prob1) + (2 * 2 * prob2) + (3 * 3 * prob3)
					+ (4 * 4 * prob4) + (5 * 5 * prob5);
			Double expectK = (1 * prob1) + (2 * prob2) + (3 * prob3)
					+ (4 * prob4) + (5 * prob5);

			Double itemInformation = betaProb - (expectK * expectK) + prior;

//			System.out.println("itemInformation(" + item.getId() + "):"
//					+ itemInformation);

			if (itemInformation > maxInformation) {
				maxInformation = itemInformation;
				chooseItem = item.getId();
			}
		}

		System.out.println("Max information : item(" + chooseItem + ")" + ";"
				+ maxInformation);
		System.out.println("======== End item selection ========");

		return itemService.getItemById(chooseItem);
	}

	private Record abilityEstimate(List<Item> itemList, Double initAbility,
			List<Long> optionList) {
		System.out.println("======== Start ability estimate ========");

		// 初始化參數
		Double terminationCriteria = Parameter.TEST_TERMINATION_CRITERIA;
		Double mu = Parameter.TEST_POPULATION_MEAN;
		Double variance = Parameter.TEST_VARIANCE;

		// 初始化迭代參數
		currentAbility = initAbility;
		Double deltaAbility = 1d;
		int iterationCount = 1;

		while (deltaAbility > terminationCriteria) {
			Double sumOfbetaDiffEk = 0d;
			Double sumOfbetaDiffSqEk = 0d;

			for (int i = 0; i < itemList.size(); i++) {
				Long selected = optionList.get(i);

				Double delta = itemList.get(i).getDelta();
				Double step1 = itemList.get(i).getStep1();
				Double step2 = itemList.get(i).getStep2();
				Double step3 = itemList.get(i).getStep3();
				Double step4 = itemList.get(i).getStep4();

				Double prob1 = 1d;
				Double prob2 = Math.exp(1 * currentAbility - 1 * delta
						- (step1));
				Double prob3 = Math.exp(2 * currentAbility - 2 * delta
						- (step1 + step2));
				Double prob4 = Math.exp(3 * currentAbility - 3 * delta
						- (step1 + step2 + step3));
				Double prob5 = Math.exp(4 * currentAbility - 4 * delta
						- (step1 + step2 + step3 + step4));

				Double probSum = prob1 + prob2 + prob3 + prob4 + prob5;

				prob1 = prob1 / probSum;
				prob2 = prob2 / probSum;
				prob3 = prob3 / probSum;
				prob4 = prob4 / probSum;
				prob5 = prob5 / probSum;

				Double betaProb = (1 * 1 * prob1) + (2 * 2 * prob2)
						+ (3 * 3 * prob3) + (4 * 4 * prob4) + (5 * 5 * prob5);
				Double expectK = (1 * prob1) + (2 * prob2) + (3 * prob3)
						+ (4 * prob4) + (5 * prob5);

				System.out.println("b-E(K) : " + (selected - expectK));
				System.out.println("bbp-E(K)^2:"
						+ (betaProb - (expectK * expectK)));

				sumOfbetaDiffEk += (selected - expectK);
				sumOfbetaDiffSqEk += ((expectK * expectK) - betaProb);
			}

			Double firstOrderDiff = sumOfbetaDiffEk - (currentAbility - mu)
					/ variance;
			Double secondOrderDiff = sumOfbetaDiffSqEk - (1 / variance);
			System.out.println("firstOrderDiff:" + firstOrderDiff);
			System.out.println("secondOrderDiff:" + secondOrderDiff);

			deltaAbility = firstOrderDiff / secondOrderDiff;
			currentAbility = currentAbility - deltaAbility;
			System.out.println("deltaAbility:" + deltaAbility);
			System.out.println("currentAbility:" + currentAbility);

			Double itemInformation = -sumOfbetaDiffSqEk + (1 / variance);
			Double sem = Math.sqrt(1 / itemInformation);
			System.out.println("itemInformation:" + itemInformation);
			System.out.println("sem:" + sem);

			System.out.println("第" + iterationCount + "次迭代結束");
			iterationCount++;
		}

		Long[] selectedItems = new Long[itemList.size()];
		for (int i = 0; i < itemList.size(); i++) {
			selectedItems[i] = itemList.get(i).getId();
		}

		Long[] selectedOptions = new Long[optionList.size()];
		optionList.toArray(selectedOptions);

//		Record record = new Record();
		record.setAbility(currentAbility);
		record.setSelectedItems(selectedItems);
		record.setSelectedOptions(selectedOptions);
		System.out.println("======== End ability estimate ========");

		return record;
	}

	private Item chooseRandomItem(List<Item> chooseItemPool) {
		// 根據目前可選題號隨機產生選題
		Integer chooseSize = chooseItemPool.size();
		int choosedItemIndex = (int) Math.round(Math.random()
				* (chooseSize - 1));

		// 由可選題號取出數字並移出備選清單
		Item item = chooseItemPool.get(choosedItemIndex);
		selectedItems.add(item);
		chooseItemPool.remove(choosedItemIndex);

		return item;
	}

	private List<Item> initChooseItemPool() {
		// 取得目前題庫題數
		selectedItems = new ArrayList<Item>();
		chooseItemPool = new ArrayList<Item>();
		chooseItemPool = itemService.getAllItem();

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

	public Boolean getIsFinished() {
		return isFinished;
	}

	public void setIsFinished(Boolean isFinished) {
		this.isFinished = isFinished;
	}

	public Record getRecord() {
		return record;
	}

	public void setRecord(Record record) {
		this.record = record;
	}

}
