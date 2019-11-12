package com.manhnguyen.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.manhnguyen.entity.DanhMucSanPham;
import com.manhnguyen.entity.SanPham;
import com.manhnguyen.service.DanhMucService;
import com.manhnguyen.service.SanPhamServices;

@Controller
@RequestMapping("/chitiet")
public class ChiTietController {
	@Autowired
	SanPhamServices sanPhamServices;
	@Autowired
	DanhMucService danhMucService;
	@GetMapping("/{masanpham}")
	public String Default(ModelMap map,HttpSession httpSession,@PathVariable int masanpham) {
		if(httpSession.getAttribute("tendangnhap")!=null)
		{
			String email=(String) httpSession.getAttribute("tendangnhap");
			String chucaidau=email.substring(0,1).toUpperCase();	
			map.addAttribute("dangnhap",chucaidau);
		}
		SanPham listsp=sanPhamServices.LayDanhSachChiTietSanPham(masanpham);
		map.addAttribute("chitietsp",listsp);
		List<DanhMucSanPham>danhMucSanPhams=danhMucService.LayDanhMuc();
		map.addAttribute("danhmuc", danhMucSanPhams);
		return"chitiet";
	}

}
