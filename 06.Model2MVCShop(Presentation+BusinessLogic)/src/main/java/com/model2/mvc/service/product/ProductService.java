package com.model2.mvc.service.product;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;


public interface ProductService {
	
	//상품등록
	public void insertProduct(Product product) throws Exception;

	//상품정보확인 
	public Product findProduct(int prodNo) throws Exception;

	//상품리스트
	public Map<String,Object> getProductList(Search search) throws Exception;

	//상품수정
	public void updateProduct(Product product) throws Exception;
	
	public int removeProduct(String productName) throws Exception;
	

}