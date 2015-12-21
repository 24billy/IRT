package tw.com.pmt.catsofun.core.web.app.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.taglibs.standard.lang.jstl.Coercions;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.pmt.catsofun.core.business.service.IItemService;
import tw.com.pmt.catsofun.core.business.service.IResponseService;
import tw.com.pmt.catsofun.core.common.test.BaseTest;
import tw.com.pmt.catsofun.core.db.model.Item;
import tw.com.pmt.catsofun.core.db.model.Response;

public class TestActionTest extends BaseTest {

	private String selectedOption;
	private static List<String> selectedOptions;
	private static List<Integer> chooseItemPool;

	@Autowired
	private IItemService itemService;

	@Autowired
	private IResponseService responseService;

	private Item item;
	private Response response;

	private List<Item> itemList;

	@Test
	public void testChooseItem() {
		Double initAbility = 0.2;
		System.out.println(itemSelection(initAbility));
	}

	private Item itemSelection(Double initAbility) {
		// 取得所有試題
		itemList = itemService.findAllItem();

		// 初始化參數
		Double prior = 0.5;

		int chooseItem = 0;
		Double maxInformation = 0d;

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

			// System.out.println("prob1:" + prob1);
			// System.out.println("prob2:" + prob2);
			// System.out.println("prob3:" + prob3);
			// System.out.println("prob4:" + prob4);
			// System.out.println("prob5:" + prob5);

			Double betaProb = 0d;
			betaProb = (1 * 1 * prob1) + (2 * 2 * prob2) + (3 * 3 * prob3)
					+ (4 * 4 * prob4) + (5 * 5 * prob5);
			Double expectK = (1 * prob1) + (2 * prob2) + (3 * prob3)
					+ (4 * prob4) + (5 * prob5);
			// System.out.println("betaProb,expectK:" + betaProb + "," +
			// expectK);

			Double itemInformation = betaProb - (expectK * expectK) + prior;

			System.out.println("itemInformation :" + itemInformation);

			if (itemInformation > maxInformation) {
				maxInformation = itemInformation;
				chooseItem = item.getId().intValue();
			}
		}

		System.out.println("Max information : item(" + chooseItem + ")" + ";"
				+ maxInformation);

		return itemList.get(chooseItem - 1);
	}

}
