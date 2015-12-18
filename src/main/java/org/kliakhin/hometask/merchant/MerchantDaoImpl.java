package org.kliakhin.hometask.merchant;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.*;

import org.springframework.stereotype.Repository;

@Repository
public class MerchantDaoImpl implements MerchantDao {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Merchant findById(int id) {
		return em.find(Merchant.class, id);
	}

	@Override
	public List<Merchant> findAll() {
		TypedQuery<Merchant> query = em.createQuery("SELECT m FROM Merchant m", Merchant.class);
		List<Merchant> listM = query.getResultList();
		return listM;
	}

	@Override
	public List<Merchant> findMerchantListForTrans() {
		TypedQuery<Merchant> query = em.createQuery("SELECT m FROM Merchant m WHERE m.needToSend > m.minSum",
				Merchant.class);
		List<Merchant> listM = query.getResultList();
		return listM;
	}

	@Override
	public void save(Merchant merchant) {
		em.persist(merchant);
	}

	@Override
	public void remove(int id) {
		Merchant merchant = em.find(Merchant.class, id);
		if (merchant != null) {
			em.remove(merchant);
		}
	}

	@Override
	public void updateNeddToSend(int id, double newNeedToSent) {
		Merchant merchant = em.find(Merchant.class, id);
		if (merchant != null) {
			merchant.setNeedToSend(merchant.getNeedToSend() + newNeedToSent);
		}
	}

	@Override
	public void updateLastSent(int id, Date newLastSent) {
		Merchant merchant = em.find(Merchant.class, id);
		if (merchant != null) {
			merchant.setLastSent(newLastSent);
		}
	}

	@Override
	public void updateForTrans(int id, Date newLastSent, double newNeedToSent, double newSent) {
		Merchant merchant = em.find(Merchant.class, id);
		if (merchant != null) {
			merchant.setLastSent(newLastSent);
			merchant.setNeedToSend(merchant.getNeedToSend() - newNeedToSent);
			merchant.setSent(merchant.getSent() + newSent);
		}

	}

	@Override
	public void updateToStart(int id, double needToSend) {
		Merchant merchant = em.find(Merchant.class, id);
		if (merchant != null) {
			merchant.setLastSent(Date.valueOf(LocalDate.now().minusYears(1)));
			merchant.setNeedToSend(needToSend);
			merchant.setSent(0);
		}
	}
}
