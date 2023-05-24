package model;

public class HocVien {
    private int maHocVien;
    private String tenHocVien;
    private String gioiTinh;
    private int diemSo;

    public HocVien() {
    }

    public HocVien(int maHocVien, String tenHocVien, String gioiTinh, int diemSo) {
        this.maHocVien = maHocVien;
        this.tenHocVien = tenHocVien;
        this.gioiTinh = gioiTinh;
        this.diemSo = diemSo;
    }

    public int getMaHocVien() {
        return maHocVien;
    }

    public void setMaHocVien(int maHocVien) {
        this.maHocVien = maHocVien;
    }

    public String getTenHocVien() {
        return tenHocVien;
    }

    public void setTenHocVien(String tenHocVien) {
        this.tenHocVien = tenHocVien;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public int getDiemSo() {
        return diemSo;
    }

    public void setDiemSo(int diemSo) {
        this.diemSo = diemSo;
    }
}
