package com.dao;

import java.util.List;

import com.entities.Producer;

public interface ProducerDAO {
	public List<Producer> getListProducer();

	public List<Producer> getListProducer(Integer firstResult, Integer maxResult);

	public List<Producer> getListProducerBySortingNameASC(Integer firstResult, Integer maxResult);

	public List<Producer> getListProducerBySortingNameDESC(Integer firstResult, Integer maxResult);

	public long getCountProducer();

	public boolean insertProducerByAdmin(Producer producer);

	public boolean updateProducerByAdmin(Producer producer);

	public boolean deleteProducerByAdmin(String producerId);

	public Producer getProducerByProducerId(String producerId);

}
