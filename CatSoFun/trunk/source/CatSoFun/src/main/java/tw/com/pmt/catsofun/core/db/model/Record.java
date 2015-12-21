package tw.com.pmt.catsofun.core.db.model;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import tw.com.pmt.catsofun.core.common.entity.GenericEntity;

/**
 * 作答紀錄 Model
 *  
 * @author Billy
 *
 */
@Entity
@Table(name="record")
public class Record extends GenericEntity  {

	private static final long serialVersionUID = 3131964513654250815L;
	
	@Column(name = "ability", columnDefinition = "NUMERIC(8,3) default 0")
	private Double ability;
	
	@Column(name = "selected_items")
	private int[] selectedItems;
	
	@Column(name = "is_finished")
	private Boolean isFinished;

	public Double getAbility() {
		return ability;
	}

	public void setAbility(Double ability) {
		this.ability = ability;
	}

	public int[] getSelectedItems() {
		return selectedItems;
	}

	public void setSelectedItems(int[] selectedItems) {
		this.selectedItems = selectedItems;
	}

	public Boolean getIsFinished() {
		return isFinished;
	}

	public void setIsFinished(Boolean isFinished) {
		this.isFinished = isFinished;
	}

	@Override
	public String toString() {
		return "Record [ability=" + ability + ", selectedItems="
				+ Arrays.toString(selectedItems) + ", isFinished=" + isFinished
				+ ", id=" + id + "]";
	}
	
}
