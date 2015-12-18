package org.kliakhin.hometask.payment;

import javax.persistence.*;

@Entity
public class Payment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private double chargePayed;
	private double sumPayed;
	private String goods;
	private java.sql.Timestamp dt;
	private int customerId;
	private int merchantId;

	public String getDataForWeb() {
		String ret = "<tr><td>" + id + "<td>" + chargePayed + "<td>" + sumPayed + "<td>" + goods + "<td>"
				+ dt.toString() + "<td>" + customerId + "<td>" + merchantId + "</tr>";
		return ret;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getChargePayed() {
		return chargePayed;
	}

	public void setChargePayed(double chargePayed) {
		this.chargePayed = chargePayed;
	}

	public double getSumPayed() {
		return sumPayed;
	}

	public void setSumPayed(double sumPayed) {
		this.sumPayed = sumPayed;
	}

	public String getGoods() {
		return goods;
	}

	public void setGoods(String goods) {
		this.goods = goods;
	}

	public java.sql.Timestamp getDt() {
		return dt;
	}

	public void setDt(java.sql.Timestamp dt) {
		this.dt = dt;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int getMerchantId() {
		return merchantId;
	}

	public void setMerchantId(int merchantId) {
		this.merchantId = merchantId;
	}

}
