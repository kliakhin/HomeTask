package org.kliakhin.hometask.merchant;

import java.sql.Date;
import java.util.List;

public interface MerchantService {

	public Merchant findById(int id);

	public List<Merchant> findAll();
	
	public List<Merchant> findMerchantListForTrans();

	public void save(Merchant merchant);

	public void remove(int id);

	public void updateNeddToSend(int id, double newNeedToSent);

	public void updateLastSent(int id, Date newLastSent);

	public void updateForTrans(int id, Date newLastSent, double newNeedToSent, double newSent);
	
	public void updateToStart(int id, double needToSend);
}
