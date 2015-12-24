package tw.com.pmt.catsofun.core.common.util;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

/**
 * J2EE Scope(容器存取範圍)管理器 (透過Struts2實現)
 * 
 * @author VJChou
 */
public class ScopeUtil {

	/**
	 * The Enum Scope.
	 */
	public static enum Scope {
		REQUEST, SESSION, APPLICATION
	};

	/**
	 * Gets the scope attribute.
	 * 
	 * @param scope
	 *            the scope
	 * @return the scope attribute
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Object> getScopeAttribute(Scope scope) {
		ActionContext actionCtx = ActionContext.getContext();

		if (actionCtx != null) {
			switch (scope) {
			case APPLICATION:
				return actionCtx.getApplication();
			case SESSION:
				return actionCtx.getSession();
			case REQUEST:
			default:
				return (Map<String, Object>) actionCtx.get("request");
			}
		}

		return null;
	}
	
}
