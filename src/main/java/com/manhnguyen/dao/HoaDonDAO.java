package com.manhnguyen.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.manhnguyen.daoimpl.HoaDonImpl;
import com.manhnguyen.entity.HoaDon;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class HoaDonDAO implements HoaDonImpl {
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public int ThemHoaDon(HoaDon hd) {
		
		Session session=sessionFactory.getCurrentSession();
		int id= (Integer) session.save(hd);
		if(id>0) {
			return id;
		}
		return 0;
		
	}

}
