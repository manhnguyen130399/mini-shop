package com.manhnguyen.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.manhnguyen.daoimpl.ChiTietHoaDonImpl;
import com.manhnguyen.entity.ChiTietHoaDon;
import com.manhnguyen.entity.ChiTietHoaDonId;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ChiTietHoaDonDAO implements ChiTietHoaDonImpl{

	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public boolean ThemChiTietHoaDon(ChiTietHoaDon cthd) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		ChiTietHoaDonId id=(ChiTietHoaDonId) session.save(cthd);
		if(id!=null) {
			return true;
			
		}
		return false;
	}

}
