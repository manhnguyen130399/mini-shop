package com.manhnguyen.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.manhnguyen.entity.NhanVien;
import com.manhnguyen.service.NhanVienService;

@Controller
@RequestMapping("dangnhap/")
@SessionAttributes("chucaidau")
public class DangNhapController {

	@Autowired
	NhanVienService nvNhanVienService;
	@GetMapping
	public String Default() {
		
		return "dangnhap";
	}
	@PostMapping
	public String DangKy(@RequestParam String tendangnhap1,@RequestParam String matkhau1,@RequestParam String nhaplaimatkhau1,ModelMap map) {
		
		boolean kt1=nvNhanVienService.KTtendangnhap(tendangnhap1);
		if(kt1==false) {
			if(matkhau1.equals(nhaplaimatkhau1)) {
				NhanVien nv=new NhanVien();
				nv.setTendangnhap(tendangnhap1);
				nv.setMatkhau(nhaplaimatkhau1);
				boolean kt=nvNhanVienService.ThemNhanVien(nv);
			}
			else {
				map.addAttribute("kiemtradangnhap","Mật khẩu không trùng với bé");
			}
			
		}else {
			map.addAttribute("kiemtradangnhap","Tài khoản đã trùng với bé nào đó");
			
		}
		return "dangnhap";
		
	}
	
}
