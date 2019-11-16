package com.manhnguyen.entity;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="CHITIETHOADON")
public class ChiTietHoaDon implements Serializable {

	@EmbeddedId
	ChiTietHoaDonId chiTietHoaDonId;
	private int soluong;
	private String giatien;
	public ChiTietHoaDonId getChiTietHoaDonId() {
		return chiTietHoaDonId;
	}
	public void setChiTietHoaDonId(ChiTietHoaDonId chiTietHoaDonId) {
		this.chiTietHoaDonId = chiTietHoaDonId;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public String getGiatien() {
		return giatien;
	}
	public void setGiatien(String giatien) {
		this.giatien = giatien;
	}
	
	
}
