package com.manhnguyen.dao;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.annotations.Proxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.manhnguyen.daoimpl.NhanVienImpl;
import com.manhnguyen.entity.NhanVien;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class NhanVienDAO  implements NhanVienImpl{
	
	

	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public boolean KiemTraDangNhap(String tendangnhap, String matkhau) {
		// TODO Auto-generated method stub
		try {
		Session session=sessionFactory.getCurrentSession();
		NhanVien nv=(NhanVien) session.createQuery("from NHANVIEN Where tendangnhap='"+tendangnhap+"'and matkhau='"+matkhau+"'").getSingleResult();
		if(nv!=null) {
			return true;
		}else {
			return false;
		}
		}catch(Exception e) {
			return false;
		}
		
	}

	@Transactional
	public boolean ThemNhanVien(NhanVien nv) {
		Session session =sessionFactory.getCurrentSession();
		int manv=(Integer) session.save(nv);
		if(manv>0) {
			return true;
		}else {
		return false;
		}
	
	}

	@Transactional
	public boolean KTtendangnhap(String tendangnhap) {
	
			Session session=sessionFactory.getCurrentSession();
			ArrayList<NhanVien> nv=(ArrayList<NhanVien>) session.createQuery("from NHANVIEN Where tendangnhap='"+tendangnhap+"'").getResultList();
			for (NhanVien nhanVien : nv) {
				if(nhanVien.getTendangnhap().equals(tendangnhap))
				{
					return true;
				}
			}
			return false;
			
			
	}


	
}
