package com.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.CartDAO;
import com.dao.CategoryDAO;
import com.dao.CustomerDAO;
import com.dao.OrderDAO;
import com.entities.Category;
import com.entities.Customer;
import com.entities.Order;

import dto.CartDTO;

@Controller
public class CartController {
	@Autowired
	private CartDAO cartDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private OrderDAO orderDAO;

	@Autowired
	private CustomerDAO customerDAO;

	@RequestMapping(value = "addToCart")
	private String addToCart(HttpServletRequest request, HttpSession session, @RequestParam("proId") Integer proId) {
		HashMap<Integer, CartDTO> cart = (HashMap<Integer, CartDTO>) session.getAttribute("Cart");
		if (cart == null) {
			cart = new HashMap<>();
		}
		cart = cartDAO.addToCart(proId, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("TotalQuantity", cartDAO.getQuantity(cart));
		session.setAttribute("TotalPrice", cartDAO.getTotalPrice(cart));
		return "redirect:" + request.getHeader("Referer");
	}

	@RequestMapping(value = "editCart")
	private String editCart(HttpServletRequest request, HttpSession session, @RequestParam("proId") Integer proId,
			@RequestParam("quantity") int quantity) {
		HashMap<Integer, CartDTO> cart = (HashMap<Integer, CartDTO>) session.getAttribute("Cart");
		if (cart == null) {
			cart = new HashMap<>();
		}
		cart = cartDAO.editCart(proId, quantity, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("TotalQuantity", cartDAO.getQuantity(cart));
		session.setAttribute("TotalPrice", cartDAO.getTotalPrice(cart));
		return "redirect:" + request.getHeader("Referer");
	}

	@RequestMapping(value = "listCart")
	private String listCart(HttpServletRequest request, HttpSession session, Model model) {
		List<Category> listCategory = categoryDAO.getListCategory();
		model.addAttribute("listCategories", listCategory);
		HashMap<Integer, CartDTO> listCartDTOs = (HashMap<Integer, CartDTO>) session.getAttribute("Cart");
		if (listCartDTOs == null) {
			session.setAttribute("errorCart", "Giỏ hàng hiện đang trống");
		} else {
			session.setAttribute("Cart", listCartDTOs);
			session.setAttribute("TotalQuantity", cartDAO.getQuantity(listCartDTOs));
			session.setAttribute("TotalPrice", cartDAO.getTotalPrice(listCartDTOs));
		}
		return "cart";
	}

	@RequestMapping(value = "deleteCart")
	private String deleteCart(HttpSession session, HttpServletRequest request, Model model,
			@RequestParam("proId") int proId) {
		List<Category> listCategory = categoryDAO.getListCategory();
		model.addAttribute("listCategories", listCategory);

		HashMap<Integer, CartDTO> listCartDTOs = (HashMap<Integer, CartDTO>) session.getAttribute("Cart");
		boolean deleteCart = cartDAO.deleteCart(proId, listCartDTOs);
		if (deleteCart) {
			session.setAttribute("Cart", listCartDTOs);
			session.setAttribute("TotalQuantity", cartDAO.getQuantity(listCartDTOs));
			session.setAttribute("TotalPrice", cartDAO.getTotalPrice(listCartDTOs));
		}
		return "cart";
	}

	@RequestMapping(value = "checkout", method = RequestMethod.POST)
	public String checkOut(Model model, @ModelAttribute("order") Order order, HttpSession session) {
		float totalMoney = (float) session.getAttribute("TotalPrice");
		Customer customerById = (Customer) session.getAttribute("customerInfo");
		// Customer customerById = customerDAO.getCustomerById(cu);
		order.setDateOfPayment(new Date());
		order.setCusId(customerById);
		boolean insertOrder = orderDAO.insertOrder(order);
		if (insertOrder) {
			HashMap<Integer, CartDTO> listCarts = (HashMap<Integer, CartDTO>) session.getAttribute("Cart");
			orderDAO.addOrderDetail(listCarts, order, totalMoney);
		}
		session.removeAttribute("Cart");
		session.removeAttribute("TotalQuantity");
		session.removeAttribute("TotalPrice");
		return "redirect:listCart";
	}
}
