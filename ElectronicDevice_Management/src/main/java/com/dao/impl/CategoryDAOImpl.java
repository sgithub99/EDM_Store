package com.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.CategoryDAO;
import com.entities.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Category> getListCategory() {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Category").list();
			session.getTransaction().commit();
			session.close();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	@Override
	public Category getCategoryByCateId(Integer cateId) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			Category category = session.get(Category.class, cateId);
			session.getTransaction().commit();
			return category;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	

}
