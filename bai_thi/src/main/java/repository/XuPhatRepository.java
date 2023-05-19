package repository;

import model.XuPhat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class XuPhatRepository implements IXuPhatRepository {
    private final String LIST_XU_PHAT = "SELECT xu_phat.ma_so_phieu_phat,xu_phat.ten_tai_khoan_bi_phat,xu_phat.ma_so_dang_ky,xu_phat.thong_tin_loi_vi_phan,xu_phat.ngay_gio_vi_pham,xu_phat.so_tien_can_dong_phat,xu_phat.ghi_chu FROM xu_phat;";
   private final String DELETE_XU_PHAT = "DELETE FROM xu_phat where id = ?;";
    List<XuPhat> xuPhatList = new ArrayList<>();

    @Override
    public List<XuPhat> getAll() {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(LIST_XU_PHAT);
            ResultSet resultSet = preparedStatement.executeQuery();
            XuPhat xuPhat;
            while (resultSet.next()){
                int maSoPhieuPhat = resultSet.getInt("xu_phat.ma_so_phieu_phat");
                String tenTaiKhoanBiPhat = resultSet.getString("xu_phat.ten_tai_khoan_bi_phat");
                int maSoDangKy = resultSet.getInt("xu_phat.ma_so_dang_ky");
                String loiViPham = resultSet.getString("xu_phat.thong_tin_loi_vi_phan");
                String ngayGioViPham = resultSet.getString("xu_phat.ngay_gio_vi_pham");
                String soTienDongPhat = resultSet.getString("xu_phat.so_tien_can_dong_phat");
                String ghiChu = resultSet.getString("xu_phat.ghi_chu");
                xuPhatList.add(new XuPhat(maSoPhieuPhat,tenTaiKhoanBiPhat,maSoDangKy,loiViPham,ngayGioViPham,soTienDongPhat,ghiChu));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return xuPhatList;
    }

    @Override
    public void remove(int id) {
Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_XU_PHAT);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
