package service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.OrderDAO;
import com.entities.Order;
import com.entities.OrderDetail;

import dto.CartDTO;

@Service
public class OrderService implements IOrderService{
	
	@Autowired 
	private OrderDAO orderDAO;

	@Override
	public boolean addOrder(Order order) {
		return orderDAO.insertOrder(order);
	}

	@Override
	public void addOrderDetail(OrderDetail orderDetail) {
//		int idLastOrder = orderDAO.getIdLastOrder();
//
//		for (Map.Entry<Integer, CartDTO> cart : listCarts.entrySet()) {
//			OrderDetail orderDetail = new OrderDetail();
//			orderDetail.setOrderDetailId(idLastOrder);
//			orderDetail.setProId(cart.getValue().getProduct());
//			orderDetail.setQuantity(cart.getValue().getQuantity());
//			orderDetail.setPrice(cart.getValue().getTotalPrice());
//			insertOrderDetail(orderDetail);
//		}
	}
	
	

}
