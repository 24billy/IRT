package tw.com.pmt.catsofun.core.common.dao;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.pmt.catsofun.core.common.entity.GenericEntity;


public class GenericDao<T extends GenericEntity> {

	private Class<T> entityClass;
	//Class<T>使用泛型, 宣告以T為型態的class
	//T在本專案裡可為: UserEntity, GameEntity, LotteryEntity, OddsEntity, OddsEntity
	
	//泛型文件 http://docs.oracle.com/javase/7/docs/api/java/lang/Class.html
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public GenericDao() {
		this.entityClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
		
		//((ParameterizedType) getClass().getGenericSuperclass())
		//返回表示此Class 所表示的實體（類、接口、基本類型或void）的直接超類的Type 然後將其轉換ParameterizedType
		//getActualTypeArguments()返回表示此類型實際類型參數的Type 對象的數組。 
		//[0]就是這個數組中第一個了。 簡而言之就是獲得超類的泛型參數的實際類型。
		
		//出處: http://translate.google.com.tw/translate?hl=zh-TW&sl=zh-CN&u=http://blog.sina.com.cn/s/blog_63db5fc10100tu7t.html&prev=/search%3Fq%3DgetActualTypeArguments()%255B0%255D%26safe%3Doff%26biw%3D1152%26bih%3D739
	}
	
	//使用.getCurrentSession()，session的壽命存在於getCurrentSession()和 commit()/rollback()之間
	//本專案的rollback()出現在:
	//spring-database.xml 和 spring-service.xml
	//最後Spring 會幫我們 close the connection, statement and resultset.
	public List<T> findAll(){
		return getSession().createCriteria(entityClass).list();
	}
	
	public T findById(Long id){
		return (T)getSession().get(entityClass, id);
	}
	
	public T insert(T entity){
		getSession().persist(entity);
		return entity;
	}

	public T update(T entity){
		getSession().merge(entity);
		return entity;
	}
	
	public void delete(T entity){
		getSession().delete(entity);
	}
	
	protected Session getSession(){
		return sessionFactory.getCurrentSession();
	}
}
