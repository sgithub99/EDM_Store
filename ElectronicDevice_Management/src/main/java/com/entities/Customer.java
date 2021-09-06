package com.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Customer")
public class Customer implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CusId")
	private Integer cusId;
	@Column(name = "CusName")
	private String cusName;
	@Column(name = "Birthday")
	private Date birthday;
	@Column(name = "Email")
	private String email;
	@Column(name = "Address")
	private String address;
	@Column(name = "Phone")
	private String phone;
	@Column(name = "Username")
	private String username;
	@Column(name = "Password")
	private String password;

	@OneToMany(mappedBy = "cusId")
	private List<Order> listOrders;

	public Customer() {
		super();
	}

	public Customer(Integer cusId, String cusName, Date birthday, String email, String address, String phone,
			String username, String password, List<Order> listOrders) {
		super();
		this.cusId = cusId;
		this.cusName = cusName;
		this.birthday = birthday;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.username = username;
		this.password = password;
		this.listOrders = listOrders;
	}

	public List<Order> getListOrders() {
		return listOrders;
	}

	public void setListOrders(List<Order> listOrders) {
		this.listOrders = listOrders;
	}

	public Integer getCusId() {
		return cusId;
	}

	public void setCusId(Integer cusId) {
		this.cusId = cusId;
	}

	public String getCusName() {
		return cusName;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
