package com.manhnguyen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.manhnguyen.dao.NhanVienDAO;
import com.manhnguyen.daoimpl.NhanVienImpl;
import com.manhnguyen.entity.NhanVien;

@Service
public class NhanVienService implements NhanVienImpl {
	
	@Autowired
	NhanVienDAO nvNhanVienDAO;

	public boolean KiemTraDangNhap(String tendangnhap, String matkhau) {
		boolean kiemtra =nvNhanVienDAO.KiemTraDangNhap(tendangnhap, matkhau);
		return kiemtra;
	}

	public boolean ThemNhanVien(NhanVien nv) {
		boolean kt=nvNhanVienDAO.ThemNhanVien(nv);
		return kt;
	}

	public boolean KTtendangnhap(String tendangnhap) {
		boolean kiemtra =nvNhanVienDAO.KTtendangnhap(tendangnhap);
		return kiemtra;
	}
	
	
}
