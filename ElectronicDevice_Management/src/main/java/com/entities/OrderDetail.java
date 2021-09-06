package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "OrderDetail")
public class OrderDetail {

	@Id
	@Column(name = "OrderDetailId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderDetailId;
	@Column(name = "Price")
	private float price;
	@Column(name = "Quantity")
	private int quantity;
	@Column(name = "Money")
	private float money;
	@Column(name = "TotalMoney")
	private float totalMoney;

	@ManyToOne
	@JoinColumn(name = "ProId", referencedColumnName = "ProId")
	private Product proId;

	@ManyToOne
	@JoinColumn(name = "PaymentId", referencedColumnName = "PaymentId")
	private Payment paymentId;

	@ManyToOne
	@JoinColumn(name = "ShipmentId", referencedColumnName = "ShipmentId")
	private Shipment shipmentId;

	@ManyToOne
	@JoinColumn(name = "OrderId", referencedColumnName = "OrderId")
	private Order orderId;

	public OrderDetail() {
		super();
	}

	public OrderDetail(int orderDetailId, float price, int quantity, float money, float totalMoney, Product proId,
			Payment paymentId, Shipment shipmentId, Order orderId) {
		super();
		this.orderDetailId = orderDetailId;
		this.price = price;
		this.quantity = quantity;
		this.money = money;
		this.totalMoney = totalMoney;
		this.proId = proId;
		this.paymentId = paymentId;
		this.shipmentId = shipmentId;
		this.orderId = orderId;
	}

	public int getOrderDetailId() {
		return orderDetailId;
	}

	public void setOrderDetailId(int orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}

	public float getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(float totalMoney) {
		this.totalMoney = totalMoney;
	}

	public Product getProId() {
		return proId;
	}

	public void setProId(Product proId) {
		this.proId = proId;
	}

	public Payment getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(Payment paymentId) {
		this.paymentId = paymentId;
	}

	public Shipment getShipmentId() {
		return shipmentId;
	}

	public void setShipmentId(Shipment shipmentId) {
		this.shipmentId = shipmentId;
	}

	public Order getOrderId() {
		return orderId;
	}

	public void setOrderId(Order orderId) {
		this.orderId = orderId;
	}

}
