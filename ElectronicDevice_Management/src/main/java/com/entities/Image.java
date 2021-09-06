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
@Table(name = "Image")
public class Image {
	@Id
	@Column(name = "ImageId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer imageId;
	private String imageName;
	private String link;
	
	@ManyToOne
	@JoinColumn(name = "ProId", referencedColumnName = "ProId")
	private Product proId;

	public Image() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Image(Integer imageId, String imageName, String link, Product proId) {
		super();
		this.imageId = imageId;
		this.imageName = imageName;
		this.link = link;
		this.proId = proId;
	}

	public Integer getImageId() {
		return imageId;
	}

	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Product getProId() {
		return proId;
	}

	public void setProId(Product proId) {
		this.proId = proId;
	}
	
	

}
