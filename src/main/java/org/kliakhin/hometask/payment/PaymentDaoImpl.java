package org.kliakhin.hometask.payment;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

@Repository
public class PaymentDaoImpl implements PaymentDao {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Payment findById(int id) {
		return em.find(Payment.class, id);
	}

	@Override
	public List<Payment> findAll() {
		TypedQuery<Payment> query = em.createQuery("SELECT p FROM Payment p", Payment.class);
		List<Payment> listP = query.getResultList();
		return listP;
	}

	@Override
	public void save(Payment payment) {
		em.persist(payment);

	}

	@Override
	public void remove(int id) {
		Payment payment = em.find(Payment.class, id);
		if (payment != null) {
			em.remove(payment);
		}
	}

	@Override
	public double getMerchantCash(int merchantId) {
		TypedQuery<Payment> query = em.createQuery("SELECT p FROM Payment p WHERE p.merchantId = ?1", Payment.class);
		query.setParameter(1, merchantId);
		double merchantCash = 0.0d;
		List<Payment> list = query.getResultList();
		for (Payment payment : list) {
			merchantCash += payment.getSumPayed() - payment.getChargePayed();
		}
		return merchantCash;
	}
}
