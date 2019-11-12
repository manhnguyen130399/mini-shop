package com.manhnguyen.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.manhnguyen.daoimpl.DanhMucImpl;
import com.manhnguyen.entity.DanhMucSanPham;
import com.manhnguyen.entity.SanPham;
@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class DanhMucSanPhamDAO implements DanhMucImpl {

	@Autowired
	SessionFactory sessionFactory;
	@Transactional
	public List<DanhMucSanPham> LayDanhMuc() {
		Session session=sessionFactory.getCurrentSession();
		String query="from DANHMUCSANPHAM";
		List<DanhMucSanPham>danhMucSanPhams=session.createQuery(query).getResultList();
		
		return danhMucSanPhams;
	}

}
