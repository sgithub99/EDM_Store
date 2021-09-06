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
@Table(name = "Shipment")
public class Shipment {

	@Id
	@Column(name = "ShipmentId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int shipmentId;
	@Column(name = "Address")
	private String address;
	@Column(name = "Fee")
	private float fee;

	@OneToMany(mappedBy = "shipmentId")
	private List<OrderDetail> listOrderDetails;

	public Shipment() {
		super();
	}

	public Shipment(int shipmentId, String address, float fee, List<OrderDetail> listOrderDetails) {
		super();
		this.shipmentId = shipmentId;
		this.address = address;
		this.fee = fee;
		this.listOrderDetails = listOrderDetails;
	}

	public int getShipmentId() {
		return shipmentId;
	}

	public void setShipmentId(int shipmentId) {
		this.shipmentId = shipmentId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public float getFee() {
		return fee;
	}

	public void setFee(float fee) {
		this.fee = fee;
	}

	public List<OrderDetail> getListOrderDetails() {
		return listOrderDetails;
	}

	public void setListOrderDetails(List<OrderDetail> listOrderDetails) {
		this.listOrderDetails = listOrderDetails;
	}

}
