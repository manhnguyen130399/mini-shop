package com.manhnguyen.daoimpl;

import com.manhnguyen.entity.NhanVien;

public interface NhanVienImpl {

	public boolean ThemNhanVien(NhanVien nv);
	public boolean KTtendangnhap(String tendangnhap);
	public boolean KiemTraDangNhap(String tendangnhap,String matkhau);
}
