Aplikasi catat pengeluaran dengan command line. with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

Jalankan aplikasi dengan : 
```
dart run
```
Jalankan unit testing dengan : 
```
dart test
```

Contoh App Ketika Running
=============

```
-- Menjalankan APlikasi --
=====CATAT PENGELUARAN=======
1. Tambah Pengeluaran
2. Lihat Semua Pengeluaran
3. Tambah Kategori Pengeluaran
4. Lihat Jumlah Pengeluaran Berdasarkan Jumlah Hari
0. Keluar
=============================
Pilih opsi: 1


=====CATAT PENGELUARAN=======
1. tanpa kategori
2. makanan
3. transportasi
4. hiburan
0. Tambah Kategori Pengeluaran
Pilih kategori : 0
=====KATEGORI PENGELUARAN=====
Masukan nama kategori : minuman
Kategori 'minuman' berhasil ditambahkan!
Nominal: 125000
Masukan Catatan Jika Tidak Ada tulis - : -
Masukkan angka untuk tanggal (misal, hari ini: 0, kemarin: 1 dst) : 1


=====CATAT PENGELUARAN=======
1. Tambah Pengeluaran
2. Lihat Semua Pengeluaran
3. Tambah Kategori Pengeluaran
4. Lihat Jumlah Pengeluaran Berdasarkan Jumlah Hari
0. Keluar
=============================
Pilih opsi: 1


=====CATAT PENGELUARAN=======
1. tanpa kategori
2. makanan
3. transportasi
4. hiburan
5. minuman
0. Tambah Kategori Pengeluaran
Pilih kategori : 2
Nominal: 300000
Masukan Catatan Jika Tidak Ada tulis - : warung enak         
Masukkan angka untuk tanggal (misal, hari ini: 0, kemarin: 1 dst) : 0


=====CATAT PENGELUARAN=======
1. Tambah Pengeluaran
2. Lihat Semua Pengeluaran
3. Tambah Kategori Pengeluaran
4. Lihat Jumlah Pengeluaran Berdasarkan Jumlah Hari
0. Keluar
=============================
Pilih opsi: 2


=== Riwayat Pengeluaran ===
Kategori        | Rp. Nominal         | Catatan                        | Tanggal        
=======================================================================================
minuman         | Rp. 125.000,00      | -                              | 2025-02-15     
makanan         | Rp. 300.000,00      | warung enak                    | 2025-02-16     
=======================================================================================


=====CATAT PENGELUARAN=======
1. Tambah Pengeluaran
2. Lihat Semua Pengeluaran
3. Tambah Kategori Pengeluaran
4. Lihat Jumlah Pengeluaran Berdasarkan Jumlah Hari
0. Keluar
=============================
Pilih opsi: 4


Masukan jumlah hari : 1
=== Riwayat Pengeluaran 1 Hari Sebelumnya===
Rp. 300.000,00


=====CATAT PENGELUARAN=======
1. Tambah Pengeluaran
2. Lihat Semua Pengeluaran
3. Tambah Kategori Pengeluaran
4. Lihat Jumlah Pengeluaran Berdasarkan Jumlah Hari
0. Keluar
=============================
Pilih opsi: 4


Masukan jumlah hari : 2
=== Riwayat Pengeluaran 2 Hari Sebelumnya===
Rp. 425.000,00


=====CATAT PENGELUARAN=======
1. Tambah Pengeluaran
2. Lihat Semua Pengeluaran
3. Tambah Kategori Pengeluaran
4. Lihat Jumlah Pengeluaran Berdasarkan Jumlah Hari
0. Keluar
=============================
Pilih opsi: 0


========================================
Terima kasih telah menggunakan aplikasi!
========================================
```
