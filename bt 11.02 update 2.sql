
create table phuongTienNguoiDung(
maNguoiDung int,
maPhuongTien varchar(255),
maLoaiXe varchar(255),
maHangXe varchar(255),
bienSoXe varchar(255),
primary key (bienSoXe));
INSERT INTO phuongTienNguoiDung (maNguoiDung, maPhuongTien, maLoaiXe, maHangXe, bienSoXe)
VALUES (2, 'PT1', 'XM', 'HD', '99K1 23456'), (3, 'PT2', 'XM', 'HD', '98S1 23545'), (3, 'PT3', 'XM', 'HD', '29K1 23466'),
(6, 'PT1', 'XM', 'YAM', '29K1 33466');
select * FROM phuongTienNguoiDung;
create table thongTinNguoiDung (
maNguoiDung int,
tenNguoiDung varchar(255),
anhDaiDien varchar(255),
SDT int,
email varchar(255),
maGioiTinh varchar(255),
ngaySinh datetime,
maXa varchar(255),
diaChiChiTiet varchar(255),
primary key (maNguoiDung));
insert into thongTinNguoiDung ( maNguoiDung, tenNguoiDung, anhDaiDien, SDT, email, maGioiTinh, ngaySinh, maXa, diaChiChiTiet)
values (2, 'Giáp Phượng', 'avt1', 01111111, 'phuonggt1@gmail.com', 'GT1', '1999-08-15', 'TL', 'Hà Thượng'),
(3, 'Giáp Lý', 'avt2', 02222222, 'lygt1@gmail.com', 'GT1', '1997-08-15', 'VT', 'Chàng'),
(4, 'Nguyễn An', 'avt3', 0444444, 'ann1@gmail.com', 'GT2', '1996-09-15', 'HL', 'Hoàng Liệt 2'),
(6, 'Nguyễn Bình', 'avt6', 0666666, 'binhnv1@gmail.com', 'GT2', '1997-08-20', 'MT', 'Phạm Hùng'),
(7, 'Nguyễn Mai', 'avt7', 0777777, 'chanh@gmail.com', 'GT2', '1998-09-15', 'HL', 'Linh Đàm');
SeLect * from thongTinNguoiDung;

CREATE TABLE gioiTinh (
maGioiTinh varchar(255),
tenGioiTinh varchar(255),
primary key (maGioiTinh));
insert into gioiTinh (maGioiTinh, tenGioiTinh)
values ('GT1', 'Nữ') , ('GT2', 'Nam'), ('GT3', 'không xác định');
SeLect * from gioiTinh;

create table thongtinTK (
maNguoiDung int, 
maQuyen varchar(255), 
ngayTao datetime, 
ngayCapNhatCuoi datetime, 
bienSoXe varchar(255), 
maTrangThai varchar(255), 
maNguoiTao int, 
tenDangNhap varchar(255), 
matKhau varchar (255),
Primary Key (maNguoiDung));
INSERT INTO thongtinTK (maNguoiDung , maQuyen , ngayTao , ngayCapNhatCuoi , bienSoXe, maTrangThai, maNguoiTao , tenDangNhap , matKhau)
VALUES (3, 'TX', '2022-03-02', '2023-02-01', '99K1 23456', 'on', 2, 'phuonggt1', 123456);
SELECT * FROM thongtinTK;
INSERT INTO thongtinTK (maNguoiDung , maQuyen , ngayTao , ngayCapNhatCuoi , bienSoXe, maTrangThai, maNguoiTao , tenDangNhap , matKhau)
VALUES (4, 'TX', '2022-01-02', '2023-01-15', '29K1 23466', 'on', 5, 'phuonggt2', 123457), 
(6, 'TX', '2021-02-02', '2023-02-15', '29K1 33466', 'on', 6, 'phuonggt3', 123458),
(7, 'KH', '2021-05-02', '2023-01-05', '29K1 24466', 'on', 7, 'phuonggt4', 133457);
SELECT * FROM thongtinTK;

SELECT thongTinNguoiDung.tenNguoiDung,thongTinNguoiDung.ngaySinh, thongTinNguoiDung.SDT, thongTinNguoiDung.diaChiChiTiet, quyenNguoiDung.tenQuyen from thongTinNguoiDung
inner Join thongtinTK on thongTinNguoiDung.maNguoiDung = thongtinTK.maNguoiDung
inner Join quyenNguoiDung on quyenNguoiDung.maQuyen = thongtinTK.maQuyen
where tenQuyen = 'Tài Xế';

SELECT thongTinNguoiDung.tenNguoiDung, loaiXe.tenLoaiXe, hangXe.tenHangXe, thongTinPhuongTien.tenPhuongTien, phuongTienNguoiDung.bienSoXe
from phuongTienNguoiDung inner Join thongTinNguoiDung on phuongTienNguoiDung.maNguoiDung = thongTinNguoiDung.maNguoiDung
inner Join loaiXe on phuongTienNguoiDung.maLoaiXe = loaiXe.maLoaiXe
inner Join hangXe on phuongTienNguoiDung.maHangXe =hangXe.maHangXe
inner Join thongTinPhuongTien on phuongTienNguoiDung.maPhuongTien = thongTinPhuongTien.maPhuongTien
Where thongTinNguoiDung.tenNguoiDung = 'Giáp Phượng';

select TINH.TENTINH, count(TINH.TENTINH) as soLuongXa from XA 
inner join HUYEN on XA.MAHUYEN = HUYEN.MAHUYEN
inner join TINH on TINH.MATINH = HUYEN.MATINH group by TINH.TENTINH order by soLuongXa desc limit 3;

Select thongTinNguoiDung.tenNguoiDung, thongTinNguoiDung.ngaySinh, thongtinTK.ngayCapNhatCuoi, trangThai.tenTrangThai, quyenNguoiDung.tenQuyen, thongtinTK.tenDangNhap, thongtinTK.matKhau, thongtinTK.bienSoXe from thongtinTK 
inner join thongTinNguoiDung on thongtinTK.maNguoiDung = thongTinNguoiDung.maNguoiDung 
inner join trangThai on thongtinTK.maTrangThai = trangThai.maTrangThai
inner join quyenNguoiDung on thongtinTK.maQuyen = quyenNguoiDung.maQuyen
where tenTrangThai = 'Ngưng hoạt động' and (curdate() - date(ngayCapNhatCuoi)) > 30