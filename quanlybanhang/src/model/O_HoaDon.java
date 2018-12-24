/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author '
 */
public class HoaDon {
    private int hd_ma;
private Date hd_ngaylap;
private String hd_tencongty;
private String hd_masothue;
private NhanVien nhanvien;

    public HoaDon() {
    }

    public HoaDon(int hd_ma, Date hd_ngaylap, String hd_tencongty, String hd_masothue) {
        this.hd_ma = hd_ma;
        this.hd_ngaylap = hd_ngaylap;
        this.hd_tencongty = hd_tencongty;
        this.hd_masothue = hd_masothue;
    }

    public HoaDon(int hd_ma, Date hd_ngaylap, String hd_tencongty, String hd_masothue, NhanVien nhanvien) {
        this.hd_ma = hd_ma;
        this.hd_ngaylap = hd_ngaylap;
        this.hd_tencongty = hd_tencongty;
        this.hd_masothue = hd_masothue;
        this.nhanvien = nhanvien;
    }

    public int getHd_ma() {
        return hd_ma;
    }

    public void setHd_ma(int hd_ma) {
        this.hd_ma = hd_ma;
    }

    public Date getHd_ngaylap() {
        return hd_ngaylap;
    }

    public void setHd_ngaylap(Date hd_ngaylap) {
        this.hd_ngaylap = hd_ngaylap;
    }

    public String getHd_tencongty() {
        return hd_tencongty;
    }

    public void setHd_tencongty(String hd_tencongty) {
        this.hd_tencongty = hd_tencongty;
    }

    public String getHd_masothue() {
        return hd_masothue;
    }

    public void setHd_masothue(String hd_masothue) {
        this.hd_masothue = hd_masothue;
    }

    public NhanVien getNhanvien() {
        return nhanvien;
    }

    public void setNhanvien(NhanVien nhanvien) {
        this.nhanvien = nhanvien;
    }

    

}
