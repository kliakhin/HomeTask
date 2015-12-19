package org.kliakhin.hometask.service;

import org.kliakhin.hometask.entity.Customer;

import java.util.List;

public interface CustomerService {
	public Customer findById(int id);

	public List<Customer> findAll();

	public void save(Customer customer);

	public void remove(int id);

	public void updateAccount();
}
