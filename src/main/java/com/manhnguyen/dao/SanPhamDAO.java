package com.manhnguyen.dao;

import java.util.ArrayList;
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
		List<SanPham> listSanPhams=new ArrayList<SanPham>();
		Session session=sessionFactory.getCurrentSession();
		if(spbd<0) {
			String query="from SANPHAM ";
			 listSanPhams=(List<SanPham>) session.createQuery(query).getResultList();
			
		}else {
			listSanPhams=(List<SanPham>)session.createQuery("from SANPHAM Limit").setFirstResult(spbd).setMaxResults(5).getResultList();
		}
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

	@Transactional
	public List<SanPham> LayDSSPTheoDanhMuc(int madanhmuc) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		String query="from SANPHAM sp where sp. danhMucSanPham.madanhmuc='"+madanhmuc+"'";
		List<SanPham> listSanPhams=(List<SanPham>) session.createQuery(query).getResultList();
		return listSanPhams;
	}

	@Transactional
	public boolean XoaSanPhamTheoMaSP(int masp) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		SanPham sanPham=new SanPham();
		sanPham.setMasanpham(masp);
		session.delete(sanPham);
		return false;
	}

	@Transactional
	public boolean ThemSanPham(SanPham sp) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		int id=(Integer) session.save(sp);
		return false;
	}
	

}
