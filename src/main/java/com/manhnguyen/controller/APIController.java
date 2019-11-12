package com.manhnguyen.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.manhnguyen.entity.GioHang;
import com.manhnguyen.service.NhanVienService;

@Controller
@RequestMapping("api/")
@SessionAttributes({"tendangnhap","giohang"})
public class APIController {
	@Autowired
	NhanVienService nvNhanVienService;
	
	List<GioHang>gioHangs=new ArrayList<GioHang>();
	@GetMapping("KiemTraDangNhap")
	@ResponseBody
	public String KiemTraDangNhap(@RequestParam String tendangnhap,@RequestParam String matkhau,ModelMap map) {

		boolean kiemtra=nvNhanVienService.KiemTraDangNhap(tendangnhap, matkhau);
		map.addAttribute("tendangnhap",tendangnhap);
		return ""+kiemtra;
	}
	@GetMapping("ThemGioHang")
	public void ThemGioHang(@ModelAttribute GioHang gioHang, HttpSession httpSession) {
		
		gioHangs.add(gioHang);
		httpSession.setAttribute("giohang", gioHangs);
		List<GioHang>list=(List<GioHang>) httpSession.getAttribute("giohang");
		System.out.println(gioHangs.size() +" "+list.size());
	}

}
