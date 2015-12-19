package org.kliakhin.hometask.service;

import java.util.List;

import javax.inject.*;

import org.kliakhin.hometask.dao.PaymentDao;
import org.kliakhin.hometask.entity.Payment;
import org.springframework.transaction.annotation.Transactional;

@Named
public class PaymentServiceImpl implements PaymentService {

	@Inject
	private PaymentDao paymentDao;

	@Override
	public Payment findById(int id) {
		return paymentDao.findById(id);
	}

	@Override
	public List<Payment> findAll() {
		return paymentDao.findAll();
	}

	@Transactional
	public void save(Payment payment) {
		paymentDao.save(payment);
	}

	@Transactional
	public void remove(int id) {
		paymentDao.remove(id);
	}

	@Override
	public double getMerchantCash(int merchantId) {
		return paymentDao.getMerchantCash(merchantId);
		
	}

}
