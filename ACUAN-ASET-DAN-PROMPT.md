# Acuan produksi Rimba Sinyal

## Satu lembar acuan visual

**Identitas:** Rimba Sinyal, klub penjaga rimba. Suasana hutan pagi yang hangat, tenang, ingin tahu. Pemain adalah murid nyata di kamera; tidak diganti foto stok atau avatar. Objek identitas adalah lentera sinyal dua lensa. COM hanya progres virtual berlabel. Tidak ada maskot tambahan yang tidak diperlukan.

**Gaya:** miniatur 3D clay yang dipoles, tepian membulat, permukaan halus dengan detail material ringan. Ini gaya ilustrasi bitmap, bukan klaim mesin permainan 3D. Kamera objek setinggi mata, pandangan depan tiga perempat sedikit ke kiri. Cahaya hangat dari kiri atas; bayangan lembut, tanpa garis luar hitam berat. Teks dan label semuanya HTML.

| Warna | Kode | Fungsi |
|---|---|---|
| Hijau pinus | `#173F35` | Badan lentera, tombol, identitas |
| Hijau rimba gelap | `#102B27` | Latar, kontras teks terang, HUD transparan |
| Gading | `#F6F0DC` | Panel baca, teks sampul, kaki lentera |
| Kuning kuningan | `#E9B85B` | Gagang, cincin lensa, tombol utama dan progres |
| Hijau mint | `#88D6A3` | Sinyal hijau serta umpan balik positif |
| Koral | `#EF6B58` | Sinyal merah dan tepi penalti |

**Siluet dan proporsi:** lentera pendek dengan badan kira-kira dua kali lebih tinggi dari lebarnya, gagang melengkung, dua kaca bundar vertikal (merah atas, hijau bawah), lambang daun kecil, alas gading. Proporsi serta arah cahaya sama di kedua gambar. Objek didesain terbaca pada ukuran 120–220 piksel CSS. Tidak memakai emoji sebagai karakter final.

**Skala dan detail:** lentera utama sekitar 45–65% tinggi bagian ilustratif sampul; batang, daun dan jalur hutan memberi skala miniatur. Separuh kiri tenang untuk judul. Objek tidak mempunyai collision fisik. Pada aksi kamera, panel baca disembunyikan dan bidang tengah dibebaskan; indikator sinyal, progres, dan feedback ada di tepi.

**Pose/aksi:** tidak diperlukan sprite bergerak karena pemain adalah manusia dalam video. Lentera ilustratif statis di sampul, pengaturan, dan hasil. Sinyal hidup/diam, hitung mundur, progres dan efek penalti dirender kode; tidak memerlukan sprite sheet. Bayangan kontak ilustrasi hanya di sampul, bayangan kecil lentera terpisah melalui CSS `drop-shadow`. Efek tepi menghormati `prefers-reduced-motion`.

**Penguncian posisi:** seluruh aset mengikuti satu bidang 16:9 dan satu faktor skala. Tidak ada variasi aset yang ditumpuk untuk HP. Ilustrasi pengaturan, ilustrasi hasil, dan latar sampul mempunyai ruang tetap; ukuran gambar asli dipertahankan tanpa distorsi.

## Pemetaan peran

| Tokoh/objek | Peran | Posisi awal | Kontrol | Aksi/pose | Ciri pembeda |
|---|---|---|---|---|---|
| Penjaga 1 | Pemain nyata | Tengah untuk Solo; kiri untuk dua pemain | Kamera area kiri / A, Spasi / sentuhan kiri | Bergerak saat hijau, diam saat merah | Label P1/KIRI dan area kiri |
| Penjaga 2 | Pemain nyata serentak | Kanan | Kamera area kanan / L / sentuhan kanan | Bergerak dan menjawab mandiri | Label P2/KANAN dan area kanan |
| Penjaga 1–4 pada lomba | Empat peserta bergiliran | Area tengah satu peserta | Kamera atau kontrol P1 | Kalibrasi tiap giliran | Nama peserta dan nomor giliran |
| COM | Target virtual | Bilah tepi atas | Jadwal seed, akurasi dan reaksi terukur | Progres poin | Teks “COM virtual”; bukan manusia atau tangan palsu |
| Lentera sinyal | Identitas dan petunjuk aturan | Kanan sampul; ilustrasi pengaturan/hasil | Tidak dikendalikan | Gambar statis; sinyal aktif dirender HTML | Dua lensa vertikal, gagang kuningan, daun |

Pada duel, pemain berdampingan menghadap kamera agar dua area terlihat; bukan avatar saling berhadapan. Bentuk sinyal dan kata HIJAU/GERAK serta MERAH/DIAM melengkapi warna.

## Tabel seluruh aset gambar

Dimensi di bawah diambil dari PNG nyata hasil pembuatan, bukan hanya ukuran yang diminta pada prompt.

| File persis | Fungsi, posisi/layer | Ukuran ekspor nyata | Ukuran render | Rasio | Transparansi | Arah hadap | Pivot | Hitbox | Pose/frame |
|---|---|---|---|---|---|---|---|---|---|
| `asset/cover_bg.png` | Latar sampul, di belakang teks HTML dan lapisan gelap tipis | 1672×941 px | Bidang tetap 1600×900 logis; skala seragam, menjadi 1920×1080 pada IFP | ≈16:9 | Tidak, latar penuh | Lentera depan tiga perempat sedikit ke kiri | Pusat bidang; titik fokus kanan | Tidak ada, dekoratif | Satu gambar statis |
| `asset/lentera.png` | Ilustrasi pengaturan dan hasil; layer di atas panel, bayangan CSS | 1254×1254 px | Kotak 232×270 px logis di pengaturan; 120×120 px logis di hasil, object-fit contain | 1:1 | Ya, kanal alpha asli | Depan tiga perempat sedikit ke kiri | Pusat bawah (50%,95%) bila dianimasikan | Tidak ada, dekoratif; area transparan tidak interaktif | Satu pose diam |

Kedua gambar dibuat dengan alat ImageGen bawaan. Lentera dibuat lebih dulu dan dipakai sebagai referensi sampul. Tidak ada gambar internet acak, sprite sheet, atau PNG placeholder. File sampul beresolusi tinggi tetapi lebih kecil daripada 1920×1080; ia bukan thumbnail. Ketajaman tampilan IFP diperiksa pada tangkapan layar yang tersedia. Jika membutuhkan ekspor asli 4K, regenerasi menggunakan prompt berikut dengan ukuran lebih besar.

## Prompt gambar mandiri

### `asset/lentera.png`

```text
Use case: stylized-concept. Final PNG transparent game object for Indonesian elementary learning game Rimba Sinyal. A polished handcrafted 3D clay forest ranger signal lantern, no character or face: short rounded deep pine green housing #173F35 with arched brass carrying handle #E9B85B, two vertically stacked circular glass lenses, top coral red #EF6B58 and bottom mint green #88D6A3, small carved leaf emblem on lower housing, little ivory enamel base #F6F0DC. Distinctive squat silhouette, overall height twice width. Three-quarter front view facing slightly left, orthographic camera at eye level, soft warm key light upper left, subtle material detail, smooth bevels, no hard outlines. Entire lantern centered with 12% transparent padding, target 1024x1024 or larger square, true transparent background, no floor and no cast ground shadow; object self shading retained. Render intended at 120-230 CSS pixels. Bahasa keluaran Indonesia. TEKS WAJIB: tidak ada teks; seluruh label akan ditulis HTML. Avoid text, letters, watermark, blur, checkerboard painted background, white background, frame, cropped object, excessive tiny detail. This is the primary visual reference asset, not UI.
```

### `asset/cover_bg.png`

```text
Use case: stylized-concept. Create final 16:9 wide cover background, target 1920x1080 or higher, for Indonesian elementary game Rimba Sinyal, polished handcrafted clay 3D miniature forest ranger outpost. Visual identity: pine green #173F35, dark forest #102B27, ivory #F6F0DC, brass ochre #E9B85B, mint #88D6A3, coral #EF6B58. Main object is a short rounded deep green signal lantern, height twice its width, brass arch carrying handle, two vertically stacked circular glass lenses with red above green, small carved leaf emblem, ivory foot. Place the lantern on a mossy wooden stump in the RIGHT THIRD, about 45-65% image height; a winding forest path leads into layered stylized tropical trees, broad leaves and ferns, soft distant hills. No human, animal mascot or extra lantern. Left 55% is calm low-detail deep-green negative space for HTML title and buttons, no bright highlights there. Warm soft light upper left, soft contact shadows, beveled sculpted materials, no heavy outlines, eye-level three-quarter front camera facing slightly left. Foreground leaves frame corners without covering the safe title area or object. Lantern fully visible, no crop. Quiet adventurous forest morning. Bahasa keluaran Indonesia. TEKS WAJIB: tidak ada teks; judul dan tombol dirender melalui HTML. No text, watermark, logo, border, blur, pixelation, interface mockup, random lettering, cropped lantern, harsh shadow, clutter over the title area. Opaque background. If a reference is available, use asset/lentera.png to preserve the lantern identity; the description above must also work independently.
```

## Audio fungsional dalam kode

AudioManager menggunakan satu AudioContext setelah interaksi. Square/triangle dan noise percussion membuat musik serta efek. Tidak ada lagu artis atau rekaman komersial yang ditiru. Musik sampul dan pertandingan memakai pola terpisah; jeda, restart, hasil, dan tab tersembunyi membersihkan penjadwalan agar musik tidak bertumpuk. Musik tidak berjalan sebelum interaksi. Volume musik/efek dan mute terpisah disimpan jika storage tersedia.

### Tabel produksi audio orisinal

| Cue | Judul kerja | Bentuk/suasana | Tempo & durasi | Loop |
|---|---|---|---|---|
| `menu_theme` | Gerbang Rimba | Chiptune cerah tenang, square lembut, bass triangle, perkusi noise ringan | 100 BPM; siklus kode 38,4 detik | Ya |
| `gameplay_theme` | Jejak Sinyal | Chiptune lincah tetapi tidak menutupi instruksi; motif pendek | 120 BPM; siklus kode 48 detik | Ya |
| `click` | Sentuh Lentera | Blip triangle lembut | Sekitar 0,10 detik | Tidak |
| `correct` | Cahaya Tepat | Arpeggio naik empat nada | Sekitar 0,40 detik | Tidak |
| `wrong` | Tenang Kembali | Dua nada turun ramah | Sekitar 0,36 detik | Tidak |
| `win` | Rimba Terjaga | Fanfare naik orisinal | Sekitar 2,24 detik | Tidak |
| `lose` | Jejak Berikutnya | Jingle turun lembut dengan akhir mengajak mencoba | Sekitar 1,65 detik | Tidak |

Volume awal musik 25%, efek 45%; bus sintetis mempunyai penguatan tambahan yang rendah. Envelope mencegah serangan tajam, polyphony dibatasi 24 node, dan node terputus setelah selesai. Feedback warna, bentuk, dan teks selalu tersedia tanpa audio.

### Prompt `menu_theme`

```text
Buat musik instrumental orisinal “Gerbang Rimba” untuk sampul game pembelajaran Rimba Sinyal, kelas V SD. Chiptune 8-bit retro 100 BPM, durasi 38,4 detik, seamless loop tanpa intro/outro panjang. Melodi square lembut, bass triangle hangat, percussion noise ringan. Suasana hutan pagi yang cerah, tenang dan mengundang. Motif baru, jangan meniru melodi artis atau lagu komersial. Tanpa vokal, ujaran, ambience keras, atau ledakan. Target volume lembut sekitar -20 LUFS, true peak tidak lebih dari -3 dBTP, hindari nada menusuk. Output audio saja, nama file menu_theme.mp3.
```

### Prompt `gameplay_theme`

```text
Buat musik pertandingan instrumental orisinal “Jejak Sinyal” untuk game belajar Rimba Sinyal. Chiptune 8-bit 120 BPM, durasi 48 detik, seamless loop. Square arpeggio yang ringan, bass triangle, percussion noise pendek. Energik tetapi menyisakan ruang untuk guru berbicara dan murid membaca. Motif baru dengan variasi kecil tiap frasa; jangan meniru artis atau karya komersial. Tanpa vokal, intro/outro panjang, sirene atau ledakan. Volume sekitar -22 LUFS, true peak maksimum -3 dBTP. Output gameplay_theme.mp3.
```

### Prompt `click`

```text
Buat efek UI orisinal “Sentuh Lentera”, blip 8-bit lembut sepanjang 0,10 detik, satu kali/non-loop. Triangle atau square yang dilunakkan, envelope serangan singkat dan decay halus, tanpa ambience, vokal, atau bunyi klik digital keras. Emosi ramah dan ringan. Tidak memerlukan tempo tetap. Puncak maksimum -6 dBFS, volume lebih rendah dari efek kemenangan. Jangan meniru bunyi merek atau game lain. Output click.mp3.
```

### Prompt `correct`

```text
Buat efek jawaban tepat orisinal “Cahaya Tepat”, arpeggio chiptune empat nada naik, durasi 0,40 detik, non-loop sekali saja. Square lembut/triangle, cerah dan menyenangkan untuk murid kelas V, tanpa frekuensi menusuk, vokal atau ambience. Envelope halus dan akhir cepat. Ritme pendek bebas, bukan lagu. Puncak maksimum -6 dBFS; pertahankan kenyamanan saat dimainkan berulang. Jangan meniru melodi komersial. Output correct.mp3.
```

### Prompt `wrong`

```text
Buat efek umpan balik ramah “Tenang Kembali”: dua nada triangle turun dengan warna 8-bit retro, durasi 0,36 detik, non-loop. Emosi menenangkan dan mengajak memperbaiki, bukan hukuman atau kejutan. Serangan dan decay halus, tanpa buzzer keras, ledakan, vokal atau ambience. Tidak perlu BPM tetap. Puncak maksimum -8 dBFS, sedikit lebih lembut daripada efek benar. Motif orisinal. Output wrong.mp3.
```

### Prompt `win`

```text
Buat fanfare chiptune orisinal “Rimba Terjaga”, 120 BPM, durasi sekitar 2,24 detik, sekali/non-loop. Melodi square lembut naik, harmoni triangle dan sedikit percussion noise. Riang, tuntas, hangat untuk anak SD; bukan megah berlebihan. Tanpa vokal, teriakan, ledakan, tail panjang atau melodi artis. Target -18 LUFS pendek, true peak maksimum -3 dBTP, envelope halus. Output win.mp3.
```

### Prompt `lose`

```text
Buat jingle chiptune orisinal “Jejak Berikutnya”, sekitar 100 BPM, durasi 1,65 detik, non-loop. Nada triangle turun lembut, akhiri dengan resolusi ramah yang mengundang mencoba kembali. Tenang dan tidak mempermalukan pemain. Tanpa vokal, ejekan, buzzer, ambience atau ledakan. Volume sekitar -22 LUFS pendek, true peak maksimum -6 dBTP. Motif baru, bukan lagu artis. Output lose.mp3.
```

### Manifest audio opsional

```text
asset/audio/menu_theme.mp3
asset/audio/gameplay_theme.mp3
asset/audio/click.mp3
asset/audio/correct.mp3
asset/audio/wrong.mp3
asset/audio/win.mp3
asset/audio/lose.mp3
```

**Ketujuh MP3 belum dibuat dan tidak disertakan.** Seluruh cue sudah memiliki padanan sintetis. Setiap berkas diperiksa sendiri memakai HTMLAudioElement, tanpa fetch/HEAD, dengan timeout 2,5 detik. Berkas yang gagal, rusak, tidak didukung, atau ditolak saat `play()` memakai padanan sintetis. Satu cue hanya menggunakan satu sumber pada satu waktu; respons muat terlambat menunggu transisi berikutnya dan tidak mengganti musik layar lama. Tidak ada pengulangan percobaan autoplay tanpa interaksi. File opsional tidak menghalangi Mulai.

## Dependensi dan lisensi

Runtime permainan: JavaScript, Canvas 2D, getUserMedia, Web Audio, HTMLAudioElement, Pointer Events bawaan browser. Detektor: implementasi selisih piksel lokal, tanpa model/WASM atau dependensi pihak ketiga. Font: font sistem lokal. Server: modul bawaan Node.js, tanpa paket NPM. Tidak ada CDN. Gambar: dibuat khusus menggunakan ImageGen bawaan untuk proyek ini. Musik dan efek: pola sintetis orisinal dalam kode. Materi soal: susunan orisinal; rujukan konsep tercantum dalam PANDUAN.md. Tidak ada file model atau audio final yang diklaim tersedia.
