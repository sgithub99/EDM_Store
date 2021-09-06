package com.dao;

import java.util.HashMap;
import java.util.List;

import dto.CartDTO;

public interface CartDAO {

	public HashMap<Integer, CartDTO> addToCart(int id, HashMap<Integer, CartDTO> cart);

	public int getQuantity(HashMap<Integer, CartDTO> cart);

	public float getTotalPrice(HashMap<Integer, CartDTO> cart);

	public HashMap<Integer, CartDTO> editCart(int proId, int quantity, HashMap<Integer, CartDTO> cart);

	public boolean deleteCart(int proId, HashMap<Integer, CartDTO> cart);

}
