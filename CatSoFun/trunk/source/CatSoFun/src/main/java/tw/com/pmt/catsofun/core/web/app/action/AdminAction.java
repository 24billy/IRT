package tw.com.pmt.catsofun.core.web.app.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import tw.com.pmt.catsofun.core.business.service.IRecordService;
import tw.com.pmt.catsofun.core.business.service.IRoleServise;
import tw.com.pmt.catsofun.core.common.util.ScopeUtil;
import tw.com.pmt.catsofun.core.common.util.ScopeUtil.Scope;
import tw.com.pmt.catsofun.core.db.model.Record;
import tw.com.pmt.catsofun.core.db.model.Role;

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

	private String username;
	private String password;
	
	private Boolean isSuccess;
	private String errorMessage;
	
	private List<Record> recordList;
	private List<Role> roleList;
	
	/**
	 * 導頁至登入頁
	 * 
	 * @return String
	 */
	public String showLogin() {
		return ActionSupport.SUCCESS;
	}

	/**
	 * 登入檢查
	 * 
	 * @return String
	 */
	public String login() {
		Map<String, Object> sessionMap = ScopeUtil.getScopeAttribute(Scope.SESSION);
		Role role = roleServise.getRoleByUserName(username);

		if (role != null && role.getUserPassword().equals(password) && role.getRoleType().equals("system")) {
			sessionMap.put("role", role);
			
			return ActionSupport.SUCCESS;
		} else {
			sessionMap.remove("role");
		}
		
		return ActionSupport.ERROR;
	}
	
	/**
	 * 導頁至後台主功能頁
	 * 
	 * @return String
	 */
	public String goHome() {
		return ActionSupport.SUCCESS;
	}

	public String logout() {
		Map<String, Object> sessionMap = ScopeUtil.getScopeAttribute(Scope.SESSION);
		sessionMap.remove("role");
		
		return ActionSupport.SUCCESS;
	}

	/**
	 * 取得所有作答結果紀錄
	 *  
	 * @return String
	 */
	public String getAllRecord() {
		recordList = recordService.getAllRecord();
		
		return ActionSupport.SUCCESS;
	}

	/**
	 * 取得所有帳號資料
	 * 
	 * @return String
	 */
	public String getAllUser() {
		roleList = roleServise.getAllExaminerRole();
		
		return ActionSupport.SUCCESS;
	}
	
	/**
	 * 新增帳號/密碼規則
	 * 
	 * @return String
	 */
	public String addUser() {
		Role role = new Role();
		
		if(username != null && password != null ) {
			List<Role> roleList = roleServise.getAllRole();
			
			for (Role comparedRole : roleList) {
				if (username.equals(comparedRole.getUserName())) {
					errorMessage = "此帳號已存在！";
					isSuccess = false;
					
					return ActionSupport.SUCCESS;
				}
			}
			
			role.setUserName(username);
			role.setUserPassword(password);
			role.setId(new Long(roleList.size() + 1));

			try {
				roleServise.insertExaminerRole(role);
				isSuccess = true;
			} catch (Exception e) {
				e.printStackTrace();
				isSuccess = false;
			}
		} else {
			isSuccess = false;
		}
		
		return ActionSupport.SUCCESS;
	}

	
	/**
	 * 檢查是否為管理員帳號
	 * 
	 * @param roleName
	 * @return Boolean
	 */
	private Boolean checkAdminRole(String roleName) {
		
		return false;
	}
	
	// ==========  Getter and Setter  ==========
	public List<Record> getRecordList() {
		return recordList;
	}

	public void setRecordList(List<Record> recordList) {
		this.recordList = recordList;
	}

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getIsSuccess() {
		return isSuccess;
	}

	public void setIsSuccess(Boolean isSuccess) {
		this.isSuccess = isSuccess;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

}