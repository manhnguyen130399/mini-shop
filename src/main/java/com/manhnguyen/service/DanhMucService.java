package com.manhnguyen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manhnguyen.dao.DanhMucSanPhamDAO;
import com.manhnguyen.daoimpl.DanhMucImpl;
import com.manhnguyen.entity.DanhMucSanPham;
@Service
public class DanhMucService implements DanhMucImpl {

	@Autowired
	DanhMucSanPhamDAO danhMucSanPhamDAO;
	
	public List<DanhMucSanPham> LayDanhMuc() {
		return danhMucSanPhamDAO.LayDanhMuc();
	}

}
