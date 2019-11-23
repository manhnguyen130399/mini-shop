package com.manhnguyen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manhnguyen.dao.SizeSanPhamDAO;
import com.manhnguyen.daoimpl.SizeSanPhamImpl;
import com.manhnguyen.entity.SizeSanPham;
@Service
public class SizeSanPhamService implements SizeSanPhamImpl {

	@Autowired
	SizeSanPhamDAO size;
	public List<SizeSanPham> laydssize() {
		// TODO Auto-generated method stub
		return size.laydssize();
	}

}
