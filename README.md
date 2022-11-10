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


## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Tombol + menambahkan angka sebanyak satu satuan.


2. Tombol - mengurangi angka sebanyak satu satuan. Apabila counter bernilai 0, maka tombol - tidak memiliki efek apapun pada counter.


3. Apabila counter bernilai ganjil, maka teks indikator berubah menjadi "GANJIL" dengan warna biru.


4. Apabila counter bernilai genap, maka teks indikator berubah menjadi "GENAP" dengan warna merah.


5. Angka 0 dianggap sebagai angka genap.
