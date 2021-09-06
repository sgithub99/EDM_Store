package com.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Payment")
public class Payment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PaymentId")
	private int paymentId;
	@Column(name = "Method")
	private String method;

	@OneToMany(mappedBy = "paymentId")
	private List<OrderDetail> listOrderDetails;

	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Payment(int paymentId, String method, List<OrderDetail> listOrderDetails) {
		super();
		this.paymentId = paymentId;
		this.method = method;
		this.listOrderDetails = listOrderDetails;
	}

	public int getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public List<OrderDetail> getListOrderDetails() {
		return listOrderDetails;
	}

	public void setListOrderDetails(List<OrderDetail> listOrderDetails) {
		this.listOrderDetails = listOrderDetails;
	}
	
	

}
