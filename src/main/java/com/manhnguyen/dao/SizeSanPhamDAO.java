package com.manhnguyen.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.manhnguyen.daoimpl.SizeSanPhamImpl;
import com.manhnguyen.entity.SanPham;
import com.manhnguyen.entity.SizeSanPham;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class SizeSanPhamDAO implements SizeSanPhamImpl {
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public List<SizeSanPham> laydssize() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		String query="from SIZESANPHAM";
		List<SizeSanPham> list=session.createQuery(query).getResultList();
		return list;
	}

}
