package com.manhnguyen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.manhnguyen.entity.SanPham;
import com.manhnguyen.service.SanPhamServices;

@Controller
@RequestMapping("/themsanpham")
public class ThemSanPhamController {
	@Autowired
	SanPhamServices sanPhamServices;
	@GetMapping
	public String deFault(ModelMap map) {
		List<SanPham> list=sanPhamServices.LayDanhSachSanPhamLimit(0);
		List<SanPham>allsp=sanPhamServices.LayDanhSachSanPhamLimit(-1);
		double tongsopage=Math.ceil((double)allsp.size()/5);
		map.addAttribute("listsp",list);
		map.addAttribute("allsp", allsp);
		map.addAttribute("tongsopage",tongsopage);
		return "themsanpham";
	}

}
