package com.entities;

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
@Table(name = "Product")
public class Product {
	@Id
	@Column(name = "ProId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer proId;
	@Column(name = "ProName")
	private String proName;
	@Column(name = "Price")
	private Float price;
	@Column(name = "Description")
	private String description;
	@Column(name = "ImageUrl")
	private String imgUrl;

	@ManyToOne
	@JoinColumn(name = "CategoryId", referencedColumnName = "CateId")
	private Category categoryId;

	@ManyToOne
	@JoinColumn(name = "ProducerId", referencedColumnName = "ProducerId")
	private Producer producerId;

	@OneToMany(mappedBy = "proId")
	private List<Image> listImages;

	@OneToMany(mappedBy = "proId")
	private List<OrderDetail> listOrderDetails;

	public Product() {
		super();
	}

	public Product(Integer proId, String proName, Float price, String description, String imgUrl, Category categoryId,
			Producer producerId, List<Image> listImages, List<OrderDetail> listOrderDetails) {
		super();
		this.proId = proId;
		this.proName = proName;
		this.price = price;
		this.description = description;
		this.imgUrl = imgUrl;
		this.categoryId = categoryId;
		this.producerId = producerId;
		this.listImages = listImages;
		this.listOrderDetails = listOrderDetails;
	}

	public List<OrderDetail> getListOrderDetails() {
		return listOrderDetails;
	}

	public void setListOrderDetails(List<OrderDetail> listOrderDetails) {
		this.listOrderDetails = listOrderDetails;
	}

	public Integer getProId() {
		return proId;
	}

	public void setProId(Integer proId) {
		this.proId = proId;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public Category getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Category categoryId) {
		this.categoryId = categoryId;
	}

	public Producer getProducerId() {
		return producerId;
	}

	public void setProducerId(Producer producerId) {
		this.producerId = producerId;
	}

	public List<Image> getListImages() {
		return listImages;
	}

	public void setListImages(List<Image> listImages) {
		this.listImages = listImages;
	}

}
