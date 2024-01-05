# PHẦN MỀM QUẢN LÝ PHÒNG TRỌ
## Giới thiệu phần mềm
### * Khách thuê
#### - Xem thông tin phòng trống: Khách thuê xem chi tiết phòng trọ mà mình thấy phù hợp trên danh sách phòng trọ có thể thuê (phòng trống).
#### - Xem chi tiết thuê phòng: Khách thuê xem chi tiết các thông tin liên quan đến phòng đã thuê như thông tin hợp đồng thuê, thông tin của phòng mình đang thuê, danh sách các thành viên trong phòng (người ở cùng với Khách hàng).
#### - Xem hóa đơn tiền trọ: Khách thuê xem chi tiết hóa đơn của phòng trọ sẽ phải thanh toán cho chủ trọ.
### * Chủ trọ
#### - Thêm phòng trọ: Chủ trọ chọn thêm phòng trọ trên phần mềm. Hệ thống sẽ tiến hành thêm phòng mới, với các thông tin cụ thể như sau: số tầng, số phòng, trạng thái, giá cả, địa chỉ..
#### - Xóa phòng trọ: Hệ thống sẽ tiến hành xóa phòng theo thông tin của người dùng nhập vào.
#### - Lập hợp đồng thuê trọ: Chủ trọ lập hợp đồng thuê cho khách thuê phòng trọ. Hệ thống sẽ tiến hành thêm hợp đồng mới, với các thông tin cụ thể như sau: mã khách hàng, mã phòng, ngày lập hợp đồng,...
#### - Thêm khách thuê: Chủ trọ cần thêm khách thuê trọ vào phòng trọ. Hệ thống sẽ lưu thông tin khách hàng vào CSDL thông qua dữ liệu mà người dùng nhập vào.
#### - Xóa khách thuê: Hệ thống sẽ tìm ra thông tin khách hàng cần xóa trùng với dữ liệu người dùng và tiến hành thao tác xóa khách hàng đó ra khỏi dữ liệu hệ thống.
#### - Tạo hóa đơn: Chủ trọ tạo hóa đơn thanh toán tiền trọ khi đến thời hạn đóng tiền thuê trọ.
#### - Thanh toán hóa đơn: Chủ trọ cần thanh toán hóa đơn cho phòng trọ khi đến tháng thanh toán. Hệ thống sẽ tìm và thanh toán hóa đơn theo yêu cầu của chủ trọ.
#### - Trả phòng: Khi khách thuê cần trả phòng, không thuê nữa thì sẽ báo cho chủ trọ, chủ trọ tiến hành chọn phòng cần trả, hệ thống sẽ xóa các thông tin liên quan đến phòng cần trả và đặt phòng đó thành phòng trống để cho các khách thuê khác có thể thuê. 
## Xây dựng phần mềm
#### Công nghệ lập trình: Windows Forms C#
#### Công cụ lập trình: Visual Studio
#### Cơ sở dữ liệu: MySQL
#### Ngôn ngữ lập trình: C Sharp (C#), Transact-SQL (T-SQL)
