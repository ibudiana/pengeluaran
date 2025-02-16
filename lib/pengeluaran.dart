class Pengeluaran {
  final List<Map<String, dynamic>> _daftarPengeluaran = [];
  final List<String> _listKategori = [
    'tanpa kategori',
    'makanan',
    'transportasi',
    'hiburan'
  ];

  bool cekKategori(String kategori) {
    return _listKategori
        .any((item) => item.toLowerCase() == kategori.toLowerCase());
  }

  void tambahKategori(String kategori) {
    _listKategori.add(kategori.toLowerCase());
  }

  void tambahPengeluaran(String kategori, double nominal, String catatan,
      {DateTime? tanggal}) {
    tanggal ??= DateTime.now();
    _daftarPengeluaran.add({
      'kategori': kategori,
      'nominal': nominal,
      'catatan': catatan,
      'tanggal': tanggal
    });
  }

  List<Map<String, dynamic>> tampilkanPengeluaran() {
    return _daftarPengeluaran;
  }

  List tampilkanKategori() {
    return _listKategori;
  }

  String pilihKategori(int option) {
    return _listKategori[option];
  }

  double laporanPengeluaran(day, {DateTime? from, DateTime? to}) {
    from ??= DateTime.now().subtract(Duration(days: day));
    to ??= DateTime.now();

    return _daftarPengeluaran
        .where((pengeluaran) =>
            pengeluaran['tanggal'].isAfter(from) &&
            pengeluaran['tanggal'].isBefore(to))
        .map((pengeluaran) => pengeluaran['nominal'])
        .fold(0, (prev, nominal) => prev + nominal);
  }
}
