package tw.com.pmt.catsofun.core.web.app.action;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.pmt.catsofun.core.business.service.IItemService;
import tw.com.pmt.catsofun.core.business.service.IRecordService;
import tw.com.pmt.catsofun.core.business.service.IResponseService;
import tw.com.pmt.catsofun.core.common.test.BaseTest;
import tw.com.pmt.catsofun.core.db.model.Item;
import tw.com.pmt.catsofun.core.db.model.Record;

public class TestActionTest extends BaseTest {

	private static List<Integer> chooseItemPool;

	@Autowired
	private IItemService itemService;

	@Autowired
	private IResponseService responseService;

	@Autowired
	private IRecordService recordService;

	@Test
	public void testChooseItem() {
		Double initAbility = 0.2;

		// 取得所有試題
		List<Item> itemList = itemService.getAllItem();
		List<Item> selectedItems = new ArrayList<Item>();

		// 選題
		Item item = itemSelection(initAbility, itemList);
		selectedItems.add(item);
		System.out.println("selectedItems :" + selectedItems);
	}

	@Test
	public void testAbilityEstimate() {
		//Double initAbility = 0.2;
		Double initAbility = -0.7877;
		List<String> selectedOptions = new ArrayList<String>();
		selectedOptions.add("1");
		selectedOptions.add("1");

		// 取得所有試題
		List<Item> selectedItems = new ArrayList<Item>();

		selectedItems.add(itemService.getItemById(9L));
		selectedItems.add(itemService.getItemById(11L));
		System.out.println("selectedItems :" + selectedItems);

		// 能力估計
		Record record = abilityEstimate(selectedItems, initAbility,
				selectedOptions);
	}

	private Record abilityEstimate(List<Item> itemList, Double initAbility,
			List<String> selectedOptions) {
		System.out.println("======== Start ability estimate ========");

		// 初始化參數
		Double endCondtion = 0.01d;
		Double mu = 0d;
		Double variance = 2d;
		Double currentAbility = initAbility;

		Double deltaAbility = 1d;
		int iterationCount = 1;
		
		while (deltaAbility > endCondtion) {
			Double sumOfbetaDiffEk = 0d;
			Double sumOfbetaDiffSqEk = 0d;
			
			for (int i = 0; i < itemList.size(); i++) {
				int selected = Integer.parseInt(selectedOptions.get(i));

				Double delta = itemList.get(i).getDelta();
				Double step1 = itemList.get(i).getStep1();
				Double step2 = itemList.get(i).getStep2();
				Double step3 = itemList.get(i).getStep3();
				Double step4 = itemList.get(i).getStep4();

				Double prob1 = 1d;
				Double prob2 = Math.exp(1 * currentAbility - 1 * delta - (step1));
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
				System.out
						.println("bbp-E(K)^2:" + (betaProb - (expectK * expectK)));

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
		

		System.out.println("======== End ability estimate ========");

		return null;
	}

	private Item itemSelection(Double initAbility, List<Item> itemList) {
		System.out.println("======== Start item selection ========");

		// 初始化參數
		Double prior = 0.5;

		int chooseItem = 0; // 所選題目
		Double maxInformation = 0d; // 目前最大訊息

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
			// System.out.println("betaProb,expectK:" + betaProb + "," +
			// expectK);

			Double itemInformation = betaProb - (expectK * expectK) + prior;

			System.out.println("itemInformation(" + item.getId() + "):"
					+ itemInformation);

			if (itemInformation > maxInformation) {
				maxInformation = itemInformation;
				chooseItem = item.getId().intValue();
			}
		}

		System.out.println("Max information : item(" + chooseItem + ")" + ";"
				+ maxInformation);
		System.out.println("======== End item selection ========");

		return itemList.get(chooseItem - 1);
	}

}
