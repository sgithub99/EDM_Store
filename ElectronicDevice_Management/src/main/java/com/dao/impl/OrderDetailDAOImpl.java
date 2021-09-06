package com.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.OrderDetailDAO;
import com.entities.OrderDetail;

@Repository
public class OrderDetailDAOImpl implements OrderDetailDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<OrderDetail> getListOrderDetail(int orderId) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			List list = session.createQuery("from OrderDetail where orderId.orderId = :orderId")
					.setParameter("orderId", orderId).list();
			session.getTransaction().commit();
			session.close();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

}
