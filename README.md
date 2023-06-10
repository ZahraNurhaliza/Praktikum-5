# Praktikum-5

## SCRIPT SQL

1. script Mahasiswa
```python
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
```
![image](https://github.com/ZahraNurhaliza/Praktikum-5/blob/main/screenshot/Mahasiswa.png)


2. script Dosen 
```python
create table Dosen (
  kd_ds varchar(10) primary key,
  nama varchar(50) not null
);
insert into Dosen (kd_ds, nama) values
('DS001', 'Nofal Arianto'),
('DS002', 'Ario Talib'),
('DS003', 'Ayu Rahmadina'),
('DS004', 'Ratna Kumala'),
('DS005', 'Vika Prasetyo');
select * from Dosen;
```
![image](https://github.com/ZahraNurhaliza/Praktikum-5/blob/main/screenshot/Dosen.png)


3. script MataKuliah
```python
create table MataKuliah (
  kd_mk varchar(10) not null,
  nama varchar(50) not null,
  sks varchar(5) not null
);
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
```
![image](https://github.com/ZahraNurhaliza/Praktikum-5/blob/main/screenshot/MataKuliah.png)


4. script JadwalKuliah
```python
create table JadwalMengajar (
  kd_ds varchar(10) not null,
  kd_mk varchar(10) not null,
  hari enum('Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu') not null,
  jam time not null,
  ruang varchar(20) not null,
  primary key (kd_ds, kd_mk, hari, jam)
);
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
```
![image](https://github.com/ZahraNurhaliza/Praktikum-5/blob/main/screenshot/JadwalKuliah.png)

5. script KRSMahasiswa
```python
create table KRSMahasiswa (
  nim varchar(10) not null,
  kd_mk varchar(10) not null,
  kd_ds varchar(10) not null,
  semester varchar(10) not null,
  nilai varchar(10) not null,
  primary key (nim, kd_mk)
);
insert into KRSMahasiswa (nim, kd_mk, kd_ds, semester, nilai) values
('1823456', 'MK001', 'DS002', '3', 'NULL'),
('1823456', 'MK002', 'DS002', '1', 'NULL'),
('1823456', 'MK003', 'DS001', '3', 'NULL'),
('1823456', 'MK004', 'DS001', '3', 'NULL'),
('1823456', 'MK007', 'DS005', '3', 'NULL'),
('1823456', 'MK008', 'DS005', '3', 'NULL');
select * from KRSMahasiswa;
```
![image](https://github.com/ZahraNurhaliza/Praktikum-5/blob/main/screenshot/KRSMahasiswa.png)


### Latihan

1. Lakukan join table Mahasiswa dan Dosen
 • srip (INNER JOIN)
```python
select Mahasiswa.nim, Mahasiswa.nama, Mahasiswa.jenis_kelamin, Dosen.nama as "Dosen PA"
from Mahasiswa inner join Dosen on Dosen.kd_ds = Mahasiswa.kd_ds;
```
![image](https://github.com/ZahraNurhaliza/Praktikum-5/blob/main/screenshot/Latihan.1.png)


 • script (LEFT JOIN)
```python
select Mahasiswa.nim, Mahasiswa.nama, Mahasiswa.jenis_kelamin, Dosen.nama as "Dosen PA"
from Mahasiswa left join Dosen on Dosen.kd_ds = Mahasiswa.kd_ds;
```
![image](https://github.com/ZahraNurhaliza/Praktikum-5/blob/main/screenshot/Latihan.2.png)


2. Lakukan join tabel Matakuliah dan Dosen
 • script (LEFT JOIN)
```python
select Matakuliah.kd_mk, Matakuliah.nama, Matakuliah.sks, Dosen.nama as "Dosen Pengampu"
from JadwalMengajar
left join Matakuliah on JadwalMengajar.kd_mk = Matakuliah.kd_mk
left join Dosen on JadwalMengajar.kd_ds = Dosen.kd_ds;
```
![image](https://github.com/ZahraNurhaliza/Praktikum-5/blob/main/screenshot/Latihan.3.png)


3. Lakukan join table JadwalMengajar, Dosen, dan Matakuluan
 • script (LEFT JOIN)
```python
select Matakuliah.kd_mk, Matakuliah.nama, Matakuliah.sks, Dosen.nama as "Dosen Pengampu", JadwalMengajar.hari, JadwalMengajar.jam, JadwalMengajar.ruang
from JadwalMengajar
left join Matakuliah on JadwalMengajar.kd_mk = Matakuliah.kd_mk
left join Dosen on JadwalMengajar.kd_ds = Dosen.kd_ds;
```
![image](https://github.com/ZahraNurhaliza/Praktikum-5/blob/main/screenshot/Latihan.4.png)


4. Lakukan join tabel KrsMahasiswa, Mahasiswa, Matakuliah, dan Dosen
 • script (LEFT JOIN)
 ```python
 select Mahasiswa.nim, Mahasiswa.nama as "nama", Dosen.nama as "Dosen PA", Matakuliah.nama as "Matakuliah", Matakuliah.sks, Dosen.nama as "Dosen Pengampu"
from KRSMahasiswa
join Mahasiswa on KRSMahasiswa.nim = Mahasiswa.nim
join Matakuliah on KRSMahasiswa.kd_mk = Matakuliah.kd_mk
join Dosen on KRSMahasiswa.kd_ds = Dosen.kd_ds;
```
![image](https://github.com/ZahraNurhaliza/Praktikum-5/blob/main/screenshot/Latihan.5.png)
