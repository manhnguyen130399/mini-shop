package com.manhnguyen.daoimpl;

import java.util.List;

import com.manhnguyen.entity.SanPham;

public interface SanPhamImpl {
	public List<SanPham>LayDanhSachSanPhamLimit(int spbd);

	public SanPham LayDanhSachChiTietSanPham(int masp);
	List<SanPham> LayDSSPTheoDanhMuc(int madanhmuc);
	boolean XoaSanPhamTheoMaSP(int masp);
	boolean ThemSanPham(SanPham sp);
}
