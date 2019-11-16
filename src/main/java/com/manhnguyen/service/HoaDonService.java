package com.manhnguyen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manhnguyen.dao.HoaDonDAO;
import com.manhnguyen.daoimpl.HoaDonImpl;
import com.manhnguyen.entity.HoaDon;

@Service
public class HoaDonService implements HoaDonImpl {
	@Autowired
	HoaDonDAO hoaDonDAO;

	public int ThemHoaDon(HoaDon hd) {
		return hoaDonDAO.ThemHoaDon(hd);
	}

}
