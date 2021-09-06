package com.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.ProducerDAO;
import com.entities.Producer;
import com.entities.Product;

@Repository
public class ProducerDAOImpl implements ProducerDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Producer> getListProducer(Integer firstResult, Integer maxResult) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			List list = session.createQuery("from Producer").setFirstResult(firstResult).setMaxResults(maxResult)
					.list();
			session.getTransaction().commit();
			session.close();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	@Override
	public List<Producer> getListProducerBySortingNameASC(Integer firstResult, Integer maxResult) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Producer order by ProducerName asc").setFirstResult(firstResult)
					.setMaxResults(maxResult).list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public List<Producer> getListProducerBySortingNameDESC(Integer firstResult, Integer maxResult) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Producer order by ProducerName desc").setFirstResult(firstResult)
					.setMaxResults(maxResult).list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public long getCountProducer() {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("select count(*) from Producer").list();
			session.getTransaction().commit();
			return (long) list.get(0);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}

	@Override
	public List<Producer> getListProducer() {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			List list = session.createQuery("from Producer").list();
			session.getTransaction().commit();
			session.close();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	@Override
	public boolean insertProducerByAdmin(Producer producer) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			session.save(producer);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	@Override
	public boolean updateProducerByAdmin(Producer producer) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			session.update(producer);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	@Override
	public boolean deleteProducerByAdmin(String producerId) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			int executeUpdate = session.createQuery("delete from Producer where producerId =: producerId")
					.setParameter("producerId", producerId).executeUpdate();
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
	public Producer getProducerByProducerId(String producerId) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			Producer producer = session.get(Producer.class, producerId);
			session.getTransaction().commit();
			return producer;
		} catch (Exception e) {
			session.close();
		}
		return null;
	}

}
