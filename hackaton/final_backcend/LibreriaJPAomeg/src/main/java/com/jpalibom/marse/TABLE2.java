package com.jpalibom.marse;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.Modelo.FabricantePOJO;

@Entity
public class TABLE2 {

	public interface Fabric
	extends FabricantePOJO{}
	
	String col1;
	String col2;
	String col3;
	String col4;
	String col5;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getCol1() {
		return col1;
	}
	public void setCol1(String id) {
		this.col1 = col1;
	}

	public String getCol2() {
		return col2;
	}
	public void setCol2(String id) {
		this.col2 = col2;
	}
	public String getCol3() {
		return col3;
	}
	public void setCol3(String id) {
		this.col3 = col3;
	}

	public String getCol4() {
		return col4;
	}
	public void setCol4(String id) {
		this.col4 = col4;
	}
	public String getCol5() {
		return col5;
	}
	public void setCol5(String id) {
		this.col5 = col5;
	}
}
