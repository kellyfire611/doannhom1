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
public class T_DiaChi {
    private int so;
    private String duong;
    private String tinh;

    public T_DiaChi() {
    }

    public T_DiaChi(int so, String duong, String tinh) {
        this.so = so;
        this.duong = duong;
        this.tinh = tinh;
    }

    public int getSo() {
        return so;
    }

    public void setSo(int so) {
        this.so = so;
    }

    public String getDuong() {
        return duong;
    }

    public void setDuong(String duong) {
        this.duong = duong;
    }

    public String getTinh() {
        return tinh;
    }

    public void setTinh(String tinh) {
        this.tinh = tinh;
    }
    
    public void inDiaChi(){
        System.out.println("Số nhà: " + getSo() + ", Đường: " + getDuong() + ", Tỉnh: " + getTinh());
    }
}
