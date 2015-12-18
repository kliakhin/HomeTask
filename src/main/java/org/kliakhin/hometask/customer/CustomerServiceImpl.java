package org.kliakhin.hometask.customer;

import java.util.List;

import javax.inject.*;

import org.springframework.transaction.annotation.Transactional;

@Named
public class CustomerServiceImpl implements CustomerService {

	@Inject
	private CustomerDao customerDao;

	@Override
	public Customer findById(int id) {
		return customerDao.findById(id);
	}

	@Override
	public List<Customer> findAll() {
		return customerDao.findAll();
	}

    @Transactional
	public void save(Customer customer) {
		customerDao.save(customer);

	}

	@Override
	public void remove(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateAccount() {
		// TODO Auto-generated method stub

	}

}
