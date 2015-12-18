package org.kliakhin.hometask.transmoney;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.*;

import org.springframework.stereotype.Repository;

@Repository
public class TransmoneyDaoImpl implements TransmoneyDao {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Transmoney findById(int id) {
		return em.find(Transmoney.class, id);
	}

	@Override
	public Transmoney findByMerchantId(int id) {
		return null;
	}

	@Override
	public List<Transmoney> findAll() {
		TypedQuery<Transmoney> query = em.createQuery("SELECT tm FROM Transmoney tm", Transmoney.class);
		List<Transmoney> listTM = query.getResultList();
		return listTM;
	}

	@Override
	public List<Transmoney> findWithFalseStatus() {
		TypedQuery<Transmoney> query = em.createQuery("SELECT tm FROM Transmoney tm WHERE tm.status = 'F'",
				Transmoney.class);
		List<Transmoney> listTM = query.getResultList();
		return listTM;
	}

	@Override
	public void save(Transmoney transmoney) {
		em.persist(transmoney);

	}

	@Override
	public void remove(int id) {
		Transmoney transmoney = em.find(Transmoney.class, id);
		if (transmoney != null) {
			em.remove(transmoney);
		}

	}

	@Override
	public void doTransaction(int id) {
		Transmoney transmoney = em.find(Transmoney.class, id);
		if (transmoney != null) {
			transmoney.setStatus("T");
			transmoney.setSentDate(Timestamp.valueOf(LocalDateTime.now()));
		}

	}
}
