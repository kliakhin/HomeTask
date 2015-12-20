package org.kliakhin.hometask.entity;

import java.util.Comparator;

import javax.persistence.*;

@Entity
public class Transmoney {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int merchantId;
    private double sumSent;
    private java.sql.Timestamp sentDate;
    private String status;

    public Transmoney() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(int merchantId) {
        this.merchantId = merchantId;
    }

    public double getSumSent() {
        return sumSent;
    }

    public void setSumSent(double sumSent) {
        this.sumSent = sumSent;
    }

    public java.sql.Timestamp getSentDate() {
        return sentDate;
    }

    public void setSentDate(java.sql.Timestamp sentDate) {
        this.sentDate = sentDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
