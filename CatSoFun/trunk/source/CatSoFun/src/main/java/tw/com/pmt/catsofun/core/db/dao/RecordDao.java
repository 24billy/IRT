package tw.com.pmt.catsofun.core.db.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import tw.com.pmt.catsofun.core.common.dao.GenericDao;
import tw.com.pmt.catsofun.core.db.model.Record;

@Repository
public class RecordDao extends GenericDao<Record> {
	
	/**
	 * 根據帳號名稱取得相關資料
	 * 
	 * @param userName
	 * @return Role
	 */
	public Record findRecordByRoleId(Long roleId) {
		if (roleId != null) {
			Query query = getSession().createQuery("from Record where role_id = :roleId");

			return (Record) query.setLong("roleId", roleId).uniqueResult();
		}

		return null;
	}

	public List<Record> findRecordByRoleId(String roleName) {
		if (roleName != null) {
			Query query = getSession().createQuery("from Record where role_name = :roleName and is_finished = TRUE ORDER BY create_time DESC");

			query.setString("roleName", roleName);

			return query.list();
		}

		return null;
	}

}
