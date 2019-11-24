package com.manhnguyen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manhnguyen.dao.SanPhamDAO;
import com.manhnguyen.daoimpl.SanPhamImpl;
import com.manhnguyen.entity.SanPham;
@Service
public class SanPhamServices implements SanPhamImpl {
	@Autowired
	SanPhamDAO sanPhamDAO;

	public List<SanPham> LayDanhSachSanPhamLimit(int spbd) {
		return sanPhamDAO.LayDanhSachSanPhamLimit(spbd);
	}

	public SanPham LayDanhSachChiTietSanPham(int masp) {
		// TODO Auto-generated method stub
		return sanPhamDAO.LayDanhSachChiTietSanPham(masp);
		
	}

	public List<SanPham> LayDSSPTheoDanhMuc(int madanhmuc) {
		return sanPhamDAO.LayDSSPTheoDanhMuc(madanhmuc);
	}

	public boolean XoaSanPhamTheoMaSP(int masp) {
		// TODO Auto-generated method stub
		return sanPhamDAO.XoaSanPhamTheoMaSP(masp);
	}

	public boolean ThemSanPham(SanPham sp) {
		// TODO Auto-generated method stub
		return sanPhamDAO.ThemSanPham(sp);
	}

	public boolean CapNhatSanPham(SanPham sp) {
		// TODO Auto-generated method stub
		return sanPhamDAO.CapNhatSanPham(sp);
	}

}
