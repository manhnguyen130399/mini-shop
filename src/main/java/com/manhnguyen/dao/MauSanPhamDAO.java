package com.manhnguyen.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.manhnguyen.daoimpl.MauSanPhamImpl;
import com.manhnguyen.entity.MauSanPham;
@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MauSanPhamDAO implements MauSanPhamImpl {
	@Autowired
	SessionFactory sessionFactory;
	@Transactional
	public List<MauSanPham> laydsmau() {
		Session session=sessionFactory.getCurrentSession();
		String query="from MAUSANPHAM";
		List<MauSanPham> list=session.createQuery(query).getResultList();
		return list;
	}

}
