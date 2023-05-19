package model;

public class XuPhat {
    private int maSoPhieuPhat;
    private String tenTaiKhoanBiPhat;
    private int maSoDangKy;
    private String loiViPham;
    private String ngayGioViPham;
    private String soTienDongPhat;
    private String ghiChu;

    public XuPhat() {
    }

    public XuPhat(int maSoPhieuPhat, String tenTaiKhoanBiPhat, int maSoDangKy, String loiViPham, String ngayGioViPham, String soTienDongPhat, String ghiChu) {
        this.maSoPhieuPhat = maSoPhieuPhat;
        this.tenTaiKhoanBiPhat = tenTaiKhoanBiPhat;
        this.maSoDangKy = maSoDangKy;
        this.loiViPham = loiViPham;
        this.ngayGioViPham = ngayGioViPham;
        this.soTienDongPhat = soTienDongPhat;
        this.ghiChu = ghiChu;
    }

    public int getMaSoPhieuPhat() {
        return maSoPhieuPhat;
    }

    public void setMaSoPhieuPhat(int maSoPhieuPhat) {
        this.maSoPhieuPhat = maSoPhieuPhat;
    }

    public String getTenTaiKhoanBiPhat() {
        return tenTaiKhoanBiPhat;
    }

    public void setTenTaiKhoanBiPhat(String tenTaiKhoanBiPhat) {
        this.tenTaiKhoanBiPhat = tenTaiKhoanBiPhat;
    }

    public int getMaSoDangKy() {
        return maSoDangKy;
    }

    public void setMaSoDangKy(int maSoDangKy) {
        this.maSoDangKy = maSoDangKy;
    }

    public String getLoiViPham() {
        return loiViPham;
    }

    public void setLoiViPham(String loiViPham) {
        this.loiViPham = loiViPham;
    }

    public String getNgayGioViPham() {
        return ngayGioViPham;
    }

    public void setNgayGioViPham(String ngayGioViPham) {
        this.ngayGioViPham = ngayGioViPham;
    }

    public String getSoTienDongPhat() {
        return soTienDongPhat;
    }

    public void setSoTienDongPhat(String soTienDongPhat) {
        this.soTienDongPhat = soTienDongPhat;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }
}
