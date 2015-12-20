package org.kliakhin.hometask.service;

import java.util.List;

import javax.inject.*;

import org.kliakhin.hometask.dao.CustomerDao;
import org.kliakhin.hometask.entity.Customer;
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

	@Transactional
	public void remove(int id) {
		customerDao.remove(id);

	}

	@Override
	public void updateAccount() {
		// TODO Auto-generated method stub

	}

}
