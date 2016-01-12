package tw.com.pmt.catsofun.core.business.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.pmt.catsofun.core.common.dao.GenericDao;
import tw.com.pmt.catsofun.core.common.service.GenericService;
import tw.com.pmt.catsofun.core.db.dao.RecordDao;
import tw.com.pmt.catsofun.core.db.model.Record;

@Service
public class RecordServiceImpl extends GenericService<Record> implements
		IRecordService {

	@Autowired
	RecordDao recordDao;
	
	@Override
	protected GenericDao<Record> getDao() {
		return recordDao;
	}
	
	@Override
	public Record insertRecord(Record record) {
		return recordDao.insert(record);
	}

	@Override
	public List<Record> getAllRecord() {
		return recordDao.findAll();
	}

	@Override
	public Record getRecordById(Long id) {
		return recordDao.findById(id);
	}

	@Override
	public Record getRecordByRoleId(Long roleId) {
		return recordDao.findRecordByRoleId(roleId);
	}

	@Override
	public Record getLastRecordId() {
		List<Record> recordList = recordDao.findAll();
		
		if (recordList != null && !recordList.isEmpty()) {
			return recordList.get(recordList.size() - 1);
		}

		return null;
	}
	
	@Override
	public List<Record> queryRecordByRoleName(String roleName) {
		return recordDao.findRecordByRoleId(roleName);
	}


}