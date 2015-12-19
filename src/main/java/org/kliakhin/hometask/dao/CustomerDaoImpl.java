package org.kliakhin.hometask.dao;

import java.util.List;

import javax.persistence.*;

import org.kliakhin.hometask.entity.Customer;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@PersistenceContext
	EntityManager em;

	@Override
	public Customer findById(int id) {
		return em.find(Customer.class, id);
	}

	@Override
	public List<Customer> findAll() {
		TypedQuery<Customer> query = 
				em.createQuery("SELECT c FROM Customer c", Customer.class);
		List<Customer> listC = query.getResultList();
		return listC;
	}

	@Override
	public void save(Customer customer) {
		em.persist(customer);
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
