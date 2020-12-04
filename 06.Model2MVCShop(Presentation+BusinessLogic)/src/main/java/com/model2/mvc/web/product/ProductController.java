package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductDaoImpl;
import com.model2.mvc.service.user.UserService;



@Controller
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	
	
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping("/addProductView.do")
	public String addProductView() throws Exception {

		System.out.println("/addProductView.do");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	@RequestMapping("/addProduct.do")
	public String addProduct( @ModelAttribute("product") Product product , Model model ) throws Exception {

		System.out.println("/addProduct.do");
		//Business Logic
		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		productService.insertProduct(product);
		
		
		
		
		
		return "forward:/product/redProduct.jsp";
	
	}
	
	@RequestMapping("/getProduct.do")
	public String getProduct( @RequestParam("prodNo") int prodNo , Model model ,@RequestParam("menu") String menu) throws Exception {
		
		System.out.println("/getProduct.do");
		//Business Logic
		System.out.println("겟으로 왔니");
		Product product = productService.findProduct(prodNo);
		
		// Model 과 View 연결
		model.addAttribute("product", product);
		if(menu.equals("manage")){
			return "forward:/product/updateProduct.jsp";
		}else {
			return "forward:/product/getProduct.jsp";
		}
		
	}
	
	@RequestMapping("/updateProductView.do")
	public String updateProductView( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{

		System.out.println("/updateProductView.do");
		//Business Logic
		Product product = productService.findProduct(prodNo);
		
		// Model 과 View 연결
		model.addAttribute("product", product);
		
		return "forward:/product/updateProduct.jsp";
	}
	
	@RequestMapping("/updateProduct.do")
	public String updateProduct( @ModelAttribute("product") Product product , Model model , HttpSession session) throws Exception{
		System.out.println();
		System.out.println("/updateProduct.do");
		//Business Logic
		productService.updateProduct(product);
		product = productService.findProduct(product.getProdNo());
		
		model.addAttribute("product", product);
		
		System.out.println("업데이트 찍히냐");
		return "forward:/product/redProduct.jsp";
		/*return "forward:/getProduct.do?prodNo=" + product.getProdNo() +"&menu=manage" ;*/
	}
	

	

	
	@RequestMapping("/listProduct.do")
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request, @RequestParam ("menu") String menu) throws Exception{
		
		System.out.println("/listProduct.do");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		// Business logic 수행
		Map<String, Object> map = productService.getProductList(search);
	
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		System.out.println(menu);
		// Model 과 View 연결
		model.addAttribute("menu", menu);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
}