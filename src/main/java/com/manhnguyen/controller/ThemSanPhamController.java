package com.manhnguyen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.manhnguyen.entity.DanhMucSanPham;
import com.manhnguyen.entity.MauSanPham;
import com.manhnguyen.entity.SanPham;
import com.manhnguyen.entity.SizeSanPham;
import com.manhnguyen.service.DanhMucService;
import com.manhnguyen.service.MauSanPhamService;
import com.manhnguyen.service.SanPhamServices;
import com.manhnguyen.service.SizeSanPhamService;

@Controller
@RequestMapping("/themsanpham")
public class ThemSanPhamController {
	@Autowired
	SanPhamServices sanPhamServices;
	@Autowired
	DanhMucService danhMucService;
	@Autowired
	MauSanPhamService mauSanPhamService;
	@Autowired
	SizeSanPhamService sizeSanPhamService;
	@GetMapping
	public String deFault(ModelMap map) {
		List<SanPham> list=sanPhamServices.LayDanhSachSanPhamLimit(0);
		List<SanPham>allsp=sanPhamServices.LayDanhSachSanPhamLimit(-1);
		List<SizeSanPham> listsizesp=sizeSanPhamService.laydssize();
		List<MauSanPham>listmau=mauSanPhamService.laydsmau();
		double tongsopage=Math.ceil((double)allsp.size()/5);
		map.addAttribute("listsp",list);
		map.addAttribute("allsp", allsp);
		map.addAttribute("listsize",listsizesp);
		map.addAttribute("listmau",listmau);
		map.addAttribute("tongsopage",tongsopage);
		List<DanhMucSanPham>danhMucSanPhams=danhMucService.LayDanhMuc();
		map.addAttribute("danhmuc", danhMucSanPhams);
		return "themsanpham";
	}

}
