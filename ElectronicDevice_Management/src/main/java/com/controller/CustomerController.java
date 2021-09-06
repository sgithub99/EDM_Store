package com.controller;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.CategoryDAO;
import com.dao.CustomerDAO;
import com.entities.Category;
import com.entities.Customer;

@Controller
public class CustomerController {

	@Autowired
	private CustomerDAO customerDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	@InitBinder
	public void dataBinder(WebDataBinder data) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		data.registerCustomEditor(Date.class, new CustomDateEditor(sf, true));
	}

	@RequestMapping("initLogin")
	public String initLogin(Model model) {
		Customer customer = new Customer();
		model.addAttribute("customer", customer);
		List<Category> listCategory = categoryDAO.getListCategory();
		model.addAttribute("listCategories", listCategory);
		return "login";
	}

	@RequestMapping("login")
	public String login(Model model, @ModelAttribute("customer") Customer customer, HttpSession session,
			HttpServletRequest request) {
		// List<Customer> listCustomer = customerDAO.getListCustomer();
		Customer customerByEmail = customerDAO.getCustomerByEmail(customer.getEmail());
		// boolean checkAccount = customerDAO.checkAccount(customer, listCustomer);
		if (customerByEmail != null && BCrypt.checkpw(customer.getPassword(), customerByEmail.getPassword())) {
//			session.setAttribute("hoVaten", customerByEmail.getCusName());
//			session.setAttribute("diaChi", customerByEmail.getAddress());
//			session.setAttribute("soDienThoai", customerByEmail.getPhone());
//			session.setAttribute("email", customerByEmail.getEmail());
			session.setAttribute("customerInfo", customerByEmail);
			return "redirect:loadProducts";
		} else {
			model.addAttribute("loginFail", "Email hoặc mật khẩu không khớp!");
			model.addAttribute("customer", customer);
			List<Category> listCategory = categoryDAO.getListCategory();
			model.addAttribute("listCategories", listCategory);
			return "login";
		}
	}

	@RequestMapping("initSignup")
	public String signup(Model model) {
		Customer customer = new Customer();
		model.addAttribute("customer", customer);
		List<Category> listCategory = categoryDAO.getListCategory();
		model.addAttribute("listCategories", listCategory);
		return "signup";
	}

	@RequestMapping("signup")
	public String signUp(@ModelAttribute("customer") Customer customer, Model model, HttpSession session) {
		List<Customer> listCustomer = customerDAO.getListCustomer();

		boolean existEmail = customerDAO.existEmail(customer.getEmail(), listCustomer);
		if (existEmail) {
//			boolean deleteCustomer /*= customerDAO.deleteCustomer(customer);
//			if (deleteCustomer) {*/
			model.addAttribute("existEmail", "Email này đã có người sử dụng");
			model.addAttribute("customer", customer);
			List<Category> listCategory = categoryDAO.getListCategory();
			model.addAttribute("listCategories", listCategory);
			return "signup";
		} else {
			boolean registerCustomer = customerDAO.registerCustomer(customer);
			if (registerCustomer) {
				session.setAttribute("customerInfo", customer);
//				session.setAttribute("customerName", customer.getCusName());
//				session.setAttribute("diaChi", customer.getAddress());
//				session.setAttribute("soDienThoai", customer.getPhone());
//				session.setAttribute("email", customer.getEmail());
				model.addAttribute("successful", "Đăng ký tài khoản thành công");
				return "login";
			} else {
				model.addAttribute("fail", "Đăng ký tài khoản thất bại");
				model.addAttribute("customer", customer);
				List<Category> listCategory = categoryDAO.getListCategory();
				model.addAttribute("listCategories", listCategory);
				return "signup";
			}
		}
	}

	@RequestMapping("signout")
	public String signOut(HttpSession session, HttpServletRequest request) {
		session.removeAttribute("customerInfo");
		return "redirect:" + request.getHeader("Referer");
	}

}
