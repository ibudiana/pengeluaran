import 'dart:io';
import 'package:pengeluaran/pengeluaran.dart';
import 'package:intl/intl.dart';

class App {
  static final pengeluaran = Pengeluaran();

  T inputUser<T>(String perintah) {
    while (true) {
      stdout.write(perintah);
      String? input = stdin.readLineSync();

      if (input == null || input.trim().isEmpty) {
        print("Input tidak boleh kosong. Coba lagi.");
        continue;
      }

      if (T == int) {
        if (RegExp(r'^\d+$').hasMatch(input)) {
          return int.parse(input) as T;
        } else {
          print("Input harus berupa angka bulat. Coba lagi.");
          continue;
        }
      } else if (T == double) {
        if (RegExp(r'^\d+(\.\d+)?$').hasMatch(input)) {
          return double.parse(input) as T;
        } else {
          print("Input harus berupa angka desimal. Coba lagi.");
          continue;
        }
      } else {
        return input as T;
      }
    }
  }

  void menuUtama() {
    print('=====CATAT PENGELUARAN=======');
    print("1. Tambah Pengeluaran");
    print("2. Lihat Semua Pengeluaran");
    print("3. Tambah Kategori Pengeluaran");
    print("4. Lihat Jumlah Pengeluaran Berdasarkan Jumlah Hari");
    print("0. Keluar");
    print('=============================');
    stdout.write("Pilih opsi: ");
  }

  void menuTambahKategori() {
    print('=====KATEGORI PENGELUARAN=====');
    String kategori = inputUser<String>("Masukan nama kategori : ");
    if (pengeluaran.cekKategori(kategori)) {
      print("Kategori '$kategori' sudah ada. Tidak bisa ditambahkan.");
    } else {
      pengeluaran.tambahKategori(kategori);
      print("Kategori '$kategori' berhasil ditambahkan!");
    }
  }

  void menuTambahPengeluaran() {
    print('=====CATAT PENGELUARAN=======');
    List daftarKategori = pengeluaran.tampilkanKategori();
    for (var i = 0; i < daftarKategori.length; i++) {
      print("${i + 1}. ${daftarKategori[i]}");
    }
    print("0. Tambah Kategori Pengeluaran");

    int pilihanKategori = inputUser<int>("Pilih kategori : ");

    if (pilihanKategori == 0) {
      menuTambahKategori();
      pilihanKategori = pengeluaran.tampilkanKategori().length;
    }

    if (pilihanKategori > pengeluaran.tampilkanKategori().length) {
      print("Kategori tidak ditemukan");
      return;
    }

    double nominal = inputUser<double>("Nominal: ");
    String catatan =
        inputUser<String>("Masukan Catatan Jika Tidak Ada tulis - : ");
    int day = inputUser<int>(
        "Masukkan angka untuk tanggal (misal, hari ini: 0, kemarin: 1 dst) : ");

    pengeluaran.tambahPengeluaran(
        pengeluaran.pilihKategori(pilihanKategori - 1), nominal, catatan,
        tanggal: DateTime.now().subtract(Duration(days: day.abs())));
  }

  void menuLihatSemuaPengeluaran() {
    int lebarKolom = 15;
    print("=== Riwayat Pengeluaran ===");

    print(
        '${"Kategori".padRight(lebarKolom)} | Rp. ${"Nominal".padRight(lebarKolom)} | ${"Catatan".padRight(lebarKolom * 2)} | ${"Tanggal".padRight(lebarKolom)}');
    var daftarPengeluaran = pengeluaran.tampilkanPengeluaran();
    print(
        '=======================================================================================');

    // **Cek apakah daftar pengeluaran kosong**
    if (daftarPengeluaran.isEmpty) {
      print('Belum ada pengeluaran yang tercatat.');
    } else {
      for (var pengeluaran in daftarPengeluaran) {
        String nominal =
            NumberFormat("#,###.00", "id_ID").format(pengeluaran["nominal"]);
        print(
            '${pengeluaran["kategori"].padRight(lebarKolom)} | Rp. ${nominal.padRight(lebarKolom)} | ${pengeluaran["catatan"].padRight(lebarKolom * 2)} | ${pengeluaran["tanggal"].toString().split(' ')[0].padRight(lebarKolom)}');
      }
    }

    print(
        '=======================================================================================');
  }

  void menuLihatPengeluaranBerdasarkanHari() {
    int day = inputUser<int>("Masukan jumlah hari : ");
    double jumlahPengeluaran = pengeluaran.laporanPengeluaran(day);

    print("=== Riwayat Pengeluaran $day Hari Sebelumnya===");
    if (jumlahPengeluaran == 0) {
      print("Belum ada pengeluaran dalam $day hari terakhir.");
    } else {
      String totalPengeluaran =
          NumberFormat("#,###.00", "id_ID").format(jumlahPengeluaran);
      print('Rp. $totalPengeluaran');
    }
  }

  void run() {
    bool loop = true;
    while (loop) {
      menuUtama();

      var pilihan = stdin.readLineSync();
      print("\n");

      if (pilihan == '1') {
        menuTambahPengeluaran();
        print("\n");
      } else if (pilihan == '2') {
        menuLihatSemuaPengeluaran();
        print("\n");
      } else if (pilihan == '3') {
        menuTambahKategori();
        print("\n");
      } else if (pilihan == '4') {
        menuLihatPengeluaranBerdasarkanHari();
        print("\n");
      } else if (pilihan == '0') {
        print("========================================");
        print("Terima kasih telah menggunakan aplikasi!");
        print("========================================");
        loop = false;
      } else {
        print("Pilihan anda tidak valid");
      }
    }
  }
}
