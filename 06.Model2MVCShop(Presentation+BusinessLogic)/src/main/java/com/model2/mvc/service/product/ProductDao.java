package com.model2.mvc.service.product;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductDao {

	public void insertProduct(Product product) throws Exception;
	
	public Product findProduct(int prodNo) throws Exception;
	
	public void updateProduct(Product product) throws Exception;
	
	public List<Product> getProductList(Search search) throws Exception;
	
	public int removeProduct(String productName) throws Exception;
	
	public int getTotalCount(Search search) throws Exception ;
}
