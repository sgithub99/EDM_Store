package dto;

import com.entities.Product;

public class CartDTO {
	private Product product;
	private int quantity;
	private float totalPrice;

	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartDTO(Product product, int quantity, float totalPrice) {
		super();
		this.product = product;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

}
