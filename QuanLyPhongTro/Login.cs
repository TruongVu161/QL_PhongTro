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
    public partial class Login : Form
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source = LAPTOP-3CDTQULM\TRUONGVU;Initial Catalog = QuanLyPhongTro; Integrated Security = True");

        public static string userName = "";
        public Login()
        {
            InitializeComponent();
        }

        // Radio Button Hiển thị mật khẩu
        private void chbCheckShow_CheckedChanged(object sender, EventArgs e)
        {
            if (chbCheckShow.Checked)
            {
                tbMatKhau.PasswordChar = (char)0;
            }
            else
            {
                tbMatKhau.PasswordChar = '*';
            }
        }

        // Đăng nhập
        private void btnDangnhap_Click(object sender, EventArgs e)
        {
            if (tbTaiKhoan.Text == "" || tbMatKhau.Text == "")
            {
                MessageBox.Show("Tài khoản hoặc Mật khẩu còn trống", "Thông báo");
            }
            else
            {
                sqlCon.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "sp_DangNhap";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlCon;
                    // khai báo các thông tin của tham số truyền vào
                    cmd.Parameters.Add("@TaiKhoan_KH", SqlDbType.VarChar).Value = tbTaiKhoan.Text;
                    cmd.Parameters.Add("@MatKhau", SqlDbType.VarChar).Value = tbMatKhau.Text;
                    cmd.ExecuteNonQuery();
                    userName = tbTaiKhoan.Text;
                    object kq = cmd.ExecuteScalar();
                    int code = Convert.ToInt32(kq);
                    if (code == 0)
                    {
                        MessageBox.Show("Chào mừng Admin đăng nhập", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Admin adminform = new Admin();
                        adminform.Show();
                        this.Hide();
                    }
                    else if (code == 1)
                    {
                        MessageBox.Show("Chào mừng Khách hàng đăng nhập", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        KhachHang khachHangform = new KhachHang(userName);
                        khachHangform.Show();
                        this.Hide();
                        
                    }
                    else
                    {
                        MessageBox.Show("Tài khoản hoặc Mật khẩu sai", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        tbTaiKhoan.Text = "";
                        tbMatKhau.Text = "";
                        tbTaiKhoan.Focus();
                    }
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message, "Thong bao");
                }
                sqlCon.Close();
            }
        }

        // Đăng ký
        private void btnDangKy_Click(object sender, EventArgs e)
        {
            if (tbTaiKhoan_DK.Text == "" || tbMatKhau_DK.Text == "" || tbHoTen.Text == "" || tbCCCD.Text == "" || tbSDT.Text == "")
            {
                MessageBox.Show("Vui lòng Nhập đầy đủ dữ liệu", "Thông báo");
            }
            else
            {
                sqlCon.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "sp_ThemKhachHang";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlCon;
                    // khai báo các thông tin của tham số truyền vào
                    cmd.Parameters.Add("@TaiKhoan_KH", SqlDbType.VarChar).Value = tbTaiKhoan_DK.Text;
                    cmd.Parameters.Add("@MatKhau", SqlDbType.VarChar).Value = tbMatKhau_DK.Text;
                    cmd.Parameters.Add("@HoTenKH", SqlDbType.NVarChar).Value = tbHoTen.Text;
                    cmd.Parameters.Add("@CCCD", SqlDbType.BigInt).Value = tbCCCD.Text;
                    cmd.Parameters.Add("@SDT", SqlDbType.BigInt).Value = tbSDT.Text;
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Đăng ký thành công", "Thông báo");
                    tbTaiKhoan_DK.Clear();
                    tbMatKhau_DK.Clear();
                    tbHoTen.Clear();
                    tbCCCD.Clear();
                    tbSDT.Clear();
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message, "Thong bao");
                }
                sqlCon.Close();
            }
        }
    }
}
