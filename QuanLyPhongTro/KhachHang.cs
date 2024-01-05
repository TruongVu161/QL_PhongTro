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
    public partial class KhachHang : Form
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source = LAPTOP-3CDTQULM\TRUONGVU;Initial Catalog = QuanLyPhongTro; Integrated Security = True");
        
        public KhachHang(String userName)
        {
            InitializeComponent();
            lbUserName.Text = userName;
        }

        // Hiển thị Danh sách phòng trống vào DataGridView
        private void DS_PhongTrong()
        {
            sqlCon.Open();
            string sql = "SELECT * FROM dbo.DS_PhongTrong()";
            SqlCommand com = new SqlCommand(sql, sqlCon);
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            sqlCon.Close();
            dgvDSPhongTrong.DataSource = dt;
        }

        // Load Danh sách phòng trống lên DataGridView
        private void Load_dtgDSPhongTrong()
        {
            DS_PhongTrong();
            // Căn chỉnh Header và Width của DataGridView
            dgvDSPhongTrong.Columns[0].HeaderText = "Mã phòng trọ";
            dgvDSPhongTrong.Columns[1].HeaderText = "Tòa nhà";
            dgvDSPhongTrong.Columns[2].HeaderText = "Tầng";
            dgvDSPhongTrong.Columns[3].HeaderText = "Phòng số";
            dgvDSPhongTrong.Columns[4].HeaderText = "Giá thuê";
            dgvDSPhongTrong.Columns[5].HeaderText = "Số lượng Max";
            dgvDSPhongTrong.Columns[6].HeaderText = "Mô tả";
            dgvDSPhongTrong.Columns[6].Width = 300;
        }

        //Hiển thị Danh sách khách thuê trong phòng vào TextBox
        private void ChiTietPhong(string ds)
        {
            
            sqlCon.Open();
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.fu_ChiTietPhong(@TaiKhoan_KH)", sqlCon);
            cmd.Parameters.AddWithValue("@TaiKhoan_KH", ds);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            sqlCon.Close();
            if (dt.Rows.Count > 0)
            {
                tbMaPhongTro.Text = dt.Rows[0]["MaPhongTro"].ToString().Trim();
                tbToaNha.Text = dt.Rows[0]["ToaNha"].ToString().Trim();
                tbTang.Text = dt.Rows[0]["Tang"].ToString().Trim();
                tbPhongSo.Text = dt.Rows[0]["PhongSo"].ToString().Trim();
                tbGiaThue.Text = dt.Rows[0]["GiaThue"].ToString().Trim();
                tbSLMax.Text = dt.Rows[0]["SoLuongMAX"].ToString().Trim();
                tbMoTa.Text = dt.Rows[0]["MoTaPhong"].ToString().Trim();
            }
            else
            {
                MessageBox.Show("Bạn chưa thuê phòng", "Thông báo!");
            }
        }

        // Load Danh sách khách thuê trong phòng lên DataGridView
        private void Load_ChiTietPhong()
        {
            ChiTietPhong(lbUserName.Text);          
        }

        //Hiển thị Danh sách khách thuê trong phòng vào DataGridView
        private void DS_KhachThue_Phong(string ds)
        {
            sqlCon.Open();
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.fu_DSKhachThue_Phong(@TaiKhoan_KH)", sqlCon);
            cmd.Parameters.AddWithValue("@TaiKhoan_KH", ds);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            sqlCon.Close();
            dgvDSKhachThuePhong.DataSource = dt;
        }

        // Load Danh sách khách thuê trong phòng lên DataGridView
        private void Load_dgvDSKhachThuePhong()
        {
            DS_KhachThue_Phong(lbUserName.Text);
            // Căn chỉnh Header và Width của DataGridView
            dgvDSKhachThuePhong.Columns[0].HeaderText = "Mã Khách thuê";
            dgvDSKhachThuePhong.Columns[1].HeaderText = "Họ tên";
            dgvDSKhachThuePhong.Columns[2].HeaderText = "CCCD";
            dgvDSKhachThuePhong.Columns[3].HeaderText = "SDT";
        }

        //Hiển thị Danh sách khách thuê trong phòng vào DataGridView
        private void DS_HoaDon_Phong(string ds)
        {
            sqlCon.Open();
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.fu_DSHoaDon_Phong(@TaiKhoan_KH)", sqlCon);
            cmd.Parameters.AddWithValue("@TaiKhoan_KH", ds);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            sqlCon.Close();
            dgvDSHoaDonPhong.DataSource = dt;
        }

        // Load Danh sách khách thuê trong phòng lên DataGridView
        private void Load_dgvDSHoaDonPhong()
        {
            DS_HoaDon_Phong(lbUserName.Text);
            // Căn chỉnh Header và Width của DataGridView
            dgvDSKhachThuePhong.Columns[0].HeaderText = "Mã Khách thuê";
            dgvDSKhachThuePhong.Columns[1].HeaderText = "Họ tên";
            dgvDSKhachThuePhong.Columns[2].HeaderText = "CCCD";
            dgvDSKhachThuePhong.Columns[3].HeaderText = "SDT";
        }

        // Load dữ liệu ra DataGridView lúc đầu
        private void KhachHang_Load(object sender, EventArgs e)
        {
            Load_dtgDSPhongTrong();           
            Load_dgvDSKhachThuePhong();
            Load_dgvDSHoaDonPhong();
        }

        // Đăng xuất
        private void btnDangXuat_Click(object sender, EventArgs e)
        {
            Login loginform = new Login();
            loginform.Show();
            this.Hide();
        }

        private void tabControl1_Click(object sender, EventArgs e)
        {
            Load_ChiTietPhong();
        }
    }
}
