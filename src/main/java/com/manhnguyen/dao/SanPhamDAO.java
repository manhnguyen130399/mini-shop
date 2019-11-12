package com.manhnguyen.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.manhnguyen.daoimpl.SanPhamImpl;
import com.manhnguyen.entity.ChiTietSanPham;
import com.manhnguyen.entity.SanPham;
@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class SanPhamDAO implements SanPhamImpl {

	@Autowired 
	SessionFactory sessionFactory;
	
	@Transactional
	public List<SanPham> LayDanhSachSanPhamLimit(int spbd) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		List<SanPham>listSanPhams=(List<SanPham>)session.createQuery("from SANPHAM Limit").setFirstResult(spbd).setMaxResults(20).getResultList();
		return listSanPhams;
	}

	@Transactional
	public SanPham LayDanhSachChiTietSanPham(int masp) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		String query="from SANPHAM sp where sp.masanpham='"+masp+"'";
		SanPham listSanPhams=(SanPham) session.createQuery(query).getSingleResult();
		return listSanPhams;
	}
	

}
