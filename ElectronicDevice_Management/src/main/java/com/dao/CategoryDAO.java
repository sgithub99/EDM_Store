package com.dao;

import java.util.List;

import com.entities.Category;

public interface CategoryDAO {
	
	public List<Category> getListCategory();
	
	public Category getCategoryByCateId(Integer cateId);

}
