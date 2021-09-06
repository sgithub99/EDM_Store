package com.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.CustomerDAO;
import com.entities.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean registerCustomer(Customer customer) {
		Customer cus = new Customer();
		String password = BCrypt.hashpw(customer.getPassword(), BCrypt.gensalt(12));
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			cus.setCusName(customer.getCusName());
			cus.setBirthday(customer.getBirthday());
			cus.setEmail(customer.getEmail());
			cus.setAddress(customer.getAddress());
			cus.setPhone(customer.getPhone());
			cus.setUsername(customer.getUsername());
			cus.setPassword(password);
			session.save(cus);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
		}
		return false;
	}

	@Override
	public boolean loginCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean existEmail(String email, List<Customer> listCustomers) {
		for (Customer customer : listCustomers) {
			if (customer.getEmail().toLowerCase().equals(email.toLowerCase())) {
				return true;
			}
		}
		return false;
	}

	@Override
	public List<Customer> getListCustomer() {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Customer").list();
			session.getTransaction().commit();
			session.close();
			return list;
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public Customer getCustomerById(Integer cusId) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			Customer customer = session.get(Customer.class, cusId);
			session.getTransaction().commit();
			session.close();
			return customer;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	@Override
	public boolean updateCustomer(Customer customer) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			session.update(customer);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {

		}

		return false;
	}

	@Override
	public boolean deleteCustomer(Customer customer) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			session.delete(customer);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {

		}
		return false;
	}

	public boolean checkEmailAndPassword(String email, String password, List<Customer> listCustomer) {
		for (Customer customer : listCustomer) {
			if (customer.getEmail().equals(email) && BCrypt.checkpw(password, customer.getPassword())) {
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean checkAccount(Customer customer, List<Customer> listCustomers) {
		String email = customer.getEmail();
		String password = customer.getPassword();
		if (checkEmailAndPassword(email, password, listCustomers)) {
			return true;
		}
		return false;
	}

	@Override
	public Customer getCustomerByEmail(String email) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			//Customer customer = session.get(Customer.class, email);
			List list = session.createQuery("from Customer where email = :email")
			.setParameter("email", email)
			.list();
			session.getTransaction().commit();
			session.close();
			if(list!=null && list.size()>0)
				return (Customer)list.get(0);
		} catch (Exception e) {
		}
		return null;
	}

}
