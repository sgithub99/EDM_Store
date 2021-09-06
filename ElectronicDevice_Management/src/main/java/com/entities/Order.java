package com.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Orderr")
public class Order {

	@Id
	@Column(name = "OrderId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderId;
	@Column(name = "DateOfPayment")
	private Date dateOfPayment;
	@Column(name = "CustomerName")
	private String cusName;
	@Column(name = "Address")
	private String address;
	@Column(name = "Email")
	private String email;
	@Column(name = "Telephone")
	private String phone;
	@Column(name = "Status")
	private boolean status;

	@ManyToOne
	@JoinColumn(name = "CusId", referencedColumnName = "CusId")
	private Customer cusId;

	@OneToMany(mappedBy = "orderId")
	private List<OrderDetail> lisOrderDetails;

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(int orderId, Date dateOfPayment, String cusName, String address, String email, String phone,
			boolean status, Customer cusId) {
		super();
		this.orderId = orderId;
		this.dateOfPayment = dateOfPayment;
		this.cusName = cusName;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.status = status;
		this.cusId = cusId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Date getDateOfPayment() {
		return dateOfPayment;
	}

	public void setDateOfPayment(Date dateOfPayment) {
		this.dateOfPayment = dateOfPayment;
	}

	public String getCusName() {
		return cusName;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Customer getCusId() {
		return cusId;
	}

	public void setCusId(Customer cusId) {
		this.cusId = cusId;
	}

}
