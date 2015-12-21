package tw.com.pmt.catsofun.core.business.service;

import java.util.List;

import tw.com.pmt.catsofun.core.db.model.Record;

public interface IRecordService {

	/**
	 * 新增一筆作答紀錄
	 * 
	 * @param record
	 * @return Record
	 */
	Record insertRecord(Record record);
	
	/**
	 * 取得所有作答紀錄
	 * 
	 * @return List<Record>
	 */
	List<Record> getAllRecord();
	
	/**
	 * 根據Id取得作答反應
	 * 
	 * @param id
	 * @return Record
	 */
	Record getRecordById(Long id);
	
}