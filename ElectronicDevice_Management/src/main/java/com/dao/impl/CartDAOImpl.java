package com.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.CartDAO;
import com.entities.Product;
import com.sun.xml.bind.v2.util.QNameMap.Entry;

import dto.CartDTO;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired
	private ProductDAOImpl productDaoImpl;

	@Override
	public HashMap<Integer, CartDTO> addToCart(int proId, HashMap<Integer, CartDTO> cart) {
		CartDTO cartDTO = new CartDTO();
		Product product = productDaoImpl.getProductById(proId);
		if (product != null && cart.containsKey(proId)) {
			cartDTO = cart.get(proId);
			cartDTO.setQuantity(cartDTO.getQuantity() + 1);
			cartDTO.setTotalPrice(cartDTO.getQuantity() * cartDTO.getProduct().getPrice());
		} else {
			cartDTO.setProduct(product);
			cartDTO.setQuantity(1);
			cartDTO.setTotalPrice(product.getPrice());
		}
		cart.put(proId, cartDTO);
		return cart;
	}

	@Override
	public int getQuantity(HashMap<Integer, CartDTO> cart) {
		int totalQuantity = 0;
		for (Map.Entry<Integer, CartDTO> cartDTO : cart.entrySet()) {
			totalQuantity += cartDTO.getValue().getQuantity();
		}
		return totalQuantity;
	}

	@Override
	public float getTotalPrice(HashMap<Integer, CartDTO> cart) {
		int totalPrice = 0;
		for (Map.Entry<Integer, CartDTO> cartDTO : cart.entrySet()) {
			totalPrice += cartDTO.getValue().getTotalPrice();
		}
		return totalPrice;
	}

	@Override
	public HashMap<Integer, CartDTO> editCart(int proId, int quantity, HashMap<Integer, CartDTO> cart) {
		CartDTO cartDTO = new CartDTO();
		if (cart.containsKey(proId)) {
			cartDTO = cart.get(proId);
			cartDTO.setQuantity(quantity);
			cartDTO.setTotalPrice(quantity * cartDTO.getProduct().getPrice());
		}
		cart.put(proId, cartDTO);
		return cart;
	}

	@Override
	public boolean deleteCart(int proId, HashMap<Integer, CartDTO> cart) {
		if (cart.containsKey(proId)) {
			cart.remove(proId);
			return true;
		}
		return false;
	}

}
