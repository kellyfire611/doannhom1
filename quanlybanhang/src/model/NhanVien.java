/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author '
 */
public class NhanVien extends NguoiDung{
    private  double nv_luong;
    private String nv_ngaybatdaulamviec;
    private List<HoaDon> cachoadon;
    private List<DonHang> cacdonhang;

    public NhanVien() {
    }

    public NhanVien(double nv_luong, String nv_ngaybatdaulamviec, int nd_ma, 
                String nd_ten, T_DiaChi nd_diachi, String nd_gioitinh, String nd_ngaysinh) {
        super(nd_ma, nd_ten, nd_diachi, nd_gioitinh, nd_ngaysinh);
        this.nv_luong = nv_luong;
        this.nv_ngaybatdaulamviec = nv_ngaybatdaulamviec;
    }

    public NhanVien(double nv_luong, String nv_ngaybatdaulamviec, List<HoaDon> cachoadon, 
            int nd_ma, String nd_ten, T_DiaChi nd_diachi, String nd_gioitinh, String nd_ngaysinh) {
        super(nd_ma, nd_ten, nd_diachi, nd_gioitinh, nd_ngaysinh);
        this.nv_luong = nv_luong;
        this.nv_ngaybatdaulamviec = nv_ngaybatdaulamviec;
        this.cachoadon = cachoadon;
    }

    public NhanVien(double nv_luong, String nv_ngaybatdaulamviec, List<HoaDon> cachoadon, 
            List<DonHang> cacdonhang, int nd_ma, String nd_ten, T_DiaChi nd_diachi, String nd_gioitinh, String nd_ngaysinh) {
        super(nd_ma, nd_ten, nd_diachi, nd_gioitinh, nd_ngaysinh);
        this.nv_luong = nv_luong;
        this.nv_ngaybatdaulamviec = nv_ngaybatdaulamviec;
        this.cachoadon = cachoadon;
        this.cacdonhang = cacdonhang;
    }
    
    public double getNv_luong() {
        return nv_luong;
    }

    public void setNv_luong(double nv_luong) {
        this.nv_luong = nv_luong;
    }

    public String getNv_ngaybatdaulamviec() {
        return nv_ngaybatdaulamviec;
    }

    public void setNv_ngaybatdaulamviec(String nv_ngaybatdaulamviec) {
        this.nv_ngaybatdaulamviec = nv_ngaybatdaulamviec;
    }

    public List<HoaDon> getCachoadon() {
        return cachoadon;
    }

    public void setCachoadon(List<HoaDon> cachoadon) {
        this.cachoadon = cachoadon;
    }

    public List<DonHang> getCacdonhang() {
        return cacdonhang;
    }

    public void setCacdonhang(List<DonHang> cacdonhang) {
        this.cacdonhang = cacdonhang;
    }
        
    public void inNhanVien(){
        super.inNguoiDung();
        System.out.println("Lương: " + getNv_luong() 
                        + "\nNgày bắt đầu làm việc: " + getNv_ngaybatdaulamviec());
    }
    
}
