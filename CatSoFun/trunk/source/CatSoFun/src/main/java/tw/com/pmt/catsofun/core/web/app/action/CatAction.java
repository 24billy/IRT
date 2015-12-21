package tw.com.pmt.catsofun.core.web.app.action;

import tw.com.pmt.catsofun.core.db.model.Item;
import tw.com.pmt.catsofun.core.db.model.Response;

import com.opensymphony.xwork2.ActionSupport;

public class CatAction extends ActionSupport {
	
	private static final long serialVersionUID = -5912867523538941164L;

	private String selectedOption;  // 受試者作答選項
	
	private Item item;  // 試題
	private Response response; // 試題對應的作答反應與指導語
	
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

	public String show() {
		
		System.out.println("show() begin...");
		
		return "success";
	}
	
	public String chooseItem() {
		System.out.println("chooseItem() begin...");
		
		//收到選項
		System.out.println("選擇選項 : " + selectedOption);
		
		//估計能力 選下一題 (
		item = new Item();
		item.setItemContent("從事以前工作。" + Math.round(Math.random() * 10));
		
		response = new Response();
		response.setOption01("選項一");
		response.setOption02("選項二");
		response.setOption03("選項三");
		response.setOption04("選項四");
		response.setOption05("選項五");
		response.setGuild("在過去一週裡：");
		
		return "success";
	}

}
