package com.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Producer")
public class Producer {
	@Id
	@Column(name = "ProducerId")
	private String producerId;
	@Column(name = "ProducerName")
	private String producerName;
	@Column(name = "Address")
	private String address;
	
	@OneToMany(mappedBy = "producerId")
	private List<Product> listProducts;

	public Producer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Producer(String producerId, String producerName, String address, List<Product> listProducts) {
		super();
		this.producerId = producerId;
		this.producerName = producerName;
		this.address = address;
		this.listProducts = listProducts;
	}

	public String getProducerId() {
		return producerId;
	}

	public void setProducerId(String producerId) {
		this.producerId = producerId;
	}

	public String getProducerName() {
		return producerName;
	}

	public void setProducerName(String producerName) {
		this.producerName = producerName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<Product> getListProducts() {
		return listProducts;
	}

	public void setListProducts(List<Product> listProducts) {
		this.listProducts = listProducts;
	}
	
	

}
