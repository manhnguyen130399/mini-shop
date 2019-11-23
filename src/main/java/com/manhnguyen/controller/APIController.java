package com.manhnguyen.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.manhnguyen.entity.GioHang;
import com.manhnguyen.entity.SanPham;
import com.manhnguyen.service.NhanVienService;
import com.manhnguyen.service.SanPhamServices;

@Controller
@RequestMapping("api/")
@SessionAttributes({"tendangnhap","giohang"})
public class APIController {
	@Autowired
	NhanVienService nvNhanVienService;
	@Autowired
	SanPhamServices sanPhamServices;
	
	
	@GetMapping("KiemTraDangNhap")
	@ResponseBody
	public String KiemTraDangNhap(@RequestParam String tendangnhap,@RequestParam String matkhau,ModelMap map) {

		boolean kiemtra=nvNhanVienService.KiemTraDangNhap(tendangnhap, matkhau);
		map.addAttribute("tendangnhap",tendangnhap);
		return ""+kiemtra;
	}
	@GetMapping("CapNhatGioHang")
	@ResponseBody
	public void CapNhatGioHang(HttpSession httpSession,@RequestParam int soluong,@RequestParam int masp,@RequestParam int mamau,@RequestParam int masize) {
		if(null != httpSession.getAttribute("giohang")) {
			List<GioHang> listGioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			int vitri=kiemTraSPTonTaiGioHang(listGioHangs, httpSession, masp, mamau, masize);
			listGioHangs.get(vitri).setSoluong(soluong);
			
		}
	}
	@GetMapping("XoaGioHang")
	@ResponseBody
	public void XoaGioHang(HttpSession httpSession,@RequestParam int masp,@RequestParam int mamau,@RequestParam int masize) {
		if(null != httpSession.getAttribute("giohang")) {
			List<GioHang> listGioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			int vitri=kiemTraSPTonTaiGioHang(listGioHangs, httpSession, masp, mamau, masize);
			listGioHangs.remove(vitri);
			
		}
	}
	@GetMapping("ThemGioHang")
	@ResponseBody
	public void themgiohang(@RequestParam String tensp, @RequestParam int masp, @RequestParam int masize , 
			@RequestParam int mamau, @RequestParam int soluong, @RequestParam String giatien, 
			@RequestParam String tenmau, @RequestParam String tensize, HttpSession httpSession,
			@RequestParam int machitiet	) {
		if(null==httpSession.getAttribute("giohang")) {
			List<GioHang> giohangs = new ArrayList<GioHang>();
			
			GioHang gioHang = new GioHang();
			gioHang.setGiatien(giatien);
			gioHang.setMamau(mamau);
			gioHang.setMasize(masize);
			gioHang.setMasp(masp);
			gioHang.setSoluong(1);
			gioHang.setTenmau(tenmau);
			gioHang.setTensize(tensize);
			gioHang.setTensp(tensp);
			gioHang.setMachitiet(machitiet);
			
			
			giohangs.add(gioHang);
			httpSession.setAttribute("giohang", giohangs);
		}else {
			List<GioHang> listGioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			int vitri = kiemTraSPTonTaiGioHang(listGioHangs, httpSession, masp, mamau, masize);
			if(vitri == -1) {
				GioHang gioHang = new GioHang();
				gioHang.setGiatien(giatien);
				gioHang.setMamau(mamau);
				gioHang.setMasize(masize);
				gioHang.setMasp(masp);
				gioHang.setSoluong(1);
				gioHang.setTenmau(tenmau);
				gioHang.setTensize(tensize);
				gioHang.setTensp(tensp);
				gioHang.setMachitiet(machitiet);
				listGioHangs.add(gioHang);
			}else {
				int soluongMoi = listGioHangs.get(vitri).getSoluong() + 1;
				listGioHangs.get(vitri).setSoluong(soluongMoi);
			}
		}
	}
	
	
	private int kiemTraSPTonTaiGioHang(List<GioHang> listGioHangs ,HttpSession httpSession, int masp, int mamau, int masize) {
		for(int i = 0;  i < listGioHangs.size(); i++) {
			if(listGioHangs.get(i).getMasp() == masp 
					&& listGioHangs.get(i).getMamau() == mamau 
					&& listGioHangs.get(i).getMasize() == masize) {
				return i;
			}
		}
		return  -1;
	}
	@GetMapping("LaySoLuongGioHang")
	@ResponseBody
	public String LaySoLuongGioHang(HttpSession httpSession){
		if(null != httpSession.getAttribute("giohang"))
		{
			List<GioHang>listGioHangs=(List<GioHang>) httpSession.getAttribute("giohang");
			return listGioHangs.size()+"";
			
		}
		return "";
	}
	@GetMapping(path="LaySanPhamLimit",produces ="text/plain;charset=utf-8")
	@ResponseBody
	public String LaySanPhamLimit(@RequestParam int spbd){
		String html="";
		List<SanPham> listSanPhams=sanPhamServices.LayDanhSachSanPhamLimit(spbd);
		for (SanPham sanPham : listSanPhams) {
			html+="<tr>";
			html+="<td><div class='checkbox'><label><input class='checkboxsanpham' type='checkbox' value='"+sanPham.getMasanpham()+"'></label></div></td>";
			html+="<td class='tensp' data-masp='"+sanPham.getMasanpham()+"'>"+sanPham.getTensanpham()+"</td>";
			html+="<td class='giatien'>"+sanPham.getGiatien()+"</td>";
			html+="<td class='gianhcho'>"+sanPham.getGianhcho() + "</td>";
			html+="</tr>";
		}
		return html;
	}
	@GetMapping("XoaSanPham")
	@ResponseBody
	public String xoaSpTheoMaSP(@RequestParam int masp) {
		sanPhamServices.XoaSanPhamTheoMaSP(masp);
		return"true";
	}
	@Autowired
	ServletContext context;
	@PostMapping("UploadFile")
	@ResponseBody
	public String UploadFile(MultipartHttpServletRequest request) {
		String path_save_file=context.getRealPath("/resources/images");
		Iterator<String>listNames=request.getFileNames();
		MultipartFile mpf=request.getFile(listNames.next());
		File file_save=new File(path_save_file+mpf.getOriginalFilename());
		try {
			mpf.transferTo(file_save);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(path_save_file);
		return"true";
	}
	@PostMapping("themsanpham")
	@ResponseBody
	public void themsanpham(@RequestParam String datajson) {
		System.out.println(datajson);
	}

}
