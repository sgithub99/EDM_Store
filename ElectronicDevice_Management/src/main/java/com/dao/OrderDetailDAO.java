package com.dao;

import java.util.List;

import com.entities.OrderDetail;

public interface OrderDetailDAO {

	public List<OrderDetail> getListOrderDetail(int orderId);
}
