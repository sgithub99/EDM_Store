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
@Table(name = "Category")
public class Category {
	@Id
	@Column(name = "CateId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cateId;
	@Column(name = "CateName")
	private String cateName;
	
	@OneToMany(mappedBy = "categoryId")
	private List<Product> listProducts;

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(Integer cateId, String cateName, List<Product> listProducts) {
		super();
		this.cateId = cateId;
		this.cateName = cateName;
		this.listProducts = listProducts;
	}

	public Integer getCateId() {
		return cateId;
	}

	public void setCateId(Integer cateId) {
		this.cateId = cateId;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public List<Product> getListProducts() {
		return listProducts;
	}

	public void setListProducts(List<Product> listProducts) {
		this.listProducts = listProducts;
	}
	
	

}
