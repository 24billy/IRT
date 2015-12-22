package tw.com.pmt.catsofun.core.business.service;

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
		record.setAbility(0.2);
		record.setSelectedItems(new int[]{1,2,3,4,5});
		record.setSelectedOptions(new int[]{1,2,1,1,3});
		record.setIsFinished(true);
		record.setRoleId(1L);
		
		System.out.println("before" + recordService.getAllRecord());
		
		recordService.insertRecord(record);
		System.out.println("after" + recordService.getAllRecord());
		
		System.out.println(recordService.getRecordByRoleId(1L));
	}

	@Test
	public void testGetAllRecord() {
		System.out.println("after" + recordService.getAllRecord());
	}

	@Test
	public void testGetRecordByRoleId() {
		
	}

}
