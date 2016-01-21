package tw.com.pmt.catsofun.core.common.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class GenericEntity implements Serializable {
	
	private static final long serialVersionUID = -2443202906522327537L;

	@Id
	@Column(name = "ID")
	protected Long id;
	//http://docs.oracle.com/javaee/7/api/javax/persistence/GenerationType.html#IDENTITY

	//getter and setter
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
}