package com.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.CustomerDAO;
import com.dao.OrderDAO;
import com.entities.Order;
import com.entities.OrderDetail;

import dto.CartDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private CustomerDAO customerDAO;

	@Override
	public boolean insertOrder(Order order) {
		Session session = sessionFactory.openSession();

//		Order order1 = new Order();
//		session.createQuery("select getdate()");
//		Query q = session.createQuery("from Invoices inv where inv.dueDate <= :dueDate");
//		q.setDate("dueDate", new java.util.Date());
//		order1.setDateOfPayment();

		try {
			session.beginTransaction();
			session.save(order);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			session.close();
		}

		return false;
	}

	@Override
	public boolean insertOrderDetail(OrderDetail orderDetail) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			session.save(orderDetail);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			session.close();
		}

		return false;

	}

	@Override
	public int getIdLastOrder() {
		Session session = sessionFactory.openSession();
		try {// ok, cái kia được rồi chỉ còn chỗ này thôi. em seelct bảng order detail xem có
				// id chưa
			session.beginTransaction();
			List list = session.createQuery("select max(OrderId) from Order").list();// bỏ hàm này đi cx đc thầy ạ, em
																						// lấy id gần nhất của bảng
																						// order
			session.getTransaction().commit();
			session.close();
			return (int) list.get(0);
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			session.close();
		}
		return 0;
	}

	@Override
	public Order getOrderFromOrderId(int orderId) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			Order order = session.get(Order.class, orderId);
			session.getTransaction().commit();
			session.close();
			return order;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			session.getTransaction().rollback();
			session.close();
		}
		return null;
	}

	@Override
	public void addOrderDetail(HashMap<Integer, CartDTO> listCarts, Order order, float totalMoney) {
		int idLastOrder = getIdLastOrder();
		// Order orderFromOrderId = getOrderFromOrderId(idLastOrder);

		for (Map.Entry<Integer, CartDTO> cart : listCarts.entrySet()) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrderId(order);
			orderDetail.setProId(cart.getValue().getProduct());
			orderDetail.setQuantity(cart.getValue().getQuantity());
			orderDetail.setPrice(cart.getValue().getProduct().getPrice());
			orderDetail.setMoney(cart.getValue().getTotalPrice());
			orderDetail.setTotalMoney(totalMoney);
			insertOrderDetail(orderDetail);
		}
	}

	@Override
	public List<Order> getListOrderByCusId(int cusId) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Order where cusId.cusId = :cusId").setParameter("cusId", cusId)
					.list();
			session.getTransaction().commit();
			session.close();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			session.close();
		}
		return null;
	}

	@Override
	public List<Order> getListOrder(Integer firstResult, Integer maxResult) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			List list = session.createQuery("from Order").setFirstResult(firstResult).setMaxResults(maxResult).list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public long getCountOrder() {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("select count(*) from Order").list();
			session.getTransaction().commit();
			return (long) list.get(0);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}

	@Override
	public List<Order> getListOrderByNewerDate(Integer firstResult, Integer maxResult) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Order order by dateOfPayment desc").setFirstResult(firstResult)
					.setMaxResults(maxResult).list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public List<Order> getListOrderByOlderDate(Integer firstResult, Integer maxResult) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Order order by dateOfPayment asc").setFirstResult(firstResult)
					.setMaxResults(maxResult).list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public boolean cancelOrderByOrderId(int orderId) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			int executeUpdate = session.createQuery("delete from Order where orderId =: orderId")
					.setParameter("orderId", orderId).executeUpdate();
			session.getTransaction().commit();
			session.close();
			if (executeUpdate > 0) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	@Override
	public boolean updateOrderByAdmin(Order order) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(order);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
}
