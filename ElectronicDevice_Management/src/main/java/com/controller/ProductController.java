package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.CategoryDAO;
import com.dao.ProductDAO;
import com.entities.Category;
import com.entities.Product;

@Controller
public class ProductController {
	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	/**
	 * Phương thức hiển thị toàn bộ danh sách sản phẩm ở trang chủ
	 * 
	 * @param model     dùng để mang dữ liệu của đối tượng đi
	 * @param pageIndex chỉ số trang
	 * @return trang home.jsp có phân trang
	 */
	@RequestMapping(value = { "/", "loadProducts" })
	public String home(Model model, Integer pageIndex) {
		// nếu chỉ số chưa có thì gán cho trang đó bằng 1
		if (pageIndex == null) {
			pageIndex = 1;
		}
		// Chỉ định mỗi sản phẩm trong 1 trang là 8
		int numberItemOfPage = 12;
		// Đánh dấu chỉ số sản phẩm đầu tiên ở mỗi trang
		int startingItemPerPage = (pageIndex - 1) * numberItemOfPage;

		// Lấy ra danh sách sản phẩm dựa vào chỉ số bắt đầu của sản phẩm mỗi trang và số
		// sản phẩm mỗi trang
		List<Product> listProduct = productDAO.getListProduct(startingItemPerPage, numberItemOfPage);
		model.addAttribute("listProducts", listProduct);
		model.addAttribute("x", "1");

		// Lấy ra danh sách danh mục để mang dữ liệu vào nút dropdown
		List<Category> listCategory = categoryDAO.getListCategory();
		model.addAttribute("listCategories", listCategory);

		// Tính tổng số sản phẩm
		long sumOfProduct = productDAO.getCountProduct();
		// Tính tổng số trang
		int sumOfPage = (int) (sumOfProduct / numberItemOfPage + (sumOfProduct % numberItemOfPage == 0 ? 0 : 1));

		List<Integer> listPages = new ArrayList<>();
		for (int i = 1; i <= sumOfPage; i++) {
			listPages.add(i);
		}
		model.addAttribute("listPages", listPages);
		return "index";
	}

	/**
	 * Phương thức giúp hiển thị chi tiết 1 sản phẩm
	 * 
	 * @param proId mã sản phẩm
	 * @param model mang dữ liệu đi
	 * @return hiển thị trang chi tiết sản phẩm
	 */
	@RequestMapping(value = "detailProduct")
	public String detailProduct(@RequestParam("proId") Integer proId, Model model) {
		// Lấy ra danh sách danh mục để mang dữ liệu vào nút dropdown
		List<Category> listCategory = categoryDAO.getListCategory();
		model.addAttribute("listCategories", listCategory);

		Product product = productDAO.getProductById(proId);
		model.addAttribute("product", product);
		return "detailProduct1";
	}

	/**
	 * Phương thức hiển thị danh sách sản phẩm phân loại theo danh mục
	 * 
	 * @param cateId    là mã danh mục
	 * @param model     dùng để mang dữ liệu đi
	 * @param pageIndex chỉ số trang
	 * @return danh sách sản phẩm được phân loại theo danh mục có phân trang
	 */
	@RequestMapping(value = "listProductByCateId")
	public String getListProductByCateId(@RequestParam("cateId") Integer cateId, Model model, Integer pageIndex) {
		// nếu chỉ số chưa có thì gán cho trang đó bằng 1
		if (pageIndex == null) {
			pageIndex = 1;
		}
		// Chỉ định số sản phẩm mỗi trang là 4
		int numberItemOfPage = 6;
		// Chỉ số bắt đầu của sản phẩm đầu tiên mỗi page
		int startingItemPerPage = (pageIndex - 1) * numberItemOfPage;

		// Danh sách các sản phẩm phân theo danh mục
		List<Product> list = productDAO.getListProductByCateId(cateId, startingItemPerPage, numberItemOfPage);
		model.addAttribute("listProductByCateId", list);

		// Tính tổng số sản phẩm phân theo danh mục
		long countProduct = productDAO.getCountProduct(cateId);
		// Tính tổng số trang
		int sumOfPage = (int) (countProduct / numberItemOfPage + (countProduct % numberItemOfPage == 0 ? 0 : 1));

		// Khởi thao danh sách kiểu integer
		List<Integer> listPages = new ArrayList<>();
		for (int i = 1; i <= sumOfPage; i++) {
			listPages.add(i);
		}
		model.addAttribute("listPages", listPages);

		// Lấy ra danh mục theo mã danh mục
		Category category = categoryDAO.getCategoryByCateId(cateId);
		model.addAttribute("category", category);

		// Lấy ra danh sách danh mục
		List<Category> listCategory = categoryDAO.getListCategory();
		model.addAttribute("listCategories", listCategory);
		model.addAttribute("cateId", cateId);
		return "listProductByCateId1";
	}

	/**
	 * Phương thức hiển thị danh sách sản phẩm phân loại theo mã nhà sản xuất
	 * 
	 * @param producerId là mã nhà sản xuất
	 * @param model      dùng để mang dữ liệu đi
	 * @param pageIndex  chỉ số trangs
	 * @return danh sách sản phẩm được phân loại theo danh mục có phân trang
	 */
	@RequestMapping(value = "listProductByProducerId")
	public String listProductByProducerId(@RequestParam("producerId") String producerId, Model model, Integer pageIndex,
			Integer proId) {
		// nếu chỉ số chưa có thì gán cho trang đó bằng 1
		if (pageIndex == null) {
			pageIndex = 1;
		}
		// Chỉ định số sản phẩm mỗi trang là 4
		int numberItemOfPage = 6;
		// Chỉ số bắt đầu của sản phẩm đầu tiên mỗi page
		int startingItemPerPage = (pageIndex - 1) * numberItemOfPage;

		// Danh sách các sản phẩm phân theo nhà sản xuất
		List<Product> list = productDAO.getListProductByProducerId(producerId, startingItemPerPage, numberItemOfPage);
		model.addAttribute("listProductByProducerId", list);

		Product productById = productDAO.getProductById(proId);
		model.addAttribute("product", productById);

		// Tính tổng số sản phẩm phân theo nhà sản xuất
		long countProduct = productDAO.getCountProduct(producerId);
		// Tính tổng số trang
		int sumOfPage = (int) (countProduct / numberItemOfPage + (countProduct % numberItemOfPage == 0 ? 0 : 1));

		// Khởi thao danh sách kiểu integer
		List<Integer> listPages = new ArrayList<>();
		for (int i = 1; i <= sumOfPage; i++) {
			listPages.add(i);
		}
		model.addAttribute("listPages", listPages);

		// Lấy ra danh sách danh mục
		List<Category> listCategory = categoryDAO.getListCategory();
		model.addAttribute("listCategories", listCategory);

		return "listProductByProducerId";
	}

	@RequestMapping(value = "sortByLowerPrice")
	public String sortByLowerPrice(Model model, Integer pageIndex) {
		// nếu chỉ số chưa có thì gán cho trang đó bằng 1
		if (pageIndex == null) {
			pageIndex = 1;
		}
		// Chỉ định mỗi sản phẩm trong 1 trang là 12
		int numberItemOfPage = 12;
		// Đánh dấu chỉ số sản phẩm đầu tiên ở mỗi trang
		int startingItemPerPage = (pageIndex - 1) * numberItemOfPage;

		// Lấy ra danh sách sản phẩm dựa vào chỉ số bắt đầu của sản phẩm mỗi trang và số
		// sản phẩm mỗi trang
		List<Product> listProduct = productDAO.getListProductByLowerPrice(startingItemPerPage, numberItemOfPage);
		model.addAttribute("listProducts", listProduct);

		// Lấy ra danh sách danh mục để mang dữ liệu vào nút dropdown
		List<Category> listCategory = categoryDAO.getListCategory();
		model.addAttribute("listCategories", listCategory);
		model.addAttribute("x", "2");

		// Tính tổng số sản phẩm
		long sumOfProduct = productDAO.getCountProduct();
		// Tính tổng số trang
		int sumOfPage = (int) (sumOfProduct / numberItemOfPage + (sumOfProduct % numberItemOfPage == 0 ? 0 : 1));

		List<Integer> listPages = new ArrayList<>();
		for (int i = 1; i <= sumOfPage; i++) {
			listPages.add(i);
		}
		model.addAttribute("listPages", listPages);
		return "index";
	}

	@RequestMapping(value = "sortByHigherPrice")
	public String sortByHigherPrice(Model model, Integer pageIndex) {
		// nếu chỉ số chưa có thì gán cho trang đó bằng 1
		if (pageIndex == null) {
			pageIndex = 1;
		}
		// Chỉ định mỗi sản phẩm trong 1 trang là 12
		int numberItemOfPage = 12;
		// Đánh dấu chỉ số sản phẩm đầu tiên ở mỗi trang
		int startingItemPerPage = (pageIndex - 1) * numberItemOfPage;

		// Lấy ra danh sách sản phẩm dựa vào chỉ số bắt đầu của sản phẩm mỗi trang và số
		// sản phẩm mỗi trang
		List<Product> listProduct = productDAO.getListProductByHigherPrice(startingItemPerPage, numberItemOfPage);
		model.addAttribute("listProducts", listProduct);

		// Lấy ra danh sách danh mục để mang dữ liệu vào nút dropdown
		List<Category> listCategory = categoryDAO.getListCategory();
		model.addAttribute("listCategories", listCategory);
		model.addAttribute("x", "3");

		// Tính tổng số sản phẩm
		long sumOfProduct = productDAO.getCountProduct();
		// Tính tổng số trang
		int sumOfPage = (int) (sumOfProduct / numberItemOfPage + (sumOfProduct % numberItemOfPage == 0 ? 0 : 1));

		List<Integer> listPages = new ArrayList<>();
		for (int i = 1; i <= sumOfPage; i++) {
			listPages.add(i);
		}
		model.addAttribute("listPages", listPages);
		return "index";
	}

	@RequestMapping(value = "searchProductByName")
	public String searchProductByName(Model model, Integer pageIndex, String proName) {
		// nếu chỉ số chưa có thì gán cho trang đó bằng 1
		if (pageIndex == null) {
			pageIndex = 1;
		}
		// Chỉ định mỗi sản phẩm trong 1 trang là 6
		int numberItemOfPage = 6;
		// Đánh dấu chỉ số sản phẩm đầu tiên ở mỗi trang
		int startingItemPerPage = (pageIndex - 1) * numberItemOfPage;

		// Lấy ra danh sách sản phẩm dựa vào chỉ số bắt đầu của sản phẩm mỗi trang và số
		// sản phẩm mỗi trang
		List<Product> listProduct = productDAO.searchProduct(proName, startingItemPerPage, numberItemOfPage);
		model.addAttribute("listProducts", listProduct);

		// Lấy ra danh sách danh mục để mang dữ liệu vào nút dropdown
		List<Category> listCategory = categoryDAO.getListCategory();
		model.addAttribute("listCategories", listCategory);

		// Tính tổng số sản phẩm
		long sumOfProduct = productDAO.getCountProduct();
		// Tính tổng số trang
		int sumOfPage = (int) (sumOfProduct / numberItemOfPage + (sumOfProduct % numberItemOfPage == 0 ? 0 : 1));

		List<Integer> listPages = new ArrayList<>();
		for (int i = 1; i <= sumOfPage; i++) {
			listPages.add(i);
		}
		model.addAttribute("listPages", listPages);
		return "listProductBySearching";
	}
}
