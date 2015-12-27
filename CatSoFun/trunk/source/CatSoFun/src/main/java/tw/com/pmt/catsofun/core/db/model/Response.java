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

	// options
	@Column(name = "option_01", length = 50, nullable = false)
	private String option01;
	
	@Column(name = "option_02", length = 50, nullable = false)
	private String option02;
	
	@Column(name = "option_03", length = 50, nullable = false)
	private String option03;
	
	@Column(name = "option_04", length = 50, nullable = false)
	private String option04;
	
	@Column(name = "option_05", length = 50, nullable = false)
	private String option05;

	// guild
	@Column(name = "guild", length = 150, nullable = false)
	private String guild;

	public String getOption01() {
		return option01;
	}

	public void setOption01(String option01) {
		this.option01 = option01;
	}

	public String getOption02() {
		return option02;
	}

	public void setOption02(String option02) {
		this.option02 = option02;
	}

	public String getOption03() {
		return option03;
	}

	public void setOption03(String option03) {
		this.option03 = option03;
	}

	public String getOption04() {
		return option04;
	}

	public void setOption04(String option04) {
		this.option04 = option04;
	}

	public String getOption05() {
		return option05;
	}

	public void setOption05(String option05) {
		this.option05 = option05;
	}

	public String getGuild() {
		return guild;
	}

	public void setGuild(String guild) {
		this.guild = guild;
	}

	@Override
	public String toString() {
		return "Response [option01=" + option01 + ", option02=" + option02
				+ ", option03=" + option03 + ", option04=" + option04
				+ ", option05=" + option05 + ", guild=" + guild + ", id=" + id
				+ "]";
	}

}