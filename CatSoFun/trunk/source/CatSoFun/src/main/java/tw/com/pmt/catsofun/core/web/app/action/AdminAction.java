package tw.com.pmt.catsofun.core.web.app.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import tw.com.pmt.catsofun.core.business.service.IRecordService;
import tw.com.pmt.catsofun.core.business.service.IRoleServise;
import tw.com.pmt.catsofun.core.db.model.Record;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 「後台管理」控制器
 * 
 * @author Billy
 * 
 */
public class AdminAction extends ActionSupport {

	private static final long serialVersionUID = 5201710573821237977L;
	
	@Autowired
	private IRoleServise roleServise;

	@Autowired
	private IRecordService recordService;

	private List<Record> recordList;

	public String showLogin() {
		return ActionSupport.SUCCESS;
	}

	public String login() {
		return ActionSupport.SUCCESS;
	}
	
	public String goHome() {
		return ActionSupport.SUCCESS;
	}

	public String logout() {
		return ActionSupport.SUCCESS;
	}

	public String getAllRecord() {
		recordList = recordService.getAllRecord();
		
		return ActionSupport.SUCCESS;
	}

	public String addUser() {
		return ActionSupport.SUCCESS;
	}

	// ==========  Getter and Setter  ==========
	public List<Record> getRecordList() {
		return recordList;
	}

	public void setRecordList(List<Record> recordList) {
		this.recordList = recordList;
	}

}
