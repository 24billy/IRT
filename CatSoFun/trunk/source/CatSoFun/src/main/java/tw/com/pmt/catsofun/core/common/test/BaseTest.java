package tw.com.pmt.catsofun.core.common.test;




import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:spring-*.xml"})
@TransactionConfiguration(defaultRollback = false, transactionManager = "transactionManager")
@Transactional
public class BaseTest {
	protected Logger log = LoggerFactory.getLogger(this.getClass());
}
