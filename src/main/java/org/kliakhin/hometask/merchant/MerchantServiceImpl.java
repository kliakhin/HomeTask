package org.kliakhin.hometask.merchant;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.inject.*;

import org.springframework.transaction.annotation.Transactional;

@Named
public class MerchantServiceImpl implements MerchantService {

	@Inject
	private MerchantDao merchantDao;

	@Override
	public Merchant findById(int id) {
		return merchantDao.findById(id);
	}

	@Override
	public List<Merchant> findAll() {
		return merchantDao.findAll();
	}

	public List<Merchant> findMerchantListForTrans() {
		java.util.List<Merchant> list = merchantDao.findMerchantListForTrans();
		List<Merchant> listForTransmoney = new ArrayList<>();
		list.forEach(merchant -> {
			LocalDate today = LocalDate.now();
			LocalDate lastSent = merchant.getLastSent().toLocalDate();
			LocalDate sentDate = null;
			switch (merchant.getPeriod()) {
			case 1: {
				sentDate = lastSent.plusDays(7);
				break;
			}
			case 2: {
				sentDate = lastSent.plusDays(10);
				break;
			}
			case 3: {
				sentDate = lastSent.plusMonths(1);
				break;
			}
			default:
				System.out.println("Not entered period");
			}
			if ((sentDate.isBefore(today))) {
				listForTransmoney.add(merchant);
			}
		});
		return listForTransmoney;
	}

	@Transactional
	public void save(Merchant merchant) {
		merchantDao.save(merchant);
	}

	@Transactional
	public void remove(int id) {
		merchantDao.remove(id);

	}

	@Transactional
	public void updateNeddToSend(int id, double newNeedToSent) {
		merchantDao.updateNeddToSend(id, newNeedToSent);
		System.out.println("NeedToSend up");
	}

	@Transactional
	public void updateLastSent(int id, Date newLastSent) {
		merchantDao.updateLastSent(id, newLastSent);
	}

	@Transactional
	public void updateForTrans(int id, Date newLastSent, double newNeedToSent, double newSent) {
		merchantDao.updateForTrans(id, newLastSent, newNeedToSent, newSent);

	}

	@Transactional
	public void updateToStart(int id, double needToSend) {
		merchantDao.updateToStart(id, needToSend);

	}
}
