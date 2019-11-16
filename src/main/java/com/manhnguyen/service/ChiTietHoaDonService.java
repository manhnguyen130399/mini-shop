package com.manhnguyen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manhnguyen.dao.ChiTietHoaDonDAO;
import com.manhnguyen.daoimpl.ChiTietHoaDonImpl;
import com.manhnguyen.entity.ChiTietHoaDon;
@Service
public class ChiTietHoaDonService implements ChiTietHoaDonImpl{

	@Autowired
	ChiTietHoaDonDAO chiTietHoaDonDAO;
	public boolean ThemChiTietHoaDon(ChiTietHoaDon cthd) {
		// TODO Auto-generated method stub
		return chiTietHoaDonDAO.ThemChiTietHoaDon(cthd);
	}

}
