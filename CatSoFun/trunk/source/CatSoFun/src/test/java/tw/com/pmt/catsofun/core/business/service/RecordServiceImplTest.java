package tw.com.pmt.catsofun.core.business.service;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.pmt.catsofun.core.common.test.BaseTest;
import tw.com.pmt.catsofun.core.db.model.Record;

public class RecordServiceImplTest extends BaseTest {

	@Autowired
	private IRecordService recordService;
	
	@Test
	public void testInsertRecord() {
		Record record = new Record();
		record.setId(1L);
		record.setInitAbility(0.2);
		record.setAbility(0.2);
		record.setSelectedItems(new Long[]{1l,2l,3l,4l,5l});
		record.setSelectedOptions(new Long[]{1l,2l,1l,1l,3l});
		record.setIsFinished(true);
		record.setRoleName("Billy");
		
		System.out.println("before" + recordService.getAllRecord());
		
		recordService.insertRecord(record);
		System.out.println("after" + recordService.getAllRecord());
		
		System.out.println(recordService.getRecordByRoleId(1L));
	}

	@Test
	public void testGetAllRecord() {
		List<Record> recordList = recordService.getAllRecord();
		for (Record record : recordList) {
			System.out.println(record);
		}
	}

	@Test
	public void testGetRecordByRoleId() {
		Record record = new Record();
		record.setId(2L);
		record.setInitAbility(0.2);
		record.setAbility(0.2);
		record.setSelectedItems(new Long[]{1l,2l,3l,4l,5l});
		record.setSelectedOptions(new Long[]{1l,2l,1l,1l,3l});
		record.setIsFinished(true);
		record.setRoleName("Billy");
		
		recordService.insertRecord(record);
		List<Record> recordList = recordService.getAllRecord();
		System.out.println("list: " + recordList);
		System.out.println("list size : " + recordList.size());
		
		System.out.println(recordService.getLastRecordId());
//		record.setId(6L);
//		record.setAbility(0.2);
//		record.setSelectedItems(new int[]{1,2,3,4,5});
//		record.setSelectedOptions(new int[]{1,2,1,1,3});
//		record.setIsFinished(true);
//		record.setRoleId(1L);
//		
//		recordService.insertRecord(record);
		
//		System.out.println(recordService.getLastRecordId());
	}

	@Test
	public void testGetLastRecordId() {
		
	}
	
}
