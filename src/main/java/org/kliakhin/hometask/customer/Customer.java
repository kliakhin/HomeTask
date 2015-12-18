package org.kliakhin.hometask.customer;

import javax.persistence.*;

@Entity
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String address;
	private String email;
	private String ccNO;
	private String ccType;
	private java.sql.Date maturity;

	public Customer() {

	}

	public String getDataForWeb() {
		String ret = "<tr><td>" + id + "<td>" + name + "<td>" + address + "<td>" + email + "<td>" + ccNO + "<td>"
				+ ccType + "</tr>";
		return ret;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCcNO() {
		return ccNO;
	}

	public void setCcNO(String ccNO) {
		this.ccNO = ccNO;
	}

	public String getCcType() {
		return ccType;
	}

	public void setCcType(String ccType) {
		this.ccType = ccType;
	}

	public java.sql.Date getMaturity() {
		return maturity;
	}

	public void setMaturity(java.sql.Date maturity) {
		this.maturity = maturity;
	}
}
