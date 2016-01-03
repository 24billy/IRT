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
	
//	private static List<String> adminRoleList;
//	
//	static {
//		adminRoleList.add("admin");
//		adminRoleList.add("Billy");
//		adminRoleList.add("Allen");
//	} 
	
	@Autowired
	private IRoleServise roleServise;

	@Autowired
	private IRecordService recordService;

	private String username;
	private String password;
	
	private Boolean isLogin;
	
	private List<Record> recordList;

	public String showLogin() {
		return ActionSupport.SUCCESS;
	}

	public String login() {
		Map<String, Object> sessionMap = ScopeUtil.getScopeAttribute(Scope.SESSION);
		
		String userName = username;
		System.out.println("username:" + username);
		Role role = roleServise.getRoleByUserName(userName);
		//&& checkAdminRole(role.getUserName()) 
		if (role != null && role.getUserPassword().equals(password)) {
			sessionMap.put("role", role);
			
			return ActionSupport.SUCCESS;
		}

		return ActionSupport.ERROR;
	}
	
	public String goHome() {
		return ActionSupport.SUCCESS;
	}

	public String logout() {
		Map<String, Object> sessionMap = ScopeUtil.getScopeAttribute(Scope.SESSION);
		sessionMap.remove("role");
		
		return ActionSupport.SUCCESS;
	}

	public String getAllRecord() {
		recordList = recordService.getAllRecord();
		
		return ActionSupport.SUCCESS;
	}

	public String addUser() {
		Role role = new Role();
		
		if(username != null && password != null ) {
			int roleCount = roleServise.getAllRole().size();
			
			role.setUserName(username);
			role.setUserPassword(password);
			role.setId(new Long(roleCount + 1));

			roleServise.insertRole(role);
		}
		
		return ActionSupport.SUCCESS;
	}

	public String getAllUser() {
		List<Role> roleList = roleServise.getAllRole();
		
		for (Role role : roleList) {
			if (checkAdminRole(role.getUserName())) {
				role.setUserPassword("****");
			}
		}
		
		return ActionSupport.SUCCESS;
	}
	
	/**
	 * 檢查是否為管理員帳號
	 * @param roleName
	 * @return Boolean
	 */
	private Boolean checkAdminRole(String roleName) {
//		for (String adminRoleName : adminRoleList) {
//			if (adminRoleName.equals(roleName)) {
//				return true;
//			}
//		}
		
		return false;
	}
	
	// ==========  Getter and Setter  ==========
	public List<Record> getRecordList() {
		return recordList;
	}

	public void setRecordList(List<Record> recordList) {
		this.recordList = recordList;
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

}
