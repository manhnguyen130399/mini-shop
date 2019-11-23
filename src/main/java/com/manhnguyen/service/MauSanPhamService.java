package com.manhnguyen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manhnguyen.dao.MauSanPhamDAO;
import com.manhnguyen.daoimpl.MauSanPhamImpl;
import com.manhnguyen.entity.MauSanPham;
@Service
public class MauSanPhamService implements MauSanPhamImpl {

	@Autowired
	MauSanPhamDAO mau;
	public List<MauSanPham> laydsmau() {
		// TODO Auto-generated method stub
		return mau.laydsmau();
	}

}
