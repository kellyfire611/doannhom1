/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author '
 */
public class O_DonHang_SanPham {
    private  int sp_dh_soluong;
    private O_SanPham sanpham;
    private O_DonHang donhang;

    public O_DonHang_SanPham() {
    }

    public O_DonHang_SanPham(int sp_dh_soluong, O_SanPham sanpham, O_DonHang donhang) {
        this.sp_dh_soluong = sp_dh_soluong;
        this.sanpham = sanpham;
        this.donhang = donhang;
    }

    public int getSp_dh_soluong() {
        return sp_dh_soluong;
    }

    public void setSp_dh_soluong(int sp_dh_soluong) {
        this.sp_dh_soluong = sp_dh_soluong;
    }

    public O_SanPham getSanpham() {
        return sanpham;
    }

    public void setSanpham(O_SanPham sanpham) {
        this.sanpham = sanpham;
    }

    public O_DonHang getDonhang() {
        return donhang;
    }

    public void setDonhang(O_DonHang donhang) {
        this.donhang = donhang;
    }
    
    public void inDonHangSanPham(){
        getDonhang().inDonHang();
        System.out.println("-----DS Sản phẩm-----");
        System.out.println(getSanpham().getSp_ten() + "\t:" + getSp_dh_soluong());
    }
}
