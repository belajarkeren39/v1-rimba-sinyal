# Hasil pengujian Rimba Sinyal 1.1.0

## Status revisi

Tampilan telah dikunci pada **16:9**, dengan bidang logis 1600×900 dan skala seragam. Seluruh soal bawaan sekarang hanya membahas **cahaya dan bunyi**: 39 soal cahaya, 36 soal bunyi; tetap 25 soal Mudah, 25 Sedang, dan 25 Sulit.

**Kontrol tombol dapat dimainkan.** Pada revisi ini, satu sesi duel materi Bunyi tingkat Sulit telah dijalankan sampai hasil akhir di browser. Kamera dua orang nyata belum diuji; ketersediaan implementasi kamera tidak dianggap sebagai bukti kesiapan semua perangkat kelas.

## Pengujian tampilan yang dilakukan

Pengukuran berasal dari elemen halaman yang benar-benar dirender di browser, bukan perkiraan dari CSS. Toleransi pembulatan pengukuran kurang dari satu piksel.

| Ukuran viewport | Bidang permainan yang terukur | Rasio | Kartu soal menutupi skor/tombol? |
|---|---|---|---|
| 1920×1080 | 1920×1080 | 16:9 | Tidak pada kedua zona yang diperiksa |
| 1366×768 | 1365,33×768, terpusat | 16:9 | Tidak |
| 1024×768 | 1024×576, terpusat | 16:9 | Tidak |
| 844×390 | 693,33×390, terpusat | 16:9 | Tidak |
| 390×844 | 390×219,38, terpusat | 16:9 | Tidak; teks menjadi kecil, anjuran lanskap tampil |

Semua bidang berada di dalam viewport. Pengaturan dan ruang guru pada 1920×1080 tidak meluap keluar panel. Hasil permainan juga tetap di dalam bidang; hanya daftar pembahasan panjang yang bergulir di ruangnya sendiri. Sampul, pengaturan, duel, editor, hasil, serta HP potret diperiksa melalui tangkapan layar. Gambar menggunakan ukuran tetap dan object-fit; tidak ada ilustrasi tambahan yang ditumpuk khusus HP.

Pengukuran lengkap: `bukti-uji/rasio-16x9.json`. Ukuran di atas adalah simulasi viewport browser, bukan pengujian fisik lima perangkat.

## Alur permainan dan materi pada revisi ini

- Sampul menampilkan “Cahaya & Bunyi di Sekitar Kita”.
- Pengaturan menawarkan Cahaya, Bunyi, serta Cahaya + bunyi.
- Duel Bunyi tingkat Sulit berjalan selama enam tantangan per pemain hingga hasil: **seri 120–120**, masing-masing 3/6 jawaban tepat dan nol pelanggaran. Angka tersebut adalah data uji, bukan data murid.
- P1 dapat masuk hitung mundur/aksi saat P2 masih membaca; pada ronde pertama P1 sudah mencapai hasil ronde sementara P2 masih beraksi.
- Soal, opsi, pembahasan, tombol lanjut, dan hasil tampil pada ruang masing-masing.
- Ruang guru membuka MD-14 · Bunyi, menampilkan soal tentang senar gitar, tiga opsi, kunci, dan pembahasan. Tidak dilakukan perubahan manual pada isi bank pengguna melalui editor.
- Bank inline, salinan JSON, menu, validasi topik, panduan, dan manifest telah diselaraskan. Pemeriksaan teks tidak menemukan materi ekosistem/populasi pada berkas aktif tersebut.
- Bank revisi memakai kunci penyimpanan baru. Bank lama yang tersimpan di browser tidak dimuat sebagai materi baru dan tidak dihapus.

## Pemeriksaan otomatis

**30 dari 30 pemeriksaan lulus** setelah perubahan kode aplikasi dan bank: 17 pemeriksaan logika/berkas dan 13 pemeriksaan integrasi simulasi. Perubahan terakhir sesudah itu hanya merapikan deklarasi font textarea; halaman dibangun ulang, dimuat ulang, dan editor serta pengaturan diperiksa kembali di browser.

Cakupan pemeriksaan:

- Kuota dan keunikan 75 soal; validasi ID, opsi, kunci, dan tingkat; sembilan kombinasi tingkat/topik; kunci tetap sesuai setelah opsi diacak.
- Urutan soal, opsi, dan lampu yang setara; simulasi sesi penuh empat mode.
- Dua jawaban dan dua pointer independen, pembersihan pointer, penilaian satu kali, skor nonnegatif, toleransi merah, cooldown, dan pembekuan waktu baca.
- Integrasi empat mode sampai hasil, pergantian empat peserta, jeda/restart, dan COM yang tidak membaca pilihan manusia.
- Impor rusak/invalid mempertahankan bank, impor valid diterima, dan penyimpanan yang ditolak tidak menghentikan aplikasi.
- Kamera ditolak, dua ROI perubahan bingkai, kualitas cahaya, mirror, serta bingkai beku **melalui simulasi media**, bukan webcam nyata.
- Audio hilang/timeout, sebagian tersedia, penolakan play(), respons terlambat, mute, dan pembersihan penjadwal **melalui simulasi audio**.
- PNG nyata dan ukurannya, kanal alpha lentera, bank inline, tanpa CDN, fetch bank, atau perekaman video.

Rincian setiap pemeriksaan: `bukti-uji/pemeriksaan-otomatis.json`.

Empat mode telah dijalankan sampai hasil akhir di browser pada versi sebelumnya. Pada revisi ini, pengulangan sesi browser penuh dilakukan untuk duel Bunyi; empat mode tetap diperiksa oleh pengujian otomatis. Bukti lama diarsipkan di folder kerja dan tidak dicampur dengan tangkapan layar revisi.

## Bukti visual revisi

- `revisi-sampul-16x9.jpg`: sampul terbaru.
- `revisi-pengaturan.jpg`: pilihan materi dan kontrol.
- `revisi-duel-bunyi-16x9.jpg`: dua zona soal Bunyi yang tidak menumpuk.
- `revisi-hp-potret.jpg`: bidang tetap 16:9 dan anjuran lanskap.
- `revisi-hp-lanskap.jpg`: bidang 16:9 pada HP lanskap.
- `revisi-hasil-duel.jpg`: hasil enam tantangan per pemain.
- `revisi-editor-bunyi.jpg`: ruang guru dengan soal Bunyi.

## Batas verifikasi

- Belum ada uji webcam dengan dua orang, kamera IFP nyata, dua sentuhan fisik, atau seluruh variasi pencahayaan/oklusi.
- Kamera tetap memakai selisih bingkai per ROI; tidak mengidentifikasi tangan, pose, atau orang. Gerak latar dapat memengaruhi hasil.
- Penguncian 16:9 berarti teks dan tombol ikut mengecil pada HP potret. Gunakan lanskap atau perangkat lebih besar, terutama untuk duel.
- Fullscreen API belum terverifikasi berhasil pada perangkat fisik. Jika ditolak, aplikasi tetap dapat digunakan pada bidang 16:9 di jendela.
- MP3 tidak dibuat atau diunduh. Tujuh nama MP3 tetap opsional; bunyi sintetis disediakan.
- Paket lokal belum diterbitkan ke hosting. Ekstrak ZIP sebelum membuka index.html; jalankan mulai-lokal.cmd untuk akses kamera melalui localhost.

