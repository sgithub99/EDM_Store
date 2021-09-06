package service;

import com.entities.Order;
import com.entities.OrderDetail;

public interface IOrderService {

	public boolean addOrder(Order order);

	public void addOrderDetail(OrderDetail orderDetail);

}
