# TUGAS 7

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateless widget, sesuai namanya, adalah widget yang tidak memiliki state sehingga setelah app di_build_, tampilan widget tidak dapat diubah-ubah kembali. Contoh stateless widget adalah `Icon` dan `Text`, atau widget lain yang sifatnya static.

Di sisi lain, stateful widget adalah widget yang memiliki state sehingga memungkinkan perubahan data dan/atau penampilan secara dinamis. Contoh stateful widget pada tugas ini adalah `MyHomePage` yang mengextend `StatefulWidget` serta memiliki state yaitu variabel `_counter`. 

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
* `FloatingActionButton`:
Button yang terletak di atas content app lainnya untuk melakukan action tertentu.

* `Text`:
Menampilkan string text.

* `Padding`:
Menerapkan padding di sekitar child berdasarkan nilai padding yang diberikan. 

* `Row`:
Menampilkan elemen-elemen child secara horizontal dalam satu baris.

* `Visibility`:
Menampilkan atau menghilangkan child.

* `Spacer`:
Mengatur spacing antar elemen dalam suatu widget flex, dalam tugas ini misalnya row.

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
`setState()` digunakan apabila ada perubahan state. Cara kerja fungsi ini adalah dengan 'memberitahu' framework bahwa ada perubahan state yang kemungkinan dapat merubah tampilan app, sehingga akan dilakukan rebuild terhadap widget yang terdampak. Pada tugas ini, variabel `_counter` akan diubah oleh fungsi `_incrementCounter` dan `_decrementCounter`, yang selanjutnya akan diproses oleh fungsi `setState()` agar state dan penampilan app ikut berubah.

## Jelaskan perbedaan antara const dengan final.
Dalam kedua modifier, begitu value telah diassign, state tidak akan bisa diubah lagi. Perbedaan keduanya terdapat pada:
* `const`: Nilai harus diketahui saat compile-time.
* `final`: Nilai harus diketahui saat run-time.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Tombol + menambahkan angka sebanyak satu satuan.

Menggunakan default app flutter yang sudah memiliki `FloatingActionButton` dengan fungsi `_incrementCounter`.

2. Tombol - mengurangi angka sebanyak satu satuan. Apabila counter bernilai 0, maka tombol - tidak memiliki efek apapun pada counter.

membuat button dan fungsi `_decrementCounter` yang serupa dengan tahap 1, namun dengan logic sebagai berikut untuk mencegah pengurangan ke bawah nilai 0:
```dart
  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }
```

3. Apabila counter bernilai ganjil, maka teks indikator berubah menjadi "GANJIL" dengan warna biru. Apabila counter bernilai genap, maka teks indikator berubah menjadi "GENAP" dengan warna merah.

Menambahkan logic pada widget `Text` yang akan berubah sesuai nilai `_counter` sebagai berikut:
```dart
 Text(
    (_counter % 2 == 0) ? 'GENAP' : 'GANJIL',
    style: TextStyle(
        color:(_counter % 2 == 0) ? Colors.red : Colors.blue
      ),
  ),      
```
Dengan menggunakan logic `_counter%2==0`, angka 0 sudah otomatis dianggap sebagai bilangan genap.


# TUGAS 8

## Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.

Keduanya berfungsi untuk menambahkan route baru ke stack. Perbedaannya adalah untuk `Navigator.push`
route baru akan ditambahkan ke stack tanpa menghilangkan route sebelumnya, sehingga dapat dilakukan
`Navigator.pop` untuk kembali ke route sebelumnya. Di sisi lain, `Navigator.pushReplacement` akan
menghapus route sebelumnya untuk menambahkan route baru.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

(Tidak menyebutkan kembali yang sudah dijelaskan pada readme tugas 7)

* `ListView`
Menampilkan widget-widget secara linear ke arah scroll. pada tugas ini digunakan `ListView.builder`
untuk merender elemen-elemen list menjadi widget-widget.

* `Card`:
Panel dengan ujung-ujung bulat dan elevation shadow (sc: flutter documentation). Pada tugas ini
akan digunakan untuk menampilkan widget lain, yaitu widget yang dirender oleh `ListView.builder`.

* `Drawer`:
Digunakan bersamaan dengan `Scaffold` untuk membuat hamburger menu.

* `Form`:
Digunakan untuk membuat serta menyimpan data form.

## Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).

Pada form, terdapat `onSaved` dan `onChanged`. Selain itu, terdapat `onPressed` dan `onTap` untuk
gesture capture pada button dan navigator.

## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.

class `Navigator` memiliki stack of routes yang dapat diatur melalui 2 cara: 
declarative API `Navigator.pages`, dan imperative API `Navigator.push` dan `Navigator.pop`. 

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

1. Drawer Menu

Membuat drawer seperti pada Tutorial 7 PBP, mengganti routing menjadi `MyHomePage`, 
`TambahBudgetPage`, dan `DataBudgetPage`.

2. Halaman form

Membuat form baru pada file `tambah_budget.dart`. Terdapat 3 input, yaitu judul dan nominal menggunakan
`TextFormField`, dengan modifikasi pada nominal agar input hanya memperbolehkan karakter numerik.
Input lain adalah tipe budget yang menggunakan `DropdownButtonFormField` dengan 2 pilihan yaitu
pengeluaran dan pemasukan. Masing-masing input disimpan dalam variabel yang akan disave menggunakan
`setState` oleh button ke dalam `lstBudgets` untuk dipass ke halaman data.

`lstBudgets` akan berisi data budget dari form yang dibuat menjadi instance-instance `Budget` yang
sudah dibuat classnya pada `budget.dart`.

3. Halaman data

Membuat halaman di file baru `data_budget.dart`. Untuk menampilkan data yang sudah dibuat di form,
digunakan `ListView.builder` untuk merender semua elemen list menjadi widget. Setelah melakukan return
menggunakan class `Card`, masing-masing elemen list tersebut akan ditampilkan pada card.

# TUGAS 9

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?


## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
* `MaterialButton`:
Menggunakan `onPressed`nya untuk tombol back setiap detail watchlist.

* `FutureBuilder`:
Berfungsi layaknya `async` pada javascript. Widget-widget akan diupdate berdasarkan `future`.

* `ListTile`:
Menyimpan `Text` serta memiliki `onTap` untuk mengarahkan ke detail watchlist.

## Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
Flutter menggunakan `http` untuk mengirim HTTP Request (dalam tugas ini HTTP GET) ke server. Server akan mengembalikan response yang akan di-decode dan di-deserialize menggunakan `jsonDecode`, yang kemudian akan digunakan untuk membuat instance baru dari objek model yang sudah dibuat.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

