package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.CategoryDAO;
import com.dao.OrderDAO;
import com.dao.OrderDetailDAO;
import com.entities.Category;
import com.entities.Customer;
import com.entities.Order;
import com.entities.OrderDetail;

@Controller
public class OrderController {

	@Autowired
	private OrderDAO orderDAO;

	@Autowired
	private OrderDetailDAO orderDetailDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	@RequestMapping(value = "checkout", method = RequestMethod.GET)
	public String initOrder(Model model, HttpSession session) {
		Order order = new Order();
		List<Category> listCategory = categoryDAO.getListCategory();
		model.addAttribute("listCategories", listCategory);
		Customer customer = (Customer) session.getAttribute("customerInfo");
		if (customer != null) {
			order.setAddress(customer.getAddress());
			order.setCusName(customer.getCusName());
			order.setEmail(customer.getEmail());
			order.setPhone(customer.getPhone());
		}
//		session.setAttribute("customer", customer); sao bên kia cũng có checkout nhỉ? 2 cái ở 2 projec tà?
		model.addAttribute("order", order);
		return "checkOutOrder";
	}

	@RequestMapping(value = "initBill")
	public String getBill(Model model, HttpSession session, @RequestParam("cusId") Integer cusId) {
//		if (pageIndex == null) {
//			pageIndex = 1;
//		}
//		int numberItemOfPage = 5;
//		int startingItemPerPage = (pageIndex - 1) * numberItemOfPage;

		List<Order> listOrder = orderDAO.getListOrderByCusId(cusId);
		/*
		 * if(listOrder.size() == 0) { model.addAttribute("emptyOrder",
		 * "Đơn hàng của bạn trống"); }
		 */
		session.setAttribute("listOrder", listOrder);

//		long sumOfOrder = orderDAO.getCountOrder();
//		int sumOfPage = (int) (sumOfOrder / numberItemOfPage + (sumOfOrder % numberItemOfPage == 0 ? 0 : 1));
//
//		List<Integer> listPages = new ArrayList<>();
//		for (int i = 1; i <= sumOfPage; i++) {
//			listPages.add(i);
//		}
//		model.addAttribute("pageIndex", pageIndex);
//		model.addAttribute("listPages", listPages);
//		List<OrderDetail> listOrderDetail = orderDetailDAO.getListOrderDetail();

//		model.addAttribute("listOrder", listOrder);
		return "bill";
	}

	@RequestMapping(value = "detailBill")
	public String getDetailBill(Model model, HttpSession session, @RequestParam("orderId") Integer orderId) {
		List<OrderDetail> listOrderDetail = orderDetailDAO.getListOrderDetail(orderId);
		model.addAttribute("listOrderDetail", listOrderDetail);
		return "billDetail";
	}

	@RequestMapping(value = "cancelBill")
	public String cancelBill(Model model, @RequestParam("orderId") Integer orderId, Integer pageIndex,
			@RequestParam("cusId") Integer cusId) {
		model.addAttribute("pageIndex", pageIndex);
		boolean cancelOrderByOrderId = orderDAO.cancelOrderByOrderId(orderId);
		model.addAttribute("pageIndex", pageIndex);
		if (cancelOrderByOrderId) {
			model.addAttribute("success", "Huỷ đơn hàng thành công");
			List<Order> listOrder = orderDAO.getListOrderByCusId(cusId);
			model.addAttribute("listOrder", listOrder);
			return "bill";
		} else {
			return "detailBill";
		}
	}
}
