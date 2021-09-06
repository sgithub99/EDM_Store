package com.dao;

import java.util.HashMap;
import java.util.List;

import com.entities.Order;
import com.entities.OrderDetail;

import dto.CartDTO;

public interface OrderDAO {

	public boolean insertOrder(Order order);

	public boolean insertOrderDetail(OrderDetail orderDetail);

	public int getIdLastOrder();

	public void addOrderDetail(HashMap<Integer, CartDTO> listCartss, Order order, float totalMoney);

	public Order getOrderFromOrderId(int orderId);

	public List<Order> getListOrderByCusId(int cusId);

	public List<Order> getListOrder(Integer firstResult, Integer maxResult);

	public long getCountOrder();

	public List<Order> getListOrderByNewerDate(Integer firstResult, Integer maxResult);

	public List<Order> getListOrderByOlderDate(Integer firstResult, Integer maxResult);

	public boolean cancelOrderByOrderId(int orderId);

	public boolean updateOrderByAdmin(Order order);
}
