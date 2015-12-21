package tw.com.pmt.catsofun.core.web.app.action;

import com.opensymphony.xwork2.ActionSupport;

public class CatAction extends ActionSupport {
	
	private static final long serialVersionUID = -5912867523538941164L;

	private String item;
	private String selectedOption;
	private String[] options;

	public String getSelectedOption() {
		return selectedOption;
	}

	public void setSelectedOption(String selectedOption) {
		this.selectedOption = selectedOption;
	}

	public String[] getOptions() {
		return options;
	}

	public void setOptions(String[] options) {
		this.options = options;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String chooseItem() {
		System.out.println("choose() begin...");
		
		//收到選項
		System.out.println("選擇選項 : " + selectedOption);
		
		//估計能力 選下一題 (
		item = "next item_" + Math.random()*100 ;
		
		options = new String[]{"選項一", "選項二", "選項3", "選項4", "選項5"};
		
		return "success";
	}

	public String show() {
		
		System.out.println("show() begin...");
		
		return "success";
	}

}
