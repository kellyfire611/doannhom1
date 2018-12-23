/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author '
 */
public class DonHang_SanPham {
    private  int sp_dh_soluong;
    private SanPham sanpham;
    private DonHang donhang;

    public DonHang_SanPham() {
    }

    public DonHang_SanPham(int sp_dh_soluong, SanPham sanpham, DonHang donhang) {
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

    public SanPham getSanpham() {
        return sanpham;
    }

    public void setSanpham(SanPham sanpham) {
        this.sanpham = sanpham;
    }

    public DonHang getDonhang() {
        return donhang;
    }

    public void setDonhang(DonHang donhang) {
        this.donhang = donhang;
    }
    
    public void inDonHangSanPham(){
        getDonhang().inDonHang();
        System.out.println("-----DS Sản phẩm-----");
        System.out.println(getSanpham().getSp_ten() + "\t:" + getSp_dh_soluong());
    }
}
