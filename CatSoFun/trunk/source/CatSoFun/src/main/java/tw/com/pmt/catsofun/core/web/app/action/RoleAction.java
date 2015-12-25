package tw.com.pmt.catsofun.core.web.app.action;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.pmt.catsofun.core.business.service.IItemService;
import tw.com.pmt.catsofun.core.business.service.IRoleServise;
import tw.com.pmt.catsofun.core.db.model.Role;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 「角色」控制器
 * 
 * @author Billy
 *
 */
public class RoleAction extends ActionSupport{

	private static final long serialVersionUID = -4197751637243456127L;
	
	private String loginId;
	private String pwd;
	
	@Autowired
	private IItemService itemService;
	
	@Autowired
	private IRoleServise roleService;
	
	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String login() {
		System.out.println("login() begin...");
		System.out.println("loginId = " + loginId + " ; pwd = " + pwd);

		String sflag = ActionSupport.ERROR;

		if (StringUtils.isNotEmpty(loginId) && StringUtils.isNotEmpty(pwd)) {
			//和DB比對
			Role role = roleService.getRoleByUserNameAndPwd(loginId, pwd);

            if (role != null) {
            	System.out.println("Get Role : " + role.toString());

            	sflag = ActionSupport.SUCCESS;
            } else {
            	System.out.println("Didn't found Role");
            }
		} 

		ActionContext.getContext().getSession().put("loginFlag", sflag);

		return sflag;
	}

	public String logout() {
		System.out.println("logout() begin...");

		ActionContext.getContext().getSession().put("loginFlag", "logout");

		return ActionSupport.SUCCESS;
	}

}
