/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author '
 */
public class SanPham {

    private int sp_ma;
    private String sp_ten;
    private double sp_giaBan;
    private String sp_mota;
    private int sp_soluongton;
    private String sp_loaisp;
    private String sp_nhasanxuat;
    private String sp_hinhanh;
    private List<DonHang_SanPham> cac_chitiet_donhang;

    public SanPham() {
    }

    public SanPham(int sp_ma, String sp_ten, double sp_gia, String sp_mota, 
            int sp_soluong, String sp_loaisp, String sp_nhasanxuat, String sp_hinhanh) {
        this.sp_ma = sp_ma;
        this.sp_ten = sp_ten;
        this.sp_giaBan = sp_gia;
        this.sp_mota = sp_mota;
        this.sp_soluongton = sp_soluong;
        this.sp_loaisp = sp_loaisp;
        this.sp_nhasanxuat = sp_nhasanxuat;
        this.sp_hinhanh = sp_hinhanh;
        this.cac_chitiet_donhang = new ArrayList<DonHang_SanPham>();
    }

    public int getSp_ma() {
        return sp_ma;
    }

    public void setSp_ma(int sp_ma) {
        this.sp_ma = sp_ma;
    }

    public String getSp_ten() {
        return sp_ten;
    }

    public void setSp_ten(String sp_ten) {
        this.sp_ten = sp_ten;
    }

    public double getSp_giaBan() {
        return sp_giaBan;
    }

    public void setSp_giaBan(double sp_giaBan) {
        this.sp_giaBan = sp_giaBan;
    }

    public String getSp_mota() {
        return sp_mota;
    }

    public void setSp_mota(String sp_mota) {
        this.sp_mota = sp_mota;
    }

    public int getSp_soluongton() {
        return sp_soluongton;
    }

    public void setSp_soluongton(int sp_soluongton) {
        this.sp_soluongton = sp_soluongton;
    }

    public String getSp_loaisp() {
        return sp_loaisp;
    }

    public void setSp_loaisp(String sp_loaisp) {
        this.sp_loaisp = sp_loaisp;
    }

    public String getSp_nhasanxuat() {
        return sp_nhasanxuat;
    }

    public void setSp_nhasanxuat(String sp_nhasanxuat) {
        this.sp_nhasanxuat = sp_nhasanxuat;
    }

    public String getSp_hinhanh() {
        return sp_hinhanh;
    }

    public void setSp_hinhanh(String sp_hinhanh) {
        this.sp_hinhanh = sp_hinhanh;
    }
    
    public List<DonHang_SanPham> getDonhangSanpham(){
        return cac_chitiet_donhang;
    }
    
    public void setDonhangSanPham(List<DonHang_SanPham> dhsp){
        this.cac_chitiet_donhang = dhsp;
    }
    
    public void inSanPham(){
        System.out.println("Mã: " + getSp_ma()
                            +"\nTên:" + getSp_ten()
                            +"\nGiá:" + getSp_giaBan()
                            +"\nMô tả:" + getSp_mota()
                            +"\nSố lượng:" + getSp_soluongton()
                            +"\nLoại sản phẩm:" + getSp_loaisp()
                            +"\nNhà sản xuất" + getSp_nhasanxuat()
                            +"\nHình ảnh:" + getSp_hinhanh()
        );
    }

}
