using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QuanLyPhongTro
{
    public partial class Admin : Form
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source = LAPTOP-3CDTQULM\TRUONGVU;Initial Catalog = QuanLyPhongTro; Integrated Security = True");
        
        public Admin()
        {
            InitializeComponent();
        }

        //Hiển thị Danh sách phòng trọ vào DataGridView
        private void DS_AllPhong()
        {
            sqlCon.Open();
            string sql = "SELECT * FROM dbo.DS_AllPhong()";
            SqlCommand com = new SqlCommand(sql, sqlCon);
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            sqlCon.Close();
            dgvDSPhongTro.DataSource = dt;
        }

        //Load Danh sách phòng trọ lên DataGridView
        private void Load_dtgDSPhong()
        {
            DS_AllPhong();
            // Căn chỉnh Header và Width của DataGridView
            dgvDSPhongTro.Columns[0].HeaderText = "Mã phòng trọ";
            dgvDSPhongTro.Columns[1].HeaderText = "Tòa nhà";
            dgvDSPhongTro.Columns[2].HeaderText = "Tầng";
            dgvDSPhongTro.Columns[3].HeaderText = "Phòng số";
            dgvDSPhongTro.Columns[4].HeaderText = "Giá thuê";
            dgvDSPhongTro.Columns[5].HeaderText = "Số lượng Max";
            dgvDSPhongTro.Columns[6].HeaderText = "Số lượng hiện tại";
            dgvDSPhongTro.Columns[7].HeaderText = "Trạng thái";
            dgvDSPhongTro.Columns[8].HeaderText = "Mô tả";
        }

        //Danh sách khách hàng vào DataGridView
        private void DS_AllKhachHang()
        {
            sqlCon.Open();
            string sql = "SELECT * FROM dbo.DS_AllKhachHang()";
            SqlCommand com = new SqlCommand(sql, sqlCon);
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            sqlCon.Close();
            dgvDSKhachHang.DataSource = dt;
        }

        //Load Danh sách khách hàng lên DataGridView
        private void Load_dtgDSKhachHang()
        {
            DS_AllKhachHang();
            // Căn chỉnh Header và Width của DataGridView
            dgvDSKhachHang.Columns[0].HeaderText = "Tài khoản";
            dgvDSKhachHang.Columns[1].HeaderText = "Mật khẩu";
            dgvDSKhachHang.Columns[2].HeaderText = "Họ tên";
            dgvDSKhachHang.Columns[3].HeaderText = "CCCD";
            dgvDSKhachHang.Columns[4].HeaderText = "SDT";
        }

        //Danh sách hợp đồng
        private void DS_AllHopDong()
        {
            sqlCon.Open();
            string sql = "SELECT * FROM dbo.DS_AllHopDong()";
            SqlCommand com = new SqlCommand(sql, sqlCon);
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            sqlCon.Close();
            dgvDSHopDong.DataSource = dt;
        }

        //Load Danh sách hợp đồng lên DataGridView
        private void Load_dtgDSHopDong()
        {
            DS_AllHopDong();
            // Căn chỉnh Header và Width của DataGridView
            dgvDSHopDong.Columns[0].HeaderText = "Mã hợp đồng";
            dgvDSHopDong.Columns[1].HeaderText = "Mã phòng trọ";
            dgvDSHopDong.Columns[2].HeaderText = "Tài khoản KH";
            dgvDSHopDong.Columns[3].HeaderText = "Ngày ký ";
            dgvDSHopDong.Columns[4].HeaderText = "Ngày kết thúc";
        }

        //Danh sách khách thuê vào DataGridView
        private void DS_AllKhachThue()
        {
            sqlCon.Open();
            string sql = "SELECT * FROM dbo.DS_AllKhachThue()";
            SqlCommand com = new SqlCommand(sql, sqlCon);
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            sqlCon.Close();
            dgvDSKhachThue.DataSource = dt;
        }

        //Load Danh sách khách thuê lên DataGridView
        private void Load_dtgDSKhachThue()
        {
            DS_AllKhachThue();
            // Căn chỉnh Header và Width của DataGridView
            dgvDSKhachThue.Columns[0].HeaderText = "Mã Khách Thuê";
            dgvDSKhachThue.Columns[1].HeaderText = "Mã phòng trọ";
            dgvDSKhachThue.Columns[2].HeaderText = "Họ tên";
            dgvDSKhachThue.Columns[3].HeaderText = "CCCD";
            dgvDSKhachThue.Columns[4].HeaderText = "SDT";
        }

        //Danh sách hóa đơn vào DataGridView
        private void DS_AllHoaDon()
        {
            sqlCon.Open();
            string sql = "SELECT * FROM dbo.DS_AllHoaDon()";
            SqlCommand com = new SqlCommand(sql, sqlCon);
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            sqlCon.Close();
            dgvDSHoaDon.DataSource = dt;
        }

        //Load Danh sách hóa đơn lên DataGridView
        private void Load_dtgDSHoaDon()
        {
            DS_AllHoaDon();
            // Căn chỉnh Header và Width của DataGridView
            dgvDSHoaDon.Columns[0].HeaderText = "Mã hóa đơn";
            dgvDSHoaDon.Columns[1].HeaderText = "Mã phòng trọ";
            dgvDSHoaDon.Columns[2].HeaderText = "Ngày hóa đơn";
            dgvDSHoaDon.Columns[3].HeaderText = "Tiền điện";
            dgvDSHoaDon.Columns[4].HeaderText = "Tiền nước";
            dgvDSHoaDon.Columns[5].HeaderText = "Phí dịch vụ";
            dgvDSHoaDon.Columns[6].HeaderText = "Tổng tiền";
            dgvDSHoaDon.Columns[7].HeaderText = "Trạng thái";
        }

        //Hiển thị thông tin DS Phòng trọ từ DataGridView lên TextBox
        private void dgvDSPhongTro_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = this.dgvDSPhongTro.Rows[e.RowIndex];
            tbMaPhongTro.Text = row.Cells[0].Value.ToString();
            tbToaNha.Text = row.Cells[1].Value.ToString();
            tbTang.Text = row.Cells[2].Value.ToString();
            tbPhongSo.Text = row.Cells[3].Value.ToString();
            tbGiaThue.Text = row.Cells[4].Value.ToString();
            tbSLMax.Text = row.Cells[5].Value.ToString();
            tbSLHienTai.Text = row.Cells[6].Value.ToString();
            tbTrangThaiPhong.Text = row.Cells[7].Value.ToString();
            tbMoTa.Text = row.Cells[8].Value.ToString();
            // Không cho phép sửa
            tbMaPhongTro.Enabled = false;
            tbSLHienTai.Enabled = false;
            tbTrangThaiPhong.Enabled = false;
        }

        //Hiển thị thông tin DS Khách hàng từ DataGridView lên TextBox
        private void dgvDSKhachHang_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = this.dgvDSKhachHang.Rows[e.RowIndex];
            tbTaiKhoan_KH.Text = row.Cells[0].Value.ToString();
            tbMatKhau.Text = row.Cells[1].Value.ToString();
            tbHoTenKH.Text = row.Cells[2].Value.ToString();
            tbCCCD.Text = row.Cells[3].Value.ToString();
            tbSDT.Text = row.Cells[4].Value.ToString();
            // Không cho phép sửa
            tbTaiKhoan_KH.Enabled = false;
        }
        
        //Hiển thị thông tin DS Hợp đồng từ DataGridView lên TextBox
        private void dgvDSHopDong_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = this.dgvDSHopDong.Rows[e.RowIndex];
            tbMaHopDong.Text = row.Cells[0].Value.ToString();
            tbMaPhongTro_HDong.Text = row.Cells[1].Value.ToString();
            tbTaiKhoanKH_HDong.Text = row.Cells[2].Value.ToString();
            tbNgayKyHDong.Text = row.Cells[3].Value.ToString();
            tbNgayKTHDong.Text = row.Cells[4].Value.ToString();
            // Không cho phép sửa
            tbMaHopDong.Enabled = false;
        }
        
        //Hiển thị thông tin DS Khách thuê từ DataGridView lên TextBox
        private void dgvDSKhachThue_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = this.dgvDSKhachThue.Rows[e.RowIndex];
            tbMaKhachThue.Text = row.Cells[0].Value.ToString();
            tbMaPhongTro_KThue.Text = row.Cells[1].Value.ToString();
            tbHoTen_KThue.Text = row.Cells[2].Value.ToString();
            tbCCCD_KThue.Text = row.Cells[3].Value.ToString();
            tbSDT_KThue.Text = row.Cells[4].Value.ToString();
            // Không cho phép sửa
            tbMaKhachThue.Enabled = false;
        }
        
        //Hiển thị thông tin DS Hóa đơn từ DataGridView lên TextBox
        private void dgvDSHoaDon_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = this.dgvDSHoaDon.Rows[e.RowIndex];
            tbMaHoaDon.Text = row.Cells[0].Value.ToString();
            tbMaPhongTro_HDon.Text = row.Cells[1].Value.ToString();
            tbNgayHoaDon.Text = row.Cells[2].Value.ToString();
            tbTienDien.Text = row.Cells[3].Value.ToString();
            tbTienNuoc.Text = row.Cells[4].Value.ToString();
            tbPhiDichVu.Text = row.Cells[5].Value.ToString();
            tbTongTien.Text = row.Cells[6].Value.ToString();
            tbTrangThaiHDon.Text = row.Cells[7].Value.ToString();
            // Không cho phép sửa
            tbMaHoaDon.Enabled = false;
            tbTongTien.Enabled = false;
            tbTrangThaiHDon.Enabled = false;
        }

        // Load dữ liệu ra DataGridView lúc đầu
        private void Admin_Load(object sender, EventArgs e)
        {
            Load_dtgDSPhong();
            Load_dtgDSKhachHang();
            Load_dtgDSHopDong();
            Load_dtgDSKhachThue();
            Load_dtgDSHoaDon();
        }

        // Load dữ liệu ra DataGridView lúc sau
        private void Load_AllDataGV()
        {
            Load_dtgDSPhong();
            Load_dtgDSKhachHang();
            Load_dtgDSHopDong();
            Load_dtgDSKhachThue();
            Load_dtgDSHoaDon();
        }
        
        // THÊM PHÒNG TRỌ
        private void btnThemPhongTro_Click(object sender, EventArgs e)
        {
            if (tbToaNha.Text == "" || tbTang.Text == "" || tbPhongSo.Text == "" || tbGiaThue.Text == "" || tbSLMax.Text == "" || tbMoTa.Text == "")
            {
                MessageBox.Show("Vui lòng Nhập đầy đủ dữ liệu", "Thông báo");
            }
            else
            {
                sqlCon.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "sp_ThemPhongTro";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlCon;
                    // khai báo các thông tin của tham số truyền vào
                    cmd.Parameters.Add("@ToaNha", SqlDbType.VarChar).Value = tbToaNha.Text;
                    cmd.Parameters.Add("@Tang", SqlDbType.VarChar).Value = tbTang.Text;
                    cmd.Parameters.Add("@PhongSo", SqlDbType.VarChar).Value = tbPhongSo.Text;
                    cmd.Parameters.Add("@GiaThue", SqlDbType.Int).Value = tbGiaThue.Text;
                    cmd.Parameters.Add("@SoLuongMAX", SqlDbType.SmallInt).Value = tbSLMax.Text;
                    cmd.Parameters.Add("@MoTaPhong", SqlDbType.NVarChar).Value = tbMoTa.Text;
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Thêm thành công", "Thông báo");
                    tbToaNha.Clear();
                    tbTang.Clear();
                    tbPhongSo.Clear();
                    tbGiaThue.Clear();
                    tbSLMax.Clear();
                    tbMoTa.Clear();
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message, "Thong bao");
                }
                sqlCon.Close();
                Load_AllDataGV();
            }           
        }
        
        // CẬP NHẬT PHÒNG TRỌ
        private void btnCapNhatPhongTro_Click(object sender, EventArgs e)
        {
            if (tbGiaThue.Text == "" || tbSLMax.Text == "" || tbMoTa.Text == "")
            {
                MessageBox.Show("Vui lòng Nhập đầy đủ dữ liệu", "Thông báo");
            }
            else
            {
                sqlCon.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "sp_CapNhatPhongTro";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlCon;
                    // khai báo các thông tin của tham số truyền vào
                    cmd.Parameters.Add("@MaPhongTro", SqlDbType.VarChar).Value = tbMaPhongTro.Text;
                    cmd.Parameters.Add("@GiaThue", SqlDbType.Int).Value = tbGiaThue.Text;
                    cmd.Parameters.Add("@SoLuongMAX", SqlDbType.SmallInt).Value = tbSLMax.Text;
                    cmd.Parameters.Add("@MoTaPhong", SqlDbType.NVarChar).Value = tbMoTa.Text;
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Cập nhật thành công", "Thông báo");
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message, "Thong bao");
                }
                sqlCon.Close();
                Load_AllDataGV();
            }          
        }
        
        // XÓA PHÒNG TRỌ
        private void btnXoaPhongTro_Click(object sender, EventArgs e)
        {
            if (tbMaPhongTro.Text == "")
            {
                MessageBox.Show("Vui lòng Nhập đầy đủ dữ liệu", "Thông báo");
            }
            else
            {
                sqlCon.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "sp_XoaPhongTro";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlCon;
                    // khai báo các thông tin của tham số truyền vào
                    cmd.Parameters.Add("@MaPhongTro", SqlDbType.VarChar).Value = tbMaPhongTro.Text;
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Xóa thành công", "Thông báo");
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message, "Thong bao");
                }
                sqlCon.Close();
                Load_AllDataGV();
            }            
        }
        
        // TRẢ PHÒNG TRỌ
        private void btnTraPhong_Click(object sender, EventArgs e)
        {
            if (tbMaPhongTro.Text == "")
            {
                MessageBox.Show("Vui lòng Nhập đầy đủ dữ liệu", "Thông báo");
            }
            else
            {
                sqlCon.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "sp_TraPhong";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlCon;
                    // khai báo các thông tin của tham số truyền vào
                    cmd.Parameters.Add("@MaPhongTro", SqlDbType.VarChar).Value = tbMaPhongTro.Text;
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Trả phòng thành công", "Thông báo");
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message, "Thong bao");
                }
                sqlCon.Close();
                Load_AllDataGV();
            }          
        }
       
        // CẬP NHẬT KHÁCH HÀNG
        private void btnCapNhatKH_Click(object sender, EventArgs e)
        {
            if (tbTaiKhoan_KH.Text == "" || tbMatKhau.Text == "" || tbHoTenKH.Text == "" || tbCCCD.Text == "" || tbSDT.Text == "")
            {
                MessageBox.Show("Vui lòng Nhập đầy đủ dữ liệu", "Thông báo");
            }
            else
            {
                sqlCon.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "sp_CapNhatKhachHang";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlCon;
                    // khai báo các thông tin của tham số truyền vào
                    cmd.Parameters.Add("@TaiKhoan_KH", SqlDbType.VarChar).Value = tbTaiKhoan_KH.Text;
                    cmd.Parameters.Add("@MatKhau", SqlDbType.VarChar).Value = tbMatKhau.Text;
                    cmd.Parameters.Add("@HoTenKH", SqlDbType.NVarChar).Value = tbHoTenKH.Text;
                    cmd.Parameters.Add("@CCCD", SqlDbType.BigInt).Value = tbCCCD.Text;
                    cmd.Parameters.Add("@SDT", SqlDbType.BigInt).Value = tbSDT.Text;
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Cập nhật thành công", "Thông báo");
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message, "Thong bao");
                }
                sqlCon.Close();
                Load_AllDataGV();
            }           
        }
        
        // XÓA KHÁCH HÀNG
        private void btnXoaKH_Click(object sender, EventArgs e)
        {
            if (tbTaiKhoan_KH.Text == "")
            {
                MessageBox.Show("Vui lòng Nhập đầy đủ dữ liệu", "Thông báo");
            }
            else
            {
                sqlCon.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "sp_XoaKhachHang";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlCon;
                    // khai báo các thông tin của tham số truyền vào
                    cmd.Parameters.Add("@TaiKhoan_KH", SqlDbType.VarChar).Value = tbTaiKhoan_KH.Text;
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Xóa thành công", "Thông báo");
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message, "Thong bao");
                }
                sqlCon.Close();
                Load_AllDataGV();
            }           
        }
        
        // THÊM HỢP ĐỒNG
        private void btnThemHopDong_Click(object sender, EventArgs e)
        {
            if (tbMaPhongTro_HDong.Text == "" || tbTaiKhoanKH_HDong.Text == "" || tbNgayKyHDong.Text == "" || tbNgayKTHDong.Text == "")
            {
                MessageBox.Show("Vui lòng Nhập đầy đủ dữ liệu", "Thông báo");
            }
            else
            {
                sqlCon.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "sp_ThemHopDong";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlCon;
                    // khai báo các thông tin của tham số truyền vào
                    cmd.Parameters.Add("@MaPhongTro", SqlDbType.VarChar).Value = tbMaPhongTro_HDong.Text;
                    cmd.Parameters.Add("@TaiKhoan_KH", SqlDbType.VarChar).Value = tbTaiKhoanKH_HDong.Text;
                    cmd.Parameters.Add("@NgayKyHD", SqlDbType.Date).Value = tbNgayKyHDong.Text;
                    cmd.Parameters.Add("@NgayKetThucHD", SqlDbType.Date).Value = tbNgayKTHDong.Text;
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Thêm thành công", "Thông báo");
                    tbMaPhongTro_HDong.Clear();
                    tbTaiKhoanKH_HDong.Clear();
                    tbNgayKyHDong.Clear();
                    tbNgayKTHDong.Clear();
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message, "Thong bao");
                }
                sqlCon.Close();
                Load_AllDataGV();
            }           
        }
        
        // CẬP NHẬT HỢP ĐỒNG
        private void btnCapNhatHopDong_Click(object sender, EventArgs e)
        {
            if (tbMaHopDong.Text == "" || tbNgayKyHDong.Text == "" || tbNgayKTHDong.Text == "")
            {
                MessageBox.Show("Vui lòng Nhập đầy đủ dữ liệu", "Thông báo");
            }
            else
            {
                sqlCon.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "sp_CapNhatHopDong";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlCon;
                    // khai báo các thông tin của tham số truyền vào
                    cmd.Parameters.Add("@MaHopDong", SqlDbType.VarChar).Value = tbMaHopDong.Text;
                    cmd.Parameters.Add("@NgayKyHD", SqlDbType.Date).Value = tbNgayKyHDong.Text;
                    cmd.Parameters.Add("@NgayKetThucHD", SqlDbType.Date).Value = tbNgayKTHDong.Text;
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Cập nhật thành công", "Thông báo");
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message, "Thong bao");
                }
                sqlCon.Close();
                Load_AllDataGV();
            }           
        }

        // THÊM KHÁCH THUÊ TRỌ
        private void btnThemKhachThue_Click(object sender, EventArgs e)
        {
            if (tbMaPhongTro_KThue.Text == "" || tbHoTen_KThue.Text == "" || tbCCCD_KThue.Text == "" || tbSDT_KThue.Text == "")
            {
                MessageBox.Show("Vui lòng Nhập đầy đủ dữ liệu", "Thông báo");
            }
            else
            {
                sqlCon.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "sp_ThemKhachThue";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlCon;
                    // khai báo các thông tin của tham số truyền vào
                    cmd.Parameters.Add("@MaPhongTro", SqlDbType.VarChar).Value = tbMaPhongTro_KThue.Text;
                    cmd.Parameters.Add("@HoTenKhachThue", SqlDbType.NVarChar).Value = tbHoTen_KThue.Text;
                    cmd.Parameters.Add("@CCCD", SqlDbType.BigInt).Value = tbCCCD_KThue.Text;
                    cmd.Parameters.Add("@SDT", SqlDbType.BigInt).Value = tbSDT_KThue.Text;
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Thêm thành công", "Thông báo");
                    tbMaPhongTro_KThue.Clear();
                    tbHoTen_KThue.Clear();
                    tbCCCD_KThue.Clear();
                    tbSDT_KThue.Clear();
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message, "Thong bao");
                }
                sqlCon.Close();
                Load_AllDataGV();
            }           
        }

        // CẬP NHẬT KHÁCH THUÊ TRỌ
        private void btnCapNhatKhachThue_Click(object sender, EventArgs e)
        {
            if (tbMaKhachThue.Text == "" || tbHoTen_KThue.Text == "" || tbCCCD_KThue.Text == "" || tbSDT_KThue.Text == "")
            {
                MessageBox.Show("Vui lòng Nhập đầy đủ dữ liệu", "Thông báo");
            }
            else
            {
                sqlCon.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "sp_CapNhatKhachThue";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlCon;
                    // khai báo các thông tin của tham số truyền vào
                    cmd.Parameters.Add("@MaKhachThue", SqlDbType.VarChar).Value = tbMaKhachThue.Text;
                    cmd.Parameters.Add("@HoTenKhachThue", SqlDbType.NVarChar).Value = tbHoTen_KThue.Text;
                    cmd.Parameters.Add("@CCCD", SqlDbType.BigInt).Value = tbCCCD_KThue.Text;
                    cmd.Parameters.Add("@SDT", SqlDbType.BigInt).Value = tbSDT_KThue.Text;
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Cập nhật thành công", "Thông báo");
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message, "Thong bao");
                }
                sqlCon.Close();
                Load_AllDataGV();
            }          
        }

        // XÓA KHÁCH THUÊ TRỌ
        private void btnXoaKhachThue_Click(object sender, EventArgs e)
        {
            if (tbMaKhachThue.Text == "")
            {
                MessageBox.Show("Vui lòng Nhập đầy đủ dữ liệu", "Thông báo");
            }
            else
            {
                sqlCon.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "sp_XoaKhachThue";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlCon;
                    // khai báo các thông tin của tham số truyền vào
                    cmd.Parameters.Add("@MaKhachThue", SqlDbType.VarChar).Value = tbMaKhachThue.Text;
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Xóa thành công", "Thông báo");
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message, "Thong bao");
                }
                sqlCon.Close();
                Load_AllDataGV();
            }           
        }

        // THÊM HÓA ĐƠN
        private void btnThemHoaDon_Click(object sender, EventArgs e)
        {
            if(tbMaPhongTro_HDon.Text == "" || tbNgayHoaDon.Text == ""|| tbTienDien.Text == ""|| tbTienNuoc.Text == "" || tbPhiDichVu.Text == "")
            {
                MessageBox.Show("Vui lòng Nhập đầy đủ dữ liệu", "Thông báo");
            }
            else
            {
                sqlCon.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "sp_ThemHoaDon";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlCon;
                    // khai báo các thông tin của tham số truyền vào
                    cmd.Parameters.Add("@MaPhongTro", SqlDbType.VarChar).Value = tbMaPhongTro_HDon.Text;
                    cmd.Parameters.Add("@NgayHoaDon", SqlDbType.Date).Value = tbNgayHoaDon.Text;
                    cmd.Parameters.Add("@TienDien", SqlDbType.Int).Value = tbTienDien.Text;
                    cmd.Parameters.Add("@TienNuoc", SqlDbType.Int).Value = tbTienNuoc.Text;
                    cmd.Parameters.Add("@PhiDichVu", SqlDbType.Int).Value = tbPhiDichVu.Text;
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Thêm thành công", "Thông báo");
                    tbMaPhongTro_HDon.Clear();
                    tbNgayHoaDon.Clear();
                    tbTienDien.Clear();
                    tbTienNuoc.Clear();
                    tbPhiDichVu.Clear();
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message, "Thong bao");
                }
                sqlCon.Close();
                Load_AllDataGV();
            }           
        }

        // CẬP NHẬT HÓA ĐƠN
        private void btnCapNhatHoaDon_Click(object sender, EventArgs e)
        {
            if (tbMaPhongTro_HDon.Text == "" || tbNgayHoaDon.Text == "" || tbTienDien.Text == "" || tbTienNuoc.Text == "" || tbPhiDichVu.Text == "")
            {
                MessageBox.Show("Vui lòng Nhập đầy đủ dữ liệu", "Thông báo");
            }
            else
            {
                sqlCon.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "sp_CapNhatHoaDon";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlCon;
                    // khai báo các thông tin của tham số truyền vào
                    cmd.Parameters.Add("@MaHoaDon", SqlDbType.VarChar).Value = tbMaHoaDon.Text;
                    cmd.Parameters.Add("@MaPhongTro", SqlDbType.VarChar).Value = tbMaPhongTro_HDon.Text;
                    cmd.Parameters.Add("@NgayHoaDon", SqlDbType.Date).Value = tbNgayHoaDon.Text;
                    cmd.Parameters.Add("@TienDien", SqlDbType.Int).Value = tbTienDien.Text;
                    cmd.Parameters.Add("@TienNuoc", SqlDbType.Int).Value = tbTienNuoc.Text;
                    cmd.Parameters.Add("@PhiDichVu", SqlDbType.Int).Value = tbPhiDichVu.Text;
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Cập nhật thành công", "Thông báo");
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message, "Thong bao");
                }
                sqlCon.Close();
                Load_AllDataGV();
            }            
        }

        // XÓA HÓA ĐƠN
        private void btnXoaHoaDon_Click(object sender, EventArgs e)
        {
            if (tbMaHoaDon.Text == "")
            {
                MessageBox.Show("Vui lòng Nhập đầy đủ dữ liệu", "Thông báo");
            }
            else
            {
                sqlCon.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "sp_XoaHoaDon";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlCon;
                    // khai báo các thông tin của tham số truyền vào
                    cmd.Parameters.Add("@MaHoaDon", SqlDbType.VarChar).Value = tbMaHoaDon.Text;
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Xóa thành công", "Thông báo");
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message, "Thong bao");
                }
                sqlCon.Close();
                Load_AllDataGV();
            }           
        }
        
        // THANH TOÁN HÓA ĐƠN
        private void btnThanhToan_Click(object sender, EventArgs e)
        {
            if (tbMaHoaDon.Text == "")
            {
                MessageBox.Show("Vui lòng Nhập đầy đủ dữ liệu", "Thông báo");
            }
            else
            {
                sqlCon.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "sp_ThanhToanHoaDon";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlCon;
                    // khai báo các thông tin của tham số truyền vào
                    cmd.Parameters.Add("@MaHoaDon", SqlDbType.VarChar).Value = tbMaHoaDon.Text;
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Thanh Toán thành công", "Thông báo");
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message, "Thong bao");
                }
                sqlCon.Close();
                Load_AllDataGV();
            }            
        }

        // Đăng xuất
        private void btnDangXuat_Click(object sender, EventArgs e)
        {
            Login loginform = new Login();
            loginform.Show();
            this.Hide();
        }
    }
}
