package com.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dao.CategoryDAO;
import com.dao.OrderDAO;
import com.dao.OrderDetailDAO;
import com.dao.ProducerDAO;
import com.dao.ProductDAO;
import com.entities.Category;
import com.entities.Order;
import com.entities.OrderDetail;
import com.entities.Producer;
import com.entities.Product;

@Controller
//@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private ProducerDAO producerDAO;

	@Autowired
	private OrderDAO orderDAO;

	@Autowired
	private OrderDetailDAO orderDetailDAO;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sf, true));
	}

	@RequestMapping("/admin")
	public String adminPage(Model model) {
//        model.addAttribute("mess", "Welcome to admin page");
		return "admin";
	}

	@RequestMapping("/initProductByAdmin")
	public String listProductByAdmin(Model model, Integer pageIndex) {

		if (pageIndex == null) {
			pageIndex = 1;
		}
		int numberItemOfPage = 12;
		int startingItemPerPage = (pageIndex - 1) * numberItemOfPage;

		List<Product> listProduct = productDAO.getListProduct(startingItemPerPage, numberItemOfPage);
		model.addAttribute("listProducts", listProduct);

		model.addAttribute("x", "1");
		long sumOfProduct = productDAO.getCountProduct();
		int sumOfPage = (int) (sumOfProduct / numberItemOfPage + (sumOfProduct % numberItemOfPage == 0 ? 0 : 1));

		List<Integer> listPages = new ArrayList<>();
		for (int i = 1; i <= sumOfPage; i++) {
			listPages.add(i);
		}
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("listPages", listPages);
		return "listProductByAdmin";
	}

	@RequestMapping("/deleteProductByAdmin")
	public String deleteProductByAdmin(Model model, @RequestParam("proId") Integer proId, Integer pageIndex) {
		model.addAttribute("pageIndex", pageIndex);
		boolean deleteProduct = productDAO.deleteProduct(proId);
		model.addAttribute("pageIndex", pageIndex);
		if (deleteProduct) {
			return "redirect:initProductByAdmin";
		} else {
			return "detailProductByAdmin";
		}
	}

	@RequestMapping("detailProductByAdmin")
	public String detailProductByAdmin(Model model, @RequestParam("proId") Integer proId, Integer pageIndex) {
		Product product = productDAO.getProductById(proId);
		model.addAttribute("product", product);
		model.addAttribute("pageIndex", pageIndex);
		return "detailProductByAdmin";
	}

	@RequestMapping("initUpdateProduct")
	public String initUpdateProduct(Model model, @RequestParam("proId") Integer proId, Integer pageIndex) {
		Product productById = productDAO.getProductById(proId);
		List<Category> listCategory = categoryDAO.getListCategory();
		List<Producer> listProducer = producerDAO.getListProducer();
		model.addAttribute("product", productById);
		model.addAttribute("listCategories", listCategory);
		model.addAttribute("listProducers", listProducer);
		model.addAttribute("pageIndex", pageIndex);
		return "updateProductByAdmin";
	}

	@RequestMapping("updateProductByAdmin")
	public String updateProductByAdmin(@ModelAttribute("product") Product product, HttpServletRequest request,
			Integer pageIndex, Model model, MultipartFile imageProduct) {
		String path = request.getServletContext().getRealPath("resources/images");
		File f = new File(path);

		File dest = new File(f.getAbsolutePath() + "/" + imageProduct.getOriginalFilename());

		if (!dest.exists()) {
			try {
				byte[] datImage = imageProduct.getBytes();
				Files.write(dest.toPath(), datImage, StandardOpenOption.CREATE);

				// dung DAO de insert du lieu cua customer vao database
				// ... your code here

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		product.setImgUrl(imageProduct.getOriginalFilename());
		model.addAttribute("pageIndex", pageIndex);
		// mang du lieu di hien thi
		model.addAttribute("product", product);
		boolean updateProduct = productDAO.updateProduct(product);
		if (updateProduct) {
			return "redirect:/initProductByAdmin";
		} else {
			return "redirect:initUpdateProduct";
		}

	}

	@RequestMapping("initInsertProductByAdmin")
	public String initInsertProduct(Model model, Integer pageIndex) {
		Product product = new Product();
		model.addAttribute("product", product);
		List<Category> listCategory = categoryDAO.getListCategory();
		List<Producer> listProducer = producerDAO.getListProducer();
		model.addAttribute("listCategories", listCategory);
		model.addAttribute("listProducers", listProducer);
		model.addAttribute("pageIndex", pageIndex);
		return "insertProductByAdmin";
	}

	@RequestMapping("insertProductByAdmin")
	public String insertProductByAdmin(Model model, @ModelAttribute("product") Product product,
			HttpServletRequest request, MultipartFile imageProduct, Integer pageIndex) {
		String path = request.getServletContext().getRealPath("resources/images");
		File f = new File(path);

		File dest = new File(f.getAbsolutePath() + "/" + imageProduct.getOriginalFilename());

		if (!dest.exists()) {
			try {
				byte[] datImage = imageProduct.getBytes();
				Files.write(dest.toPath(), datImage, StandardOpenOption.CREATE);

				// dung DAO de insert du lieu cua customer vao database
				// ... your code here

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		product.setImgUrl(imageProduct.getOriginalFilename());
		// mang du lieu di hien thi
		model.addAttribute("pageIndex", pageIndex);
		boolean insertProduct = productDAO.insertProduct(product);
		if (insertProduct) {
			model.addAttribute("product", product);
			return "redirect:initProductByAdmin";
		} else {
			return "initInsertProductByAdmin";
		}
	}

	@RequestMapping("sortByLowerPriceByAdmin")
	public String sortByLowerPriceByAdmin(Model model, Integer pageIndex) {
		if (pageIndex == null) {
			pageIndex = 1;
		}
		int numberItemOfPage = 12;
		int startingItemPerPage = (pageIndex - 1) * numberItemOfPage;

		List<Product> listProduct = productDAO.getListProductByLowerPrice(startingItemPerPage, numberItemOfPage);
		model.addAttribute("listProducts", listProduct);

		List<Category> listCategory = categoryDAO.getListCategory();
		model.addAttribute("listCategories", listCategory);
		model.addAttribute("x", "2");

		long sumOfProduct = productDAO.getCountProduct();

		int sumOfPage = (int) (sumOfProduct / numberItemOfPage + (sumOfProduct % numberItemOfPage == 0 ? 0 : 1));

		List<Integer> listPages = new ArrayList<>();
		for (int i = 1; i <= sumOfPage; i++) {
			listPages.add(i);
		}
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("listPages", listPages);
		return "listProductByAdmin";
	}

	@RequestMapping(value = "sortByHigherPriceByAdmin")
	public String sortByHigherPriceByAdmin(Model model, Integer pageIndex) {
		if (pageIndex == null) {
			pageIndex = 1;
		}
		int numberItemOfPage = 12;
		int startingItemPerPage = (pageIndex - 1) * numberItemOfPage;

		List<Product> listProduct = productDAO.getListProductByHigherPrice(startingItemPerPage, numberItemOfPage);
		model.addAttribute("listProducts", listProduct);

		List<Category> listCategory = categoryDAO.getListCategory();
		model.addAttribute("listCategories", listCategory);
		model.addAttribute("x", "3");

		long sumOfProduct = productDAO.getCountProduct();

		int sumOfPage = (int) (sumOfProduct / numberItemOfPage + (sumOfProduct % numberItemOfPage == 0 ? 0 : 1));

		List<Integer> listPages = new ArrayList<>();
		for (int i = 1; i <= sumOfPage; i++) {
			listPages.add(i);
		}
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("listPages", listPages);
		return "listProductByAdmin";
	}

	@RequestMapping(value = "sortByNewerProductByAdmin")
	public String sortByNewerProductByAdmin(Model model, Integer pageIndex) {
		if (pageIndex == null) {
			pageIndex = 1;
		}
		int numberItemOfPage = 12;
		int startingItemPerPage = (pageIndex - 1) * numberItemOfPage;

		List<Product> listProduct = productDAO.getListProductByNewerProduct(startingItemPerPage, numberItemOfPage);
		model.addAttribute("listProducts", listProduct);

		List<Category> listCategory = categoryDAO.getListCategory();
		model.addAttribute("listCategories", listCategory);
		model.addAttribute("x", "4");

		long sumOfProduct = productDAO.getCountProduct();

		int sumOfPage = (int) (sumOfProduct / numberItemOfPage + (sumOfProduct % numberItemOfPage == 0 ? 0 : 1));

		List<Integer> listPages = new ArrayList<>();
		for (int i = 1; i <= sumOfPage; i++) {
			listPages.add(i);
		}
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("listPages", listPages);
		return "listProductByAdmin";
	}

	@RequestMapping(value = "sortByOlderProductByAdmin")
	public String sortByOlderProductByAdmin(Model model, Integer pageIndex) {
		if (pageIndex == null) {
			pageIndex = 1;
		}
		int numberItemOfPage = 12;
		int startingItemPerPage = (pageIndex - 1) * numberItemOfPage;

		List<Product> listProduct = productDAO.getListProductByOlderProduct(startingItemPerPage, numberItemOfPage);
		model.addAttribute("listProducts", listProduct);

		List<Category> listCategory = categoryDAO.getListCategory();
		model.addAttribute("listCategories", listCategory);
		model.addAttribute("x", "5");

		long sumOfProduct = productDAO.getCountProduct();

		int sumOfPage = (int) (sumOfProduct / numberItemOfPage + (sumOfProduct % numberItemOfPage == 0 ? 0 : 1));

		List<Integer> listPages = new ArrayList<>();
		for (int i = 1; i <= sumOfPage; i++) {
			listPages.add(i);
		}
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("listPages", listPages);
		return "listProductByAdmin";
	}

	@RequestMapping(value = "initProducerByAdmin")
	public String initProducerByAdmin(Model model, Integer pageIndex) {

		if (pageIndex == null) {
			pageIndex = 1;
		}
		int numberItemOfPage = 8;
		int startingItemPerPage = (pageIndex - 1) * numberItemOfPage;

		List<Producer> listProducer = producerDAO.getListProducer(startingItemPerPage, numberItemOfPage);
		model.addAttribute("listProducers", listProducer);

		model.addAttribute("x", "1");
		long sumOfProducer = producerDAO.getCountProducer();
		int sumOfPage = (int) (sumOfProducer / numberItemOfPage + (sumOfProducer % numberItemOfPage == 0 ? 0 : 1));

		List<Integer> listPages = new ArrayList<>();
		for (int i = 1; i <= sumOfPage; i++) {
			listPages.add(i);
		}
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("listPages", listPages);
		return "listProducerByAdmin";
	}

	@RequestMapping(value = "initOrderByAdmin")
	public String initOrderByAdmin(Model model, Integer pageIndex) {
		if (pageIndex == null) {
			pageIndex = 1;
		}
		int numberItemOfPage = 8;
		int startingItemPerPage = (pageIndex - 1) * numberItemOfPage;

		List<Order> listOrder = orderDAO.getListOrder(startingItemPerPage, numberItemOfPage);
		model.addAttribute("listOrder", listOrder);

		model.addAttribute("x", "1");
		long sumOfOrder = orderDAO.getCountOrder();
		int sumOfPage = (int) (sumOfOrder / numberItemOfPage + (sumOfOrder % numberItemOfPage == 0 ? 0 : 1));

		List<Integer> listPages = new ArrayList<>();
		for (int i = 1; i <= sumOfPage; i++) {
			listPages.add(i);
		}
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("listPages", listPages);
		return "listOrderByAdmin";
	}

	@RequestMapping(value = "sortByNewerOrderByAdmin")
	public String sortByNewerOrderByAdmin(Model model, Integer pageIndex) {
		// nếu chỉ số chưa có thì gán cho trang đó bằng 1
		if (pageIndex == null) {
			pageIndex = 1;
		}
		int numberItemOfPage = 8;
		int startingItemPerPage = (pageIndex - 1) * numberItemOfPage;

		List<Order> listOrder = orderDAO.getListOrderByNewerDate(startingItemPerPage, numberItemOfPage);
		model.addAttribute("listOrder", listOrder);

		model.addAttribute("x", "2");

		long sumOfOrder = orderDAO.getCountOrder();
		int sumOfPage = (int) (sumOfOrder / numberItemOfPage + (sumOfOrder % numberItemOfPage == 0 ? 0 : 1));

		List<Integer> listPages = new ArrayList<>();
		for (int i = 1; i <= sumOfPage; i++) {
			listPages.add(i);
		}
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("listPages", listPages);
		return "listOrderByAdmin";
	}

	@RequestMapping(value = "sortByOlderOrderByAdmin")
	public String sortByOlderOrderByAdmin(Model model, Integer pageIndex) {
		// nếu chỉ số chưa có thì gán cho trang đó bằng 1
		if (pageIndex == null) {
			pageIndex = 1;
		}
		int numberItemOfPage = 8;
		int startingItemPerPage = (pageIndex - 1) * numberItemOfPage;

		List<Order> listOrder = orderDAO.getListOrderByOlderDate(startingItemPerPage, numberItemOfPage);
		model.addAttribute("listOrder", listOrder);

		model.addAttribute("x", "3");

		long sumOfOrder = orderDAO.getCountOrder();
		int sumOfPage = (int) (sumOfOrder / numberItemOfPage + (sumOfOrder % numberItemOfPage == 0 ? 0 : 1));

		List<Integer> listPages = new ArrayList<>();
		for (int i = 1; i <= sumOfPage; i++) {
			listPages.add(i);
		}
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("listPages", listPages);
		return "listOrderByAdmin";
	}

	@RequestMapping(value = "detailOrderByAdmin")
	public String detailOrderByAdmin(Model model, @RequestParam("orderId") Integer orderId, Integer pageIndex) {
		Order order = orderDAO.getOrderFromOrderId(orderId);
		List<OrderDetail> listOrderDetail = orderDetailDAO.getListOrderDetail(orderId);
		model.addAttribute("order", order);
		model.addAttribute("listOrderDetail", listOrderDetail);
		model.addAttribute("pageIndex", pageIndex);
		return "detailOrderByAdmin";
	}

	@RequestMapping(value = "initUpdateOrderByAdmin")
	public String initUpdateOrderByAdmin(Model model, @RequestParam("orderId") Integer orderId, Integer pageIndex) {
		Order orderFromOrderId = orderDAO.getOrderFromOrderId(orderId);
		model.addAttribute("order", orderFromOrderId);
		model.addAttribute("pageIndex", pageIndex);
		return "updateOrderByAdmin";
	}

	@RequestMapping(value = "updateOrderByAdmin")
	public String updateOrderByAdmin(@ModelAttribute("order") Order order, Model model, Integer pageIndex) {
		model.addAttribute("pageIndex", pageIndex);
		boolean updateOrderByAdmin = orderDAO.updateOrderByAdmin(order);
		if (updateOrderByAdmin) {
			return "redirect:/initOrderByAdmin";
		} else {
			return "redirect:initUpdateOrderByAdmin";
		}

//		if (updateCustomer) {
//			model.addAttribute("success", "Update successfully!");
//			List<Customer> listCustomer = customerDao.getListCustomer();
//			model.addAttribute("listCustomer", listCustomer);
//			return "redirect:/loadCustomer";
////			return "detailCustomer";
//		} else {
//			model.addAttribute("error", "Update fail");
//			return "detailCustomer";
//		}
	}

	@RequestMapping(value = "initInsertProducerByAdmin")
	public String initInsertProducerByAdmin(Model model, Integer pageIndex) {
		Producer producer = new Producer();
		model.addAttribute("producer", producer);
		model.addAttribute("pageIndex", pageIndex);
		return "insertProducerByAdmin";
	}

	@RequestMapping(value = "insertProducerByAdmin")
	public String insertProducerByAdmin(Model model, @ModelAttribute("producer") Producer producer, Integer pageIndex) {
		model.addAttribute("pageIndex", pageIndex);
		boolean insertProducer = producerDAO.insertProducerByAdmin(producer);
		if (insertProducer) {
			model.addAttribute("producer", producer);
			return "redirect:initProducerByAdmin";
		} else {
			return "insertProducerByAdmin";
		}
	}

	@RequestMapping(value = "detailProducerByAdmin")
	public String detailProducerByAdmin(Model model, @RequestParam("producerId") String producerId, Integer pageIndex) {
		Producer producerByProducerId = producerDAO.getProducerByProducerId(producerId);
		model.addAttribute("producer", producerByProducerId);
		model.addAttribute("pageIndex", pageIndex);
		return "detailProducerByAdmin";
	}

	@RequestMapping(value = "initUpdateProducer")
	public String initUpdateProducer(Model model, @RequestParam("producerId") String producerId, Integer pageIndex) {
		Producer producerByProducerId = producerDAO.getProducerByProducerId(producerId);
		model.addAttribute("producer", producerByProducerId);
		model.addAttribute("pageIndex", pageIndex);
		return "updateProducerByAdmin";
	}

	@RequestMapping(value = "updateProducerByAdmin")
	public String updateProducerByAdmin(@ModelAttribute("producer") Producer producer, Integer pageIndex, Model model) {
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("producer", producer);
		boolean updateProducerByAdmin = producerDAO.updateProducerByAdmin(producer);
		if (updateProducerByAdmin) {
			return "redirect:/initProducerByAdmin";
		} else {
			return "redirect:initUpdateProducer";
		}
	}
	
	@RequestMapping(value = "deleteProducerByAdmin")
	public String deleteProducerByAdmin(Model model, @RequestParam("producerId") String producerId, Integer pageIndex) {
		boolean deleteProducerByAdmin = producerDAO.deleteProducerByAdmin(producerId);
		model.addAttribute("pageIndex", pageIndex);
		if (deleteProducerByAdmin) {
			return "redirect:initProducerByAdmin";
		} else {
			return "detailProducerByAdmin";
		}
	}
}
