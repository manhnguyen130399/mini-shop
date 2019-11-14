package com.manhnguyen.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.manhnguyen.entity.GioHang;

@Controller
@RequestMapping("giohang/")
public class GioHangController {
	@GetMapping
	public String Default(HttpSession httpSession, ModelMap map) {
		if(null != httpSession.getAttribute("giohang"))
		{
			List<GioHang>listGioHangs=(List<GioHang>) httpSession.getAttribute("giohang");
			map.addAttribute("soluongsanphamgiohang",listGioHangs.size());
			map.addAttribute("giohang", listGioHangs);
			
		}
		return "giohang";
		
	}

}
