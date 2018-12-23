/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.Date;

/**
 *
 * @author '
 */
public class NguoiDung {
    private int nd_ma;
    private String nd_ten;
    private T_DiaChi nd_diachi;
    private String nd_gioitinh;
    private Date nd_ngaysinh;

    public NguoiDung() {
    }

    public NguoiDung(int nd_ma, String nd_ten, T_DiaChi nd_diachi, String nd_gioitinh, Date nd_ngaysinh) {
        this.nd_ma = nd_ma;
        this.nd_ten = nd_ten;
        this.nd_diachi = nd_diachi;
        this.nd_gioitinh = nd_gioitinh;
        this.nd_ngaysinh = nd_ngaysinh;
    }

    public int getNd_ma() {
        return nd_ma;
    }

    public void setNd_ma(int nd_ma) {
        this.nd_ma = nd_ma;
    }

    public String getNd_ten() {
        return nd_ten;
    }

    public void setNd_ten(String nd_ten) {
        this.nd_ten = nd_ten;
    }

    public T_DiaChi getNd_diachi() {
        return nd_diachi;
    }

    public void setNd_diachi(T_DiaChi nd_diachi) {
        this.nd_diachi = nd_diachi;
    }

    public String getNd_gioitinh() {
        return nd_gioitinh;
    }

    public void setNd_gioitinh(String nd_gioitinh) {
        this.nd_gioitinh = nd_gioitinh;
    }

    public Date getNd_ngaysinh() {
        return nd_ngaysinh;
    }

    public void setNd_ngaysinh(Date nd_ngaysinh) {
        this.nd_ngaysinh = nd_ngaysinh;
    }
    
    public void inNguoiDung(){
        System.out.println("Mã: " + getNd_ma() 
                            +"\nTên:" + getNd_ten()
                            +"\nĐịa chỉ:" + getNd_ten()
                            +"\nGiới tính:" + getNd_ten()
                            +"\nNgày sinh:" + getNd_ten()
        );
    }
}
