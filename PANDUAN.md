# Rimba Sinyal

**Lampu Merah, Lampu Hijau — Cahaya dan Bunyi, IPAS kelas V SD**

Rimba Sinyal mengajak murid membaca dan menjawab soal, menggerakkan tangan saat hijau, lalu diam saat merah. Satu sesi berisi enam tantangan, dengan waktu baca dan pembahasan tanpa batas. Seluruh kode, konfigurasi, dan bank bawaan berada di `index.html`; tidak memerlukan akun, API key, CDN, atau pemasangan model deteksi.

Status pengujian dan batas verifikasi dicatat terpisah dalam `HASIL-UJI.md`. Aset PNG final sudah dibuat dan dipasang. Kamera nyata tetap perlu diperiksa pada perangkat kelas sebelum digunakan bersama murid.

## Menjalankan

**Cara cepat tanpa kamera:** buka `index.html` dengan Chrome atau Edge, tekan **Mulai petualangan**, pilih **Tombol — sentuh / keyboard**, lalu **Siapkan permainan**. Pertahankan folder `asset` di sebelah `index.html`.

**Cara kamera di komputer ini:** buka `mulai-lokal.cmd`. Peluncur mencari Node.js yang sudah terpasang, menjalankan server hanya di komputer ini, dan membuka `http://127.0.0.1:8765`. Biarkan jendela server terbuka selama bermain; tutup atau tekan Ctrl+C setelah selesai. Peluncur tidak mengunduh atau memasang apa pun.

**Komputer lain:** bila Node.js tersedia, jalankan `node server.cjs` dari folder permainan lalu buka `http://127.0.0.1:8765`. Jika belum tersedia, mode tombol melalui `index.html` tetap dapat dipakai. Alternatifnya unggah `index.html` dan folder `asset` bersama-sama ke hosting HTTPS. Alamat HTTP biasa di jaringan sekolah bukan pengganti HTTPS untuk izin kamera.

**HP:** gunakan hosting HTTPS untuk kamera. Tampilan dikunci 16:9 dan diperkecil secara seragam, bukan disusun ulang menjadi potret. Putar HP ke lanskap agar teks dan tombol lebih besar. Untuk duel, utamakan tablet/IFP atau layar besar. Multipemain tetap berlangsung serentak pada satu perangkat.

Tidak ada audio/video pengguna yang dikirim. Server lokal hanya menyajikan berkas; tidak menerima unggahan kamera atau hasil murid. Hasil dapat diunduh sendiri melalui tombol **Unduh hasil**.

## Tampilan 16:9 yang dikunci

Semua layar memakai bidang logis 1600×900 dan satu faktor skala yang sama untuk teks, tombol, gambar, serta area kamera. Sampul, pengaturan, arena, hasil, dan dialog tetap proporsional saat jendela berubah ukuran. Layar yang bukan 16:9 menampilkan ruang kosong di sekeliling; gambar tidak ditarik atau dipipihkan.

Skor/lampu, kartu soal, dan kontrol bawah memakai baris terpisah agar tidak menumpuk. Gambar lentera memakai kotak ukuran tetap dan `object-fit: contain`. Teks panjang hasil edit guru dapat digulir di panelnya sendiri. Pada HP potret, bidang 16:9 menjadi kecil; anjuran lanskap tampil di luar permainan. Ukuran fisik tombol mengikuti skala layar, sehingga layar besar tetap disarankan.

## Alur dan aturan

1. Sampul → Mulai → pilih mode, tingkat, topik, dan kontrol.
2. Kamera: izinkan akses, posisikan pemain, diam tiga detik, lalu gerakkan tangan untuk memeriksa respons. Kontrol tombol tidak membutuhkan kamera.
3. Latihan 12 detik dapat dijalankan atau dilewati. Tidak ada skor selama latihan.
4. Baca soal → pilih salah satu dari tiga jawaban → baca pembahasan. Timer pemain itu berhenti.
5. Tekan **Siap bergerak**, tunggu hitung mundur tiga detik, lalu ikuti lampu selama 12 detik.
6. Hijau: bergerak untuk mengumpulkan poin. Merah: diam. Kuning selama 0,8 detik adalah jeda pergantian tanpa penalti.
7. Baca hasil ronde, lalu lanjut. Setelah enam ronde, hasil dan pembahasan dapat ditinjau kembali.

Gerakkan tangan di tempat; berjalan atau berlari tidak diperlukan. Pilihan **Gerak tangan sambil duduk** mengubah area deteksi ke bagian tengah-bawah bidang kamera. Saat merah, seluruh gerakan yang masuk area terhitung, termasuk gerakan badan atau latar.

| Komponen skor | Nilai |
|---|---:|
| Jawaban tepat | +20 |
| Gerak selama hijau | +10 per detik, maksimum +60 per ronde |
| Tanpa pelanggaran merah | +10 per ronde |
| Gerak merah lebih dari 0,28 detik | −8 |
| Pemulihan setelah penalti | 1,1 detik sebelum penalti berikutnya |

Skor tidak pernah negatif. Maksimum teoretis 90 per ronde atau 540 per pemain per sesi. Skor dibulatkan saat ditampilkan dan dibandingkan. Poin sama berarti seri. Nilai ini adalah umpan balik permainan, bukan asesmen resmi atau diagnosis kemampuan murid.

## Empat mode

| Mode | Cara bermain dan keadilan |
|---|---|
| Solo melawan COM | Satu pemain nyata dibandingkan dengan progres virtual berlabel COM. Tidak ada tangan atau video lawan palsu. |
| 2 pemain — duel serentak | P1 di kiri dan P2 di kanan. Satu video, dua area gerak. Jawaban, waktu baca, countdown, cooldown, skor, dan progres terpisah. Pemain yang selesai lebih awal menunggu tanpa menghentikan lawan. |
| 2 pemain — tim melawan COM | Kedua pemain tetap serentak dan memiliki soal masing-masing. Skor mereka digabung menjadi skor tim; COM memiliki dua kontribusi virtual yang sepadan. |
| 4 pemain — lomba bergiliran | Satu peserta per giliran. Soal, urutan opsi, pola lampu, waktu, dan kondisi awal sama. Kalibrasi diulang untuk tiap peserta. Peserta berikutnya sebaiknya tidak melihat jawaban giliran sebelumnya. |

Setiap sesi memakai seed untuk pengacakan; seed tersimpan pada ekspor hasil. Mengulang sesi lewat **Jeda → Ulang sesi** mempertahankan seed. **Main lagi** memulai pilihan sesi baru dan seed baru.

COM memiliki peluang jawaban benar 72% per soal, waktu reaksi 0,35–0,70 detik, porsi gerak terjadwal 65–90%, serta peluang terlambat berhenti 22% per ronde. Perilakunya ditentukan sebelum membaca jawaban manusia. COM memakai fungsi penilaian yang sama, termasuk batas poin, toleransi merah, dan penalti. Peluang tidak berarti setiap sesi pasti menghasilkan persentase yang persis sama. Waktu baca manusia tidak memberi COM waktu tambahan.

## Kontrol

| Aksi | P1 / Solo | P2 |
|---|---|---|
| Bergerak | Tahan A atau Spasi | Tahan L |
| Memilih jawaban | 1, 2, 3 | 7, 8, 9 |
| Melanjutkan pembahasan/ronde | Enter, atau tombol layar | P, atau tombol layar |
| Jeda | Esc / tombol Jeda | Jeda menghentikan semua pemain |

Pada layar sentuh, dua jari dapat menahan dua tombol berbeda. Kepemilikan sentuhan ditetapkan saat sentuhan dimulai dan tidak berpindah ketika diseret. Sentuhan yang dibatalkan dibersihkan. Mouse tunggal dapat mengoperasikan pilihan dan satu tombol gerak; mouse tunggal tidak dianggap dua input fisik serentak. Untuk dua pemain tanpa layar sentuh, gunakan A dan L pada keyboard.

Tombol kamera dan tombol alternatif dibedakan dengan label. Saat memilih tombol alternatif, stream kamera dihentikan. Layar penuh tersedia melalui tombol ⛶; jika browser menolak, permainan tetap berjalan.

## Kamera, area deteksi, dan batas kemampuan

Detektor utama adalah **frame differencing** pada area tubuh. Tidak ada pengenalan wajah, tangan, pose, identitas, atau model AI tambahan.

- Satu stream meminta resolusi ideal 1280×720; kemampuan perangkat menentukan resolusi sebenarnya.
- Video memenuhi arena dengan `object-fit: contain`, tanpa memotong bagian kamera. Bidang permainan selalu 16:9, berpusat di layar. Ruang di luar bidang menjadi bingkai gelap bila rasio perangkat berbeda.
- Gambar analisis dicerminkan seperti tampilan, lalu dikecilkan menjadi 192×108 untuk efisiensi. Video yang dilihat pemain tetap besar.
- P1/P2 mengikuti koordinat tampilan setelah pencerminan, bukan label tangan kanan/kiri biologis. Area tengah menjadi jarak pemisah.
- Dalam satu frame, kedua area diperiksa. Tidak ada pergantian giliran deteksi pada duel.
- Perubahan intensitas piksel lebih dari 24 dihitung sebagai perubahan; hasil dibagi jumlah piksel area.
- Kalibrasi diam mengukur noise terpisah per area. Ambang gerak memakai persentil ke-95 × 2,2 + 0,012, dibatasi 2,2–20% area. Kalibrasi gerak harus terdeteksi untuk seluruh area yang aktif.
- Cahaya terlalu gelap/terang atau perubahan pencahayaan besar menahan aksi pemain yang terdampak. Pemain lain tetap dapat melanjutkan. Pemutusan seluruh kamera menahan seluruh permainan dan menawarkan sambung ulang atau tombol.
- Kalibrasi ulang tersedia lewat Jeda. Perubahan posisi kamera, orientasi, pencahayaan, atau jarak pemain dapat membutuhkan kalibrasi ulang.

**Keterbatasan yang nyata:** detektor perubahan piksel tidak dapat membedakan tangan dari tirai, kipas, orang lain, atau gerak kamera. Tangan diam yang tertutup tidak dapat dikenali sebagai oklusi; tidak adanya gerak dapat berarti diam, tangan di luar area, atau tangan tertutup. Pesan membantu mengatur posisi dan menawarkan tombol, tetapi bukan klaim pelacakan tangan. Tangan yang melewati area lawan dapat memengaruhi area tersebut; pembagian ini bukan sistem anticurang. Untuk hasil adil gunakan kamera tetap, latar tenang, pencahayaan merata, dan jarak antarpemain.

## Materi dan bank 75 soal

Materi diperbarui menjadi **cahaya dan bunyi**, sesuai arahan terbaru. Tujuan: murid menjelaskan sifat cahaya dan bunyi, mengaitkannya dengan kehidupan sehari-hari, serta menilai dan mendemonstrasikan percobaan sederhana.

| Tingkat | Cahaya | Bunyi | Jumlah | Tuntutan berpikir |
|---|---:|---:|---:|---|
| Mudah | 13 | 12 | 25 | Mengenali sumber, sifat, dan contoh sehari-hari |
| Sedang | 13 | 12 | 25 | Menjelaskan sebab, menerapkan konsep, memprediksi satu langkah |
| Sulit | 13 | 12 | 25 | Menilai bukti, merancang percobaan adil, membandingkan hasil |

Sesi campuran mengambil tiga soal per topik. Sesi satu topik mengambil enam soal dari tingkat terpilih. Soal tidak digandakan untuk memenuhi kuota; setiap entri mempunyai ID unik, tiga opsi, kunci, dan pembahasan. Bank berisi 39 soal cahaya dan 36 soal bunyi. Bunyi mencakup sumber getaran, medium, nada, keras-lemah, pemantulan, penyerapan, serta percobaan.

Untuk mendemonstrasikan cahaya dan bunyi secara langsung di kelas, guru dapat melanjutkan sesi dengan percobaan berikut. Permainan tidak mengklaim memeriksa percobaan fisik lewat kamera:

1. **Jalur cahaya:** senter dan tiga karton berlubang. Murid membuat lubang segaris, lalu menggeser satu karton. Berhasil bila murid menunjukkan perubahan cahaya yang lolos dan menjelaskan jalur lurus dalam udara seragam.
2. **Pemantulan:** arahkan senter ke cermin dan tangkap pantulannya pada kertas. Berhasil bila murid menunjukkan sumber → cermin → layar dan membedakan sumber cahaya dari pemantul.
3. **Pembiasan:** amati pensil sebagian dalam gelas air, lalu angkat. Berhasil bila murid membandingkan tampilan dan menjelaskan bahwa pensil tidak patah; arah cahaya berubah pada batas medium.

4. **Sumber bunyi:** petik karet yang direntangkan pada kotak, amati getarannya, lalu redam dengan sentuhan. Berhasil bila murid menghubungkan getaran dengan bunyi yang terdengar.
5. **Nada:** jepit penggaris lentur di tepi meja dan ubah panjang bagian bebas. Pertahankan bahan serta cara memetik. Berhasil bila murid membandingkan nada dan menyebut variabel yang dijaga.
6. **Perambatan:** gunakan dua gelas dan tali; bandingkan saat tali tegang dan kendur tanpa mengubah volume suara. Berhasil bila murid menjelaskan peran tali dalam meneruskan getaran.

Jangan menyorot mata atau menatap Matahari. Gunakan volume nyaman, jangan mendekatkan bunyi keras ke telinga, dan dampingi percobaan.

## Mengedit serta impor/ekspor JSON

Buka **Ruang guru · 75 soal** di sampul. Pilih tingkat dan ID, edit topik, pertanyaan, tiga opsi, kunci, dan pembahasan, lalu **Simpan soal**. Bank berlaku langsung untuk sesi berikutnya.

**Ekspor JSON** menyimpan bank yang sedang aktif. `bank-soal.json` dalam paket adalah salinan bawaan untuk diimpor atau dicadangkan; permainan tidak mengambil bank dari file itu secara otomatis.

Struktur berkas:

```json
{
  "version": 1,
  "questions": [
    {
      "id": "MD-01",
      "level": "Mudah",
      "topic": "cahaya",
      "question": "Benda mana yang menghasilkan cahaya sendiri?",
      "options": ["Lampu menyala", "Buku", "Cermin"],
      "answer": 0,
      "explanation": "Lampu yang menyala menghasilkan cahaya. Buku dan cermin memantulkan cahaya."
    }
  ]
}
```

Contoh di atas hanya menunjukkan satu entri, bukan bank lengkap yang dapat langsung diimpor. Impor nyata harus memuat tepat 75 entri, 25 per tingkat, minimal enam soal tiap topik pada tiap tingkat, ID dan teks soal unik, tiga opsi berbeda, kunci bilangan 0–2, serta pembahasan tidak kosong. Maksimal file 500 KB; soal 600 karakter, opsi 220, pembahasan 1.200. Jika validasi gagal, bank lama tetap utuh. Struktur array langsung juga diterima.

Topik JSON hanya menerima `cahaya` atau `bunyi`. Bank versi ini memakai ruang penyimpanan baru (`rimba.bank.cahaya-bunyi.v2`), sehingga bank materi lama tidak dimuat dan tidak dihapus.

Penyimpanan lokal browser digunakan jika tersedia. Jika ditolak atau data rusak, aplikasi memakai nilai cadangan dan tidak berhenti. Ekspor JSON untuk membawa bank ke browser atau komputer lain. **Pulihkan bank bawaan** mengembalikan bank awal; ekspor pekerjaan guru terlebih dahulu bila ingin menyimpannya.

## Berkas paket

```text
rimba-sinyal/
  index.html               aplikasi + CSS + kode + konfigurasi + bank inline
  asset/
    cover_bg.png           ilustrasi sampul final
    lentera.png            lentera transparan final
    audio/
      OPSIONAL.txt         daftar nama MP3 opsional; tidak ada MP3 bawaan
  bank-soal.json            cadangan bank 75 soal
  server.cjs                server lokal tanpa dependensi paket
  mulai-lokal.cmd           peluncur Windows
  PANDUAN.md                dokumen ini
  ACUAN-ASET-DAN-PROMPT.md   acuan visual, tabel aset, prompt gambar dan audio
  HASIL-UJI.md              hasil pengujian dan batasnya
  manifest.json             daftar aset dan dependensi
  bukti-uji/                tangkapan layar pengujian
```

## Sumber konsep

Soal adalah susunan orisinal untuk latihan kelas V, bukan salinan bank resmi. Konsep cahaya dirujuk pada [NASA — Wave Behaviors](https://science.nasa.gov/ems/03_behaviors/). Perbedaan gelombang cahaya dan bunyi dirujuk pada [NASA — Anatomy of an Electromagnetic Wave](https://science.nasa.gov/ems/02_anatomy/). Konsep frekuensi, amplitudo, dan medium bunyi dirujuk pada [NPS — Understanding Sound](https://home.nps.gov/subjects/sound/understandingsound.htm), serta pengukuran tingkat bunyi pada [NIDCD — How is Sound Measured?](https://www.nidcd.nih.gov/health/how-sound-measured). Perilaku izin kamera mengikuti [dokumentasi getUserMedia MDN](https://developer.mozilla.org/en-US/docs/Web/API/MediaDevices/getUserMedia).

## Pemecahan masalah

- **Kamera ditolak:** pilih tombol alternatif, atau izinkan kamera untuk alamat permainan lalu coba lagi.
- **Kamera sedang digunakan:** tutup aplikasi lain yang memakai kamera dan sambungkan ulang.
- **Gerak terus terbaca saat diam:** hentikan gerak latar, stabilkan kamera, kurangi silau, kalibrasi ulang.
- **Gerak tidak terbaca:** pastikan tangan ada di area, gerakkan sedikit lebih jelas, tingkatkan cahaya, atau gunakan tombol.
- **Layar kecil untuk dua pemain:** gunakan lanskap/perangkat lebih besar atau Solo. Permainan tidak mengganti duel menjadi giliran secara diam-diam.
- **Suara tidak terdengar:** aktifkan suara setelah interaksi, periksa mute dan volume musik/efek. Kegagalan audio tidak menghentikan permainan.
- **Gambar gagal:** periksa folder `asset` dan nama file. Tampilan cadangan menjaga permainan tetap berjalan.
- **Jendela disembunyikan:** permainan dijeda. Kembali lalu tekan Lanjutkan; tidak ada pengurangan waktu selama jeda.
- **Port 8765 dipakai:** tutup peluncur lama, atau jalankan server dengan variabel `PORT` berbeda dan buka alamat yang dicetaknya.
