package org.kliakhin.hometask.service;

import java.util.Collections;
import java.util.List;

import javax.inject.*;

import org.kliakhin.hometask.entity.Transmoney;
import org.kliakhin.hometask.dao.TransmoneyDao;
import org.springframework.transaction.annotation.Transactional;

@Named
public class TransmoneyServiceImpl implements TransmoneyService {

	@Inject
	private TransmoneyDao trasnMoneyDao;

	@Override
	public Transmoney findById(int id) {
		return trasnMoneyDao.findById(id);
	}

	public Transmoney findByMerchantId(int id) {
		return null;
	}

	@Override
	public List<Transmoney> findAll() {
		return trasnMoneyDao.findAll();
	}

	@Override
	public List<Transmoney> findWithFalseStatus() {
		List<Transmoney> list = trasnMoneyDao.findWithFalseStatus();
		Collections.sort(list, new Transmoney());
		return list;
	}

	@Transactional
	public void save(Transmoney transmoney) {
		trasnMoneyDao.save(transmoney);
	}

	@Transactional
	public void remove(int id) {
		trasnMoneyDao.remove(id);

	}

	@Transactional
	public void doTransaction(int id) {
		trasnMoneyDao.doTransaction(id);
	}
}
