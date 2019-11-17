package com.manhnguyen.controller;

import java.util.List;

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
@RequestMapping("/sanpham/")
public class SanPhamController {

	@Autowired
	DanhMucService danhMucService;
	@Autowired
	SanPhamServices sanPhamServices;
	
	@GetMapping("{id}/{tendanhmuc}")
	public String defeault(ModelMap map,@PathVariable int id,@PathVariable String tendanhmuc) {
		
		List<SanPham>lisSanPhams=sanPhamServices.LayDSSPTheoDanhMuc(id);
		List<DanhMucSanPham>danhMucSanPhams=danhMucService.LayDanhMuc();
		map.addAttribute("danhmuc", danhMucSanPhams);
		map.addAttribute("tendanhmuc", tendanhmuc);
		map.addAttribute("listsanpham",lisSanPhams);
		return "sanpham";
	}

}
