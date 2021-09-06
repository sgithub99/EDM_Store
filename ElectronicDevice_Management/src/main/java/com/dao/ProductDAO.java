package com.dao;

import java.util.List;

import com.entities.Product;

public interface ProductDAO {

	public List<Product> getListProduct(Integer firstResult, Integer maxResult);

	public long getCountProduct();

	public Product getProductById(Integer proId);

	public List<Product> getListProductByCateId(Integer cateId, Integer firstResult, Integer maxResult);

	public List<Product> getListProductByCateIdHigherPrice(Integer cateId, Integer firstResult, Integer maxResult);

	public List<Product> getListProductByCateIdLowerPrice(Integer cateId, Integer firstResult, Integer maxResult);

	public long getCountProduct(Integer cateId);

	public List<Product> getListProductByProducerId(String producerId, Integer firstResult, Integer maxResult);

	public long getCountProduct(String producerId);

	public List<Product> getListProductByHigherPrice(Integer firstResult, Integer maxResult);

	public List<Product> getListProductByLowerPrice(Integer firstResult, Integer maxResult);

	public List<Product> searchProduct(String productName, Integer firstResult, Integer maxResult);

	public boolean deleteProduct(Integer proId);

	public boolean updateProduct(Product product);

	public boolean insertProduct(Product product);

	public List<Product> getListProductByNewerProduct(Integer firstResult, Integer maxResult);

	public List<Product> getListProductByOlderProduct(Integer firstResult, Integer maxResult);


}
