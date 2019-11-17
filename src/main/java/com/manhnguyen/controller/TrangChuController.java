package com.manhnguyen.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.manhnguyen.entity.DanhMucSanPham;
import com.manhnguyen.entity.SanPham;
import com.manhnguyen.service.DanhMucService;
import com.manhnguyen.service.SanPhamServices;

@Controller
@RequestMapping(value = {"/","home/"})
public class TrangChuController {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	SanPhamServices sanPhamServices;
	
	@Autowired
	DanhMucService danhMucService;
	
	@GetMapping()
	@Transactional
	public String Default(ModelMap map,HttpSession httpSession) {
		if(httpSession.getAttribute("tendangnhap")!=null)
		{
			String email=(String) httpSession.getAttribute("tendangnhap");
			String chucaidau=email.substring(0,1).toUpperCase();	
			map.addAttribute("dangnhap",chucaidau);
		}
		List<SanPham> listSP=sanPhamServices.LayDanhSachSanPhamLimit(0);
		map.addAttribute("listsanpham",listSP);
		List<DanhMucSanPham>danhMucSanPhams=danhMucService.LayDanhMuc();
		map.addAttribute("danhmuc", danhMucSanPhams);
		return "trangchu";
	}


}
