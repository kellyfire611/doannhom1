/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author '
 */
public class KhachHang extends NguoiDung{
    private String kh_dienthoai;
    private String kh_email;
    private String kh_loaiKH;
    private List<DonHang> cacdonhang;

    public KhachHang() {
    }

    public KhachHang(String kh_dienthoai, String kh_email, String kh_loaiKH, 
            int nd_ma, String nd_ten, T_DiaChi nd_diachi, String nd_gioitinh, Date nd_ngaysinh) {
        super(nd_ma, nd_ten, nd_diachi, nd_gioitinh, nd_ngaysinh);
        this.kh_dienthoai = kh_dienthoai;
        this.kh_email = kh_email;
        this.kh_loaiKH = kh_loaiKH;
        this.cacdonhang = new ArrayList<>();
    }

    public String getKh_dienthoai() {
        return kh_dienthoai;
    }

    public void setKh_dienthoai(String kh_dienthoai) {
        this.kh_dienthoai = kh_dienthoai;
    }

    public String getKh_email() {
        return kh_email;
    }

    public void setKh_email(String kh_email) {
        this.kh_email = kh_email;
    }

    public String getKh_loaiKH() {
        return kh_loaiKH;
    }

    public void setKh_loaiKH(String kh_loaiKH) {
        this.kh_loaiKH = kh_loaiKH;
    }
    
    public List<DonHang> getDonHang(){
        return cacdonhang;
    }
    
    public void setDonHang(List<DonHang> donhang){
        this.cacdonhang = donhang;
    }
    
    public boolean themMotDonHang(DonHang dh){
        return cacdonhang.add(dh);
    }
    
    public void inKhachHang(){
        super.inNguoiDung();
        System.out.println("Điện thoại: " + getKh_dienthoai()
                            +"\nEmail:" + getKh_email()
                            +"\nLoại khách hàng:" + getKh_loaiKH()
        );
    }
}
