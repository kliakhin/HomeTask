package org.kliakhin.hometask.payment;

import java.util.List;

public interface PaymentDao {

	public Payment findById(int id);

	public List<Payment> findAll();

	public void save(Payment payment);

	public void remove(int id);

	public double getMerchantCash(int merchantId);

}
