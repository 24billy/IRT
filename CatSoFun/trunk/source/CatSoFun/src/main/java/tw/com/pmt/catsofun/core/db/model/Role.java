package tw.com.pmt.catsofun.core.db.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import tw.com.pmt.catsofun.core.common.entity.GenericEntity;

/**
 * 角色 model
 * 
 * @author Billy
 *
 */
@Entity
@Table(name = "role")
public class Role extends GenericEntity {

	private static final long serialVersionUID = 2834497877210109770L;

	// userName
	@Column(name = "user_name", length = 50, nullable = false)
	private String userName;
	
	// userPassword
	@Column(name = "user_password", length = 50, nullable = false)
	private String userPassword;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	@Override
	public String toString() {
		return "Role [userName=" + userName + ", userPassword=" + userPassword
				+ ", id=" + id + "]";
	}
	
}