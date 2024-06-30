import 'dart:io';

class Pelanggan {
  String nama;
  int nomorPesanan;
  Pelanggan(this.nama, this.nomorPesanan);
  @override
  String toString() {
    return 'Pelanggan: $nama (Pesanan #$nomorPesanan)';
  }
}
class AntrianLaundry {
  List<Pelanggan> antrianPelanggan = [];
  List<Pelanggan> pelangganDilayani = [];
  void tampilkanMenu() {
    print('Menu Antrian Laundry');
    print('1. Tambah Pelanggan');
    print('2. Tampilkan Antrian');
    print('3. Layani Pelanggan Berikutnya');
    print('4. Tampilkan Pelanggan yang Dilayani');
    print('5. Keluar');
    print('Masukkan pilihan Anda: ');
  }
  void tambahPelanggan() {
    print('Masukkan nama pelanggan: ');
    String nama = stdin.readLineSync()!;
    print('Masukkan nomor pesanan: ');
    int nomorPesanan = int.parse(stdin.readLineSync()!);
    Pelanggan pelanggan = Pelanggan(nama, nomorPesanan);
    antrianPelanggan.add(pelanggan);
    print('$nama (Pesanan #$nomorPesanan) telah ditambahkan ke antrian.');
  }
  void tampilkanAntrian() {
    if (antrianPelanggan.isNotEmpty) {
      print('Antrian saat ini:');
      for (var pelanggan in antrianPelanggan) {
        print(pelanggan);
      }
    } else {
      print('Antrian saat ini kosong.');
    }
  }
  void layaniPelangganBerikutnya() {
    if (antrianPelanggan.isNotEmpty) {
      Pelanggan pelanggan = antrianPelanggan.removeAt(0);
      pelangganDilayani.add(pelanggan);
      print('Melayani ${pelanggan.nama} (Pesanan #${pelanggan.nomorPesanan})');
    } else {
      print('Pelangan saat ini tidak ada.');
    }
  }
  void tampilkanPelangganDilayani() {
    if (pelangganDilayani.isNotEmpty) {
      print('Pelanggan yang dilayani:');
      for (var pelanggan in pelangganDilayani) {
        print(pelanggan);
      }
    } else {
      print('Belum ada pelanggan yang dilayani.');
    }
  }
}
void main() {
  AntrianLaundry antrianLaundry = AntrianLaundry();
  int pilihan;
  do {
    antrianLaundry.tampilkanMenu();
    pilihan = int.parse(stdin.readLineSync()!);
    switch (pilihan) {
      case 1:
        antrianLaundry.tambahPelanggan();
        break;
      case 2:
        antrianLaundry.tampilkanAntrian();
        break;
      case 3:
        antrianLaundry.layaniPelangganBerikutnya();
        break;
      case 4:
        antrianLaundry.tampilkanPelangganDilayani();
        break;
      case 5:
        print('Keluar...');
        break;
      default:
        print('Pilihan tidak valid. Silakan coba lagi.');
    }
  } while (pilihan != 5);
}