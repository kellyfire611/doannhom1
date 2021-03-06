/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author '
 */
public class O_DonHang {

    private int dh_ma;
    private String dh_ngaylap;
    private String dh_ngaygiao;
    private String dh_noigiao;
    private String dh_trangthaithanhtoan;
    private O_NhanVien nv_duyet_donhang;
    private List<O_DonHang_SanPham> donhang_sanpham;

    public O_DonHang() {
    }
    
    public O_DonHang(int dh_ma) {
    	this.dh_ma = dh_ma;
    }

    public O_DonHang(int dh_ma, String dh_ngaylap, String dh_ngaygiao, 
            String dh_noigiao, String dh_trangthaithanhtoan) {
        this.dh_ma = dh_ma;
        this.dh_ngaylap = dh_ngaylap;
        this.dh_ngaygiao = dh_ngaygiao;
        this.dh_noigiao = dh_noigiao;
        this.dh_trangthaithanhtoan = dh_trangthaithanhtoan;
        this.donhang_sanpham = new ArrayList<O_DonHang_SanPham>();
    }

    public O_DonHang(int dh_ma, String dh_ngaylap, String dh_ngaygiao, String dh_noigiao, 
            String dh_trangthaithanhtoan, O_NhanVien nv_duyet_donhang) {
        this.dh_ma = dh_ma;
        this.dh_ngaylap = dh_ngaylap;
        this.dh_ngaygiao = dh_ngaygiao;
        this.dh_noigiao = dh_noigiao;
        this.dh_trangthaithanhtoan = dh_trangthaithanhtoan;
        this.setNv_duyet_donhang(nv_duyet_donhang);
        this.donhang_sanpham = new ArrayList<O_DonHang_SanPham>();
    }

    public int getDh_ma() {
        return dh_ma;
    }

    public void setDh_ma(int dh_ma) {
        this.dh_ma = dh_ma;
    }

    public String getDh_ngaylap() {
        return dh_ngaylap;
    }

    public void setDh_ngaylap(String dh_ngaylap) {
        this.dh_ngaylap = dh_ngaylap;
    }

    public String getDh_ngaygiao() {
        return dh_ngaygiao;
    }

    public void setDh_ngaygiao(String dh_ngaygiao) {
        this.dh_ngaygiao = dh_ngaygiao;
    }

    public String getDh_noigiao() {
        return dh_noigiao;
    }

    public void setDh_noigiao(String dh_noigiao) {
        this.dh_noigiao = dh_noigiao;
    }

    public String getDh_trangthaithanhtoan() {
        return dh_trangthaithanhtoan;
    }

    public void setDh_trangthaithanhtoan(String dh_trangthaithanhtoan) {
        this.dh_trangthaithanhtoan = dh_trangthaithanhtoan;
    }

    public List<O_DonHang_SanPham> getDonhang_sanpham() {
        return donhang_sanpham;
    }

    public void setDonhang_sanpham(List<O_DonHang_SanPham> donhang_sanpham) {
        this.donhang_sanpham = donhang_sanpham;
    }
   
    public List<O_DonHang_SanPham> getDonhangSanpham(){
        return donhang_sanpham;
    }
    
    public void setDonhangSanPham(List<O_DonHang_SanPham> dhsp){
        this.donhang_sanpham = dhsp;
    }
    
    public void inDonHang(){
        System.out.println("Mã: " + getDh_ma()
                            +"\nNgày lập:" + getDh_ngaylap()
                            +"\nNgày giao:" + getDh_ngaygiao()
                            +"\nNơi giao:" + getDh_noigiao()
                            +"\nTrạng thái:" + getDh_trangthaithanhtoan()
        );
    }

	public O_NhanVien getNv_duyet_donhang() {
		return nv_duyet_donhang;
	}

	public void setNv_duyet_donhang(O_NhanVien nv_duyet_donhang) {
		this.nv_duyet_donhang = nv_duyet_donhang;
	}

}
