package tw.com.pmt.catsofun.core.db.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import tw.com.pmt.catsofun.core.common.entity.GenericEntity;

/**
 * 作答反應model
 * 
 * @author Billy
 * 
 */
@Entity
@Table(name = "response")
public class Response extends GenericEntity {

	private static final long serialVersionUID = -5848362979184278608L;

	// response_content
	@Column(name = "response_content", length = 100, nullable = false)
	private String responseContent;

	// guild
	@Column(name = "guild", length = 100, nullable = false)
	private String guild;

	public String getResponseContent() {
		return responseContent;
	}

	public void setResponseContent(String responseContent) {
		this.responseContent = responseContent;
	}

	public String getGuild() {
		return guild;
	}

	public void setGuild(String guild) {
		this.guild = guild;
	}

	@Override
	public String toString() {
		return "Response [responseContent=" + responseContent + ", guild="
				+ guild + ", id=" + id + "]";
	}

}