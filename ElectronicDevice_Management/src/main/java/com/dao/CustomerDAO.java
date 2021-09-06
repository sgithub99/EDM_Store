package com.dao;

import java.util.List;

import com.entities.Customer;

public interface CustomerDAO {

	public boolean registerCustomer(Customer customer);

	public boolean loginCustomer(Customer customer);

	public boolean existEmail(String email, List<Customer> listCustomers);

	public List<Customer> getListCustomer();

	public Customer getCustomerById(Integer cusId);

	public boolean updateCustomer(Customer customer);

	public boolean deleteCustomer(Customer customer);
	
	public boolean checkAccount(Customer customer, List<Customer> listCustomers);
	
	public Customer getCustomerByEmail(String email);

}
