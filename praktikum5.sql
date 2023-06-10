create database praktikum5;
use praktikum5;
drop database praktikum5;

create table Dosen (
  kd_ds varchar(10) primary key,
  nama varchar(50) not null
);

create table Mahasiswa (
  nim varchar(10) not null primary key,
  nama varchar(50) not null,
  jenis_kelamin enum('Laki-laki', 'Perempuan') not null,
  tgl_lahir date not null,
  jalan varchar(100) default null,
  kota varchar(50) default null,
  kodepos varchar(10) default null,
  no_hp varchar(20) default null,
  kd_ds varchar(10) default null
);

create table MataKuliah (
  kd_mk varchar(10) not null,
  nama varchar(50) not null,
  sks varchar(5) not null
);

create table JadwalMengajar (
  kd_ds varchar(10) not null,
  kd_mk varchar(10) not null,
  hari enum('Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu') not null,
  jam time not null,
  ruang varchar(20) not null,
  primary key (kd_ds, kd_mk, hari, jam)
);

create table KRSMahasiswa (
  nim varchar(10) not null,
  kd_mk varchar(10) not null,
  kd_ds varchar(10) not null,
  semester varchar(10) not null,
  nilai varchar(10) not null,
  primary key (nim, kd_mk)
);

insert into Dosen (kd_ds, nama) values
('DS001', 'Nofal Arianto'),
('DS002', 'Ario Talib'),
('DS003', 'Ayu Rahmadina'),
('DS004', 'Ratna Kumala'),
('DS005', 'Vika Prasetyo');
select * from Dosen;



insert into Mahasiswa (nim, nama, jenis_kelamin, tgl_lahir, jalan, kota, kodepos, no_hp, kd_ds) values
('1812345', 'Ari Santoso', 'Laki-laki', '1999-10-11', 'NULL', 'Bekasi', 'NULL', 'NULL', 'DS002'),
('1823456', 'Dina Marlina', 'Perempuan', '1998-11-20', 'NULL', 'Jakarta', 'NULL', 'NULL', 'NULL'),
('1834567', 'Rahmat Hidayat', 'Laki-laki', '1999-05-10', 'NULL', 'Bekasi', 'NULL', 'NULL', 'NULL'),
('1845678', 'Jaka Sampurna', 'Laki-laki', '2000-10-19', 'NULL', 'Cikarang', 'NULL', 'NULL', 'NULL'),
('1856789', 'Tia Lestari', 'Perempuan', '1999-02-15', 'NULL', 'Karawang', 'NULL', 'NULL', 'NULL'),
('1867890', 'Anton Sinaga', 'Laki-laki', '1998-06-22', 'NULL', 'Bekasi', 'NULL', 'NULL', 'NULL'),
('1912345', 'Listia Nastiti', 'Perempuan', '2001-10-23', 'NULL', 'Jakarta', 'NULL', 'NULL', 'NULL'),
('1923456', 'Amira Jarisa', 'Perempuan', '2001-01-24', 'NULL', 'Karawang', 'NULL', 'NULL', 'DS004'),
('1934567', 'Laksana Mardito', 'Laki-laki', '1999-04-14', 'NULL', 'Cikarang', 'NULL', 'NULL', 'NULL'),
('1945678', 'Jura Marsina', 'Perempuan', '2000-05-10', 'NULL', 'Cikarang', 'NULL', 'NULL', 'NULL'),
('1956789', 'Dadi Martani', 'Laki-laki', '2001-08-29', 'NULL', 'Bekasi', 'NULL', 'NULL', 'DS005'),
('1967890', 'Bayu Laksono', 'Laki-laki', '1999-07-22', 'NULL', 'Cikarang', 'NULL', 'NULL', 'DS004');
select * from Mahasiswa;

insert into MataKuliah (kd_mk, nama, sks) values
('MK001', 'Algoritma Dan Pemrogaman', '3'),
('MK002', 'Praktikum Algoritma Dan Pemrograman', '1'),
('MK003', 'Teknologi Basis Data', '3'),
('MK004', 'Praktikum Teknologi Basis Data', '1'),
('MK005', 'Pemrograman Dasar', '3'),
('MK006', 'Pemrograman Berorientasi Objek', '3'),
('MK007', 'Struktur Data', '3'),
('MK008', 'Arsitektur Komputer', '2');
select * from MataKuliah;

insert into JadwalMengajar (kd_mk, kd_ds, hari, jam, ruang) values
('MK001', 'DS002', 'Senin', '10:00:00', '102'),
('MK002', 'DS002', 'Senin', '13:00:00', 'Lab.01'),
('MK003', 'DS001', 'Selasa', '08:00:00', '201'),
('MK004', 'DS001', 'Rabu', '10:00:00', 'Lab.02'),
('MK005', 'DS003', 'Selasa', '10:00:00', 'Lab.01'),
('MK006', 'DS004', 'Kamis', '09:00:00', 'Lab.03'),
('MK007', 'DS005', 'Rabu', '08:00:00', '102'),
('MK008', 'DS005', 'Kamis', '13:00:00', '201');
select * from JadwalMengajar;

insert into KRSMahasiswa (nim, kd_mk, kd_ds, semester, nilai) values
('1823456', 'MK001', 'DS002', '3', 'NULL'),
('1823456', 'MK002', 'DS002', '1', 'NULL'),
('1823456', 'MK003', 'DS001', '3', 'NULL'),
('1823456', 'MK004', 'DS001', '3', 'NULL'),
('1823456', 'MK007', 'DS005', '3', 'NULL'),
('1823456', 'MK008', 'DS005', '3', 'NULL');
select * from KRSMahasiswa;

select Mahasiswa.nim, Mahasiswa.nama, Mahasiswa.jenis_kelamin, Dosen.nama as "Dosen PA"
from Mahasiswa inner join Dosen on Dosen.kd_ds = Mahasiswa.kd_ds;

select Mahasiswa.nim, Mahasiswa.nama, Mahasiswa.jenis_kelamin, Dosen.nama as "Dosen PA"
from Mahasiswa left join Dosen on Dosen.kd_ds = Mahasiswa.kd_ds;

select Matakuliah.kd_mk, Matakuliah.nama, Matakuliah.sks, Dosen.nama as "Dosen Pengampu"
from JadwalMengajar
left join Matakuliah on JadwalMengajar.kd_mk = Matakuliah.kd_mk
left join Dosen on JadwalMengajar.kd_ds = Dosen.kd_ds;

select Matakuliah.kd_mk, Matakuliah.nama, Matakuliah.sks, Dosen.nama as "Dosen Pengampu", JadwalMengajar.hari, JadwalMengajar.jam, JadwalMengajar.ruang
from JadwalMengajar
left join Matakuliah on JadwalMengajar.kd_mk = Matakuliah.kd_mk
left join Dosen on JadwalMengajar.kd_ds = Dosen.kd_ds;

select Mahasiswa.nim, Mahasiswa.nama as "nama", Dosen.nama as "Dosen PA", Matakuliah.nama as "Matakuliah", Matakuliah.sks, Dosen.nama as "Dosen Pengampu"
from KRSMahasiswa
join Mahasiswa on KRSMahasiswa.nim = Mahasiswa.nim
join Matakuliah on KRSMahasiswa.kd_mk = Matakuliah.kd_mk
join Dosen on KRSMahasiswa.kd_ds = Dosen.kd_ds;
