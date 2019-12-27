package project.justice.petition;

import java.sql.Timestamp;

public class PetitionData2DTO extends PetitionDTO{
	private Timestamp p_update;
	private int p_data;
	private int p_data2;
	public Timestamp getP_update() {
		return p_update;
	}
	public void setP_update(Timestamp p_update) {
		this.p_update = p_update;
	}
	public int getP_data() {
		return p_data;
	}
	public void setP_data(int p_data) {
		this.p_data = p_data;
	}
	public int getP_data2() {
		return p_data2;
	}
	public void setP_data2(int p_data2) {
		this.p_data2 = p_data2;
	}
	
}
