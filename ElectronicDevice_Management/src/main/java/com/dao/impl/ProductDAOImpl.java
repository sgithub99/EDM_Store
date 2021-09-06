package com.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.ProductDAO;
import com.entities.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Product> getListProduct(Integer firstResult, Integer maxResult) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			List list = session.createQuery("from Product").setFirstResult(firstResult).setMaxResults(maxResult).list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public long getCountProduct() {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("select count(*) from Product").list();
			session.getTransaction().commit();
			return (long) list.get(0);
		} catch (Exception e) {
		}
		return 0;
	}

	@Override
	public Product getProductById(Integer proId) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			Product product = session.get(Product.class, proId);
			session.getTransaction().commit();
			return product;
		} catch (Exception e) {
			session.close();
		}
		return null;
	}

	@Override
	public List<Product> getListProductByCateId(Integer cateId, Integer firstResult, Integer maxResult) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			List list = session.createQuery("from Product where CategoryId =: cateId").setParameter("cateId", cateId)
					.setFirstResult(firstResult).setMaxResults(maxResult).list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public long getCountProduct(Integer cateId) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("select count(*) from Product where CategoryId =: cateId")
					.setParameter("cateId", cateId).list();
			session.getTransaction().commit();
			return (long) list.get(0);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}

	@Override
	public List<Product> getListProductByProducerId(String producerId, Integer firstResult, Integer maxResult) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			List list = session.createQuery("from Product where ProducerId =: producerId")
					.setParameter("producerId", producerId).setFirstResult(firstResult).setMaxResults(maxResult).list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	@Override
	public long getCountProduct(String producerId) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("select count(*) from Product where ProducerId =: producerId")
					.setParameter("producerId", producerId).list();
			session.getTransaction().commit();
			return (long) list.get(0);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}

	@Override
	public List<Product> getListProductByHigherPrice(Integer firstResult, Integer maxResult) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Product order by Price asc").setFirstResult(firstResult)
					.setMaxResults(maxResult).list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public List<Product> getListProductByLowerPrice(Integer firstResult, Integer maxResult) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Product order by Price desc").setFirstResult(firstResult)
					.setMaxResults(maxResult).list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public List<Product> searchProduct(String productName, Integer firstResult, Integer maxResult) {
		Session session = sessionFactory.openSession();
		try {
			if (productName == null || productName.length() == 0) {
				productName = "%";
			} else {
				productName = "%" + productName + "%";
			}
			session.beginTransaction();
			List list = session.createQuery("from Product where ProName like :ProName")
					.setParameter("ProName", productName).list();
			session.getTransaction().commit();
			session.close();
			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			session.close();
		}
		return null;
	}

	@Override
	public List<Product> getListProductByCateIdHigherPrice(Integer cateId, Integer firstResult, Integer maxResult) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			List list = session.createQuery("from Product where CategoryId =: cateId order by Price asc")
					.setParameter("cateId", cateId).setFirstResult(firstResult).setMaxResults(maxResult).list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public List<Product> getListProductByCateIdLowerPrice(Integer cateId, Integer firstResult, Integer maxResult) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			List list = session.createQuery("from Product where CategoryId =: cateId order by Price desc")
					.setParameter("cateId", cateId).setFirstResult(firstResult).setMaxResults(maxResult).list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public boolean deleteProduct(Integer proId) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			int executeUpdate = session.createQuery("delete from Product where ProId =: proId")
					.setParameter("proId", proId).executeUpdate();
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
	public boolean updateProduct(Product product) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			session.update(product);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	@Override
	public boolean insertProduct(Product product) {
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			session.save(product);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
		}
		return false;
	}

	@Override
	public List<Product> getListProductByNewerProduct(Integer firstResult, Integer maxResult) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Product order by ProId desc").setFirstResult(firstResult)
					.setMaxResults(maxResult).list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public List<Product> getListProductByOlderProduct(Integer firstResult, Integer maxResult) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Product order by ProId asc").setFirstResult(firstResult)
					.setMaxResults(maxResult).list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
		}
		return null;
	}

}
