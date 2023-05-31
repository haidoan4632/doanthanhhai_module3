package Repository;

import Model.NhanVien;

import java.util.ArrayList;
import java.util.List;

public class Repository implements IRepository {
    static List<NhanVien> nhanVienList = new ArrayList<>();
    NhanVien nhanVien;

    static {
        nhanVienList.add(new NhanVien(1, "Doãn Thanh Hải", "Doanhai@gmail.com", "1"));
        nhanVienList.add(new NhanVien(1, "Doãn Thanh Hải", "Doanhai@gmail.com", "1"));
        nhanVienList.add(new NhanVien(1, "Doãn Thanh Hải", "Doanhai@gmail.com", "1"));
        nhanVienList.add(new NhanVien(1, "Doãn Thanh Hải", "Doanhai@gmail.com", "1"));
        nhanVienList.add(new NhanVien(1, "Doãn Thanh Hải", "Doanhai@gmail.com", "1"));
        nhanVienList.add(new NhanVien(1, "Doãn Thanh Hải", "Doanhai@gmail.com", "1"));
        nhanVienList.add(new NhanVien(1, "Doãn Thanh Hải", "Doanhai@gmail.com", "1"));
        nhanVienList.add(new NhanVien(1, "Doãn Thanh Hải", "Doanhai@gmail.com", "1"));
    }

    @Override
    public List<NhanVien> getAll() {
        return nhanVienList;
    }
}
