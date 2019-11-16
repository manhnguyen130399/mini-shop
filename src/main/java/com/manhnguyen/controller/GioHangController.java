package com.manhnguyen.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.manhnguyen.entity.ChiTietHoaDon;
import com.manhnguyen.entity.ChiTietHoaDonId;
import com.manhnguyen.entity.GioHang;
import com.manhnguyen.entity.HoaDon;
import com.manhnguyen.service.ChiTietHoaDonService;
import com.manhnguyen.service.HoaDonService;

@Controller
@RequestMapping("giohang/")
public class GioHangController {
	@Autowired
	HoaDonService HoaDonService;
	@Autowired
	ChiTietHoaDonService chiTietHoaDonService;
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
	@PostMapping
	public String ThemHoaDon(HttpSession httpSession, @RequestParam	 String tenkhachhang,@RequestParam String sodt,
			@RequestParam String diachigiaohang,
			@RequestParam String hinhthucgiaohang,
			@RequestParam String ghichu
			) {
		if(null != httpSession.getAttribute("giohang"))
		{
			List<GioHang>listGioHangs=(List<GioHang>) httpSession.getAttribute("giohang");
			
		
		
		HoaDon hd=new HoaDon();
		hd.setDiachigiaohang(diachigiaohang);
		hd.setTenkhachhang(tenkhachhang);
		hd.setSodt(sodt);
		hd.setGhichu(ghichu);
		hd.setHinhthucgiaohang(hinhthucgiaohang);
		int idHoaDon=HoaDonService.ThemHoaDon(hd);
		if(idHoaDon>0) {
			
			Set<ChiTietHoaDon> list=new HashSet<ChiTietHoaDon>();
			for(GioHang aGioHang:listGioHangs)
			{
				ChiTietHoaDonId chiTietHoaDonId=new ChiTietHoaDonId();
				chiTietHoaDonId.setMachitietsanpham(aGioHang.getMachitiet());
				chiTietHoaDonId.setMahoadon(hd.getMahoadon());
				ChiTietHoaDon chiTietHoaDon=new ChiTietHoaDon();
				chiTietHoaDon.setChiTietHoaDonId(chiTietHoaDonId);
				chiTietHoaDon.setGiatien(aGioHang.getGiatien());
				chiTietHoaDon.setSoluong(aGioHang.getSoluong());
				chiTietHoaDonService.ThemChiTietHoaDon(chiTietHoaDon);
				
			}
			System.out.println("thanh cong");
		}else {
			System.out.println("that bai");
		}
		}
		return "trangchu";
	}

}
