import 'dart:async';
import 'package:pengeluaran/app.dart';
import 'package:test/test.dart';

String capturePrint(Function function) {
  final buffer = StringBuffer();
  final spec = ZoneSpecification(
    print: (self, parent, zone, line) {
      buffer.writeln(line);
    },
  );

  return Zone.current.fork(specification: spec).run(() {
    function();
    return buffer.toString().trim();
  });
}

void main() {
  var app = App();
  group('inputUser Function Tests', () {
    test('Harus menerima input int', () {
      expect(app.inputUser<int>('Masukkan angka bulat: '), equals(123));
    });

    test('Harus menerima input double', () {
      expect(
          app.inputUser<double>('Masukkan angka desimal : '), equals(123.45));
    });

    test('Harus menerima input string', () {
      expect(app.inputUser<String>('Masukkan teks : '), equals('Halo'));
    });
    test('Harus menolak input kosong', () {
      final result = capturePrint(() {
        app.inputUser<String>('Masukkan String Kosong: ');
      });

      expect(result, contains("Input tidak boleh kosong. Coba lagi."));
    });
  });
}
