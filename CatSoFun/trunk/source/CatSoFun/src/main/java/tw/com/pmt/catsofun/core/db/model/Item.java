package tw.com.pmt.catsofun.core.db.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import tw.com.pmt.catsofun.core.common.entity.GenericEntity;

/**
 * 題目 Model
 *  
 * @author Billy
 *
 */
@Entity
@Table(name="item")
public class Item extends GenericEntity {

	private static final long serialVersionUID = -3042820471405562731L;

	@Column(name="item_content", length=100, nullable = false)
	private String itemContent;
	
	@Column(name = "delta", columnDefinition = "NUMERIC(8,3) default 0")
	private Double delta;
	
	@Column(name = "step1", columnDefinition = "NUMERIC(8,3) default 0")
	private Double step1;
	
	@Column(name = "step2", columnDefinition = "NUMERIC(8,3) default 0")
	private Double step2;
	
	@Column(name = "step3", columnDefinition = "NUMERIC(8,3) default 0")
	private Double step3;
	
	@Column(name = "step4", columnDefinition = "NUMERIC(8,3) default 0")
	private Double step4;
	
	@Column(name = "answer_type")
	private Long answerType;
	

	public String getItemContent() {
		return itemContent;
	}

	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
	}

	public Double getDelta() {
		return delta;
	}

	public void setDelta(Double delta) {
		this.delta = delta;
	}

	public Double getStep1() {
		return step1;
	}

	public void setStep1(Double step1) {
		this.step1 = step1;
	}

	public Double getStep2() {
		return step2;
	}

	public void setStep2(Double step2) {
		this.step2 = step2;
	}

	public Double getStep3() {
		return step3;
	}

	public void setStep3(Double step3) {
		this.step3 = step3;
	}

	public Double getStep4() {
		return step4;
	}

	public void setStep4(Double step4) {
		this.step4 = step4;
	}

	public Long getAnswerType() {
		return answerType;
	}

	public void setAnswerType(Long answerType) {
		this.answerType = answerType;
	}

	@Override
	public String toString() {
		return "Item [itemContent=" + itemContent + ", delta=" + delta
				+ ", step1=" + step1 + ", step2=" + step2 + ", step3=" + step3
				+ ", step4=" + step4 + ", answerType=" + answerType
				 + ", id=" + id + "]";
	}

}
