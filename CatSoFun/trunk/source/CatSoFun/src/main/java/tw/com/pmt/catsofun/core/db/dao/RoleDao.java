package tw.com.pmt.catsofun.core.db.dao;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import tw.com.pmt.catsofun.core.common.dao.GenericDao;
import tw.com.pmt.catsofun.core.db.model.Role;

@Repository
public class RoleDao extends GenericDao<Role> {

	/**
	 * 根據帳號名稱取得相關資料
	 * 
	 * @param userName
	 * @return Role
	 */
	public Role findRoleByUserName(String userName) {
		if (userName != null && !userName.isEmpty()) {
			Query query = getSession().createQuery("from Role where user_name = :userName");

			return (Role) query.setString("userName", userName).uniqueResult();
		}
		
		return null;
	}
	
}