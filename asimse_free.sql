-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Jul 2025 pada 19.51
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asimse_free`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_notif`
--

CREATE TABLE `c_notif` (
  `id` char(50) NOT NULL,
  `no_referensi` char(10) NOT NULL,
  `email_target` char(100) NOT NULL,
  `email_client` char(100) NOT NULL,
  `read` enum('Y','N') NOT NULL DEFAULT 'N',
  `tanggal` datetime NOT NULL,
  `keterangan` text NOT NULL,
  `jenis` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `l_kelas`
--

CREATE TABLE `l_kelas` (
  `l_kelas_id` int(11) NOT NULL,
  `kd_sekolah` char(11) NOT NULL,
  `tingkat` char(11) NOT NULL,
  `kelas` varchar(15) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `l_kelas`
--

INSERT INTO `l_kelas` (`l_kelas_id`, `kd_sekolah`, `tingkat`, `kelas`, `create_date`) VALUES
(1, '', 'VII', 'VII', '2022-08-01 05:54:11'),
(2, '', 'VIII', 'VIII', '2022-08-01 05:54:18'),
(3, '', 'IX', 'IX', '2022-08-01 05:54:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `l_tahun`
--

CREATE TABLE `l_tahun` (
  `id_tahun` int(11) NOT NULL,
  `tahun_aktif` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `l_tahun`
--

INSERT INTO `l_tahun` (`id_tahun`, `tahun_aktif`) VALUES
(1, '2015'),
(2, '2016'),
(3, '2017'),
(4, '2018'),
(5, '2019'),
(6, '2020'),
(7, '2021'),
(8, '2022'),
(9, '2023'),
(10, '2024'),
(11, '2025');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_beasiswa`
--

CREATE TABLE `m_beasiswa` (
  `beasiswa_id` int(11) NOT NULL,
  `nis` char(15) NOT NULL,
  `nik` char(25) NOT NULL,
  `nama_siswa` varchar(191) NOT NULL,
  `tempat_lahir` varchar(191) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `th_pelajaran` varchar(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `datecreate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `m_beasiswa`
--

INSERT INTO `m_beasiswa` (`beasiswa_id`, `nis`, `nik`, `nama_siswa`, `tempat_lahir`, `tanggal_lahir`, `th_pelajaran`, `keterangan`, `status`, `datecreate`) VALUES
(1, '222222222222222', '0', 'aaaaaaaaaa', '', '0000-00-00', '2021/2022', 'belum ada', 1, '2022-08-02 04:55:08'),
(3, '333333333333333', '', 'ddd', '', '0000-00-00', 'dddd', 'ddd', 1, '2022-08-02 04:55:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_contacts`
--

CREATE TABLE `m_contacts` (
  `no` int(11) NOT NULL,
  `nama` text DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `wa` text DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `softfile` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_desa`
--

CREATE TABLE `m_desa` (
  `id` int(11) NOT NULL,
  `kecamatan_id` int(11) NOT NULL,
  `desa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `m_desa`
--

INSERT INTO `m_desa` (`id`, `kecamatan_id`, `desa`) VALUES
(1, 1, 'Putat Nutug');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_kecamatan`
--

CREATE TABLE `m_kecamatan` (
  `kecamatan_id` int(11) NOT NULL,
  `kota_id` int(11) NOT NULL,
  `kecamatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `m_kecamatan`
--

INSERT INTO `m_kecamatan` (`kecamatan_id`, `kota_id`, `kecamatan`) VALUES
(1, 1, 'Ciseeng');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_kelas`
--

CREATE TABLE `m_kelas` (
  `id` int(3) NOT NULL,
  `tingkat` char(11) DEFAULT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_kelas`
--

INSERT INTO `m_kelas` (`id`, `tingkat`, `nama`) VALUES
(1, 'VII', 'VII'),
(2, 'VIII', 'VIII'),
(3, 'IX', 'IX');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_kota`
--

CREATE TABLE `m_kota` (
  `kota_id` int(11) NOT NULL,
  `provinsi_id` int(11) NOT NULL,
  `kota` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `m_kota`
--

INSERT INTO `m_kota` (`kota_id`, `provinsi_id`, `kota`) VALUES
(1, 1, 'Bogor');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_lulus`
--

CREATE TABLE `m_lulus` (
  `lulus_id` int(11) NOT NULL,
  `npsn` char(15) NOT NULL,
  `no_surat` varchar(191) NOT NULL,
  `tahun_pelajaran` varchar(15) NOT NULL,
  `nama_siswa` varchar(191) NOT NULL,
  `nis` int(15) NOT NULL,
  `nisn` char(15) NOT NULL,
  `tempat_lahir` varchar(191) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `alamat_siswa` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `prodi` varchar(11) NOT NULL,
  `nama_orangtua` varchar(191) NOT NULL,
  `datecreate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `m_lulus`
--

INSERT INTO `m_lulus` (`lulus_id`, `npsn`, `no_surat`, `tahun_pelajaran`, `nama_siswa`, `nis`, `nisn`, `tempat_lahir`, `tanggal_lahir`, `keterangan`, `alamat_siswa`, `status`, `jenis_kelamin`, `prodi`, `nama_orangtua`, `datecreate`) VALUES
(1, '10001', 'AA-121-21', '2023/2024', 'Sri agustina', 12345678, '12345678', 'Kelarik', '2025-07-31', 'LULUS', '-', 1, 'L', '', '', '2025-07-30 17:41:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_lulus_data`
--

CREATE TABLE `m_lulus_data` (
  `id_data` int(11) NOT NULL,
  `kata_pembuka` text NOT NULL,
  `kata_isi` text NOT NULL,
  `kata_penutup` text NOT NULL,
  `tanggal_publis` datetime NOT NULL,
  `ttd_kepsek` varchar(191) NOT NULL,
  `logo` varchar(191) NOT NULL,
  `kota` varchar(191) NOT NULL,
  `isi_shus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `m_lulus_data`
--

INSERT INTO `m_lulus_data` (`id_data`, `kata_pembuka`, `kata_isi`, `kata_penutup`, `tanggal_publis`, `ttd_kepsek`, `logo`, `kota`, `isi_shus`) VALUES
(0, '', '', '', '1970-01-02 07:00:00', '!5.jpg', 'header.png', 'Lainnya', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_mapel`
--

CREATE TABLE `m_mapel` (
  `id` int(3) NOT NULL,
  `tingkat` char(11) NOT NULL,
  `kelompok` enum('A','B','C','C1','D') NOT NULL,
  `tambahan_sub` enum('NO','PAI','MULOK') NOT NULL,
  `kd_singkat` varchar(10) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `kkm` int(2) NOT NULL,
  `is_sikap` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_mapel`
--

INSERT INTO `m_mapel` (`id`, `tingkat`, `kelompok`, `tambahan_sub`, `kd_singkat`, `nama`, `kkm`, `is_sikap`) VALUES
(1, 'smp', 'A', 'NO', 'AGM', 'Pendidikan Agama dan Budi Pekerti', 0, '0'),
(2, 'smp', 'A', 'NO', 'PPKn', 'Pendidikan Pancasila dan Kewarganegaraan', 0, '0'),
(3, 'smp', 'A', 'NO', 'MTK', 'Matematika', 0, '0'),
(4, 'smp', 'A', 'NO', 'BHS', 'Bahasa Indonesia', 0, '0'),
(5, 'smp', 'A', 'NO', 'IPA', 'Ilmu Pengetahuan Alam', 0, '0'),
(6, 'smp', 'A', 'NO', 'IPS', 'Ilmu Pengetahuan Sosial', 0, '0'),
(7, 'smp', 'A', 'NO', 'BING', 'Bahasa Inggris', 0, '0'),
(8, 'smp', 'B', 'NO', 'SB', 'Seni Budaya', 0, '0'),
(9, 'smp', 'B', 'NO', 'PJDS', 'Pendidikan Jasmani dan Kesehatan', 0, '0'),
(10, 'smp', 'B', 'NO', 'PR', 'Prakarya', 0, '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_provinsi`
--

CREATE TABLE `m_provinsi` (
  `provinsi_id` int(11) NOT NULL,
  `provinsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `m_provinsi`
--

INSERT INTO `m_provinsi` (`provinsi_id`, `provinsi`) VALUES
(1, 'Jawa Barat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_sekolah`
--

CREATE TABLE `m_sekolah` (
  `sekolah_id` int(11) NOT NULL,
  `kd_campus` char(11) NOT NULL,
  `kd_sekolah` char(11) NOT NULL,
  `nss` char(15) NOT NULL,
  `npsn` char(15) NOT NULL,
  `nama_sekolah` varchar(191) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `sekolah_provinsi_id` int(11) NOT NULL,
  `sekolah_kota_id` int(11) NOT NULL,
  `sekolah_kecamatan_id` int(11) NOT NULL,
  `telp` varchar(18) NOT NULL,
  `kodepos` varchar(11) NOT NULL,
  `email` varchar(191) NOT NULL,
  `web` varchar(191) NOT NULL,
  `sebutan_kepala` varchar(191) NOT NULL,
  `nip` char(15) NOT NULL,
  `kurikulum` longtext NOT NULL,
  `sejarah` longtext NOT NULL,
  `kop_1` varchar(191) NOT NULL,
  `kop_2` varchar(191) NOT NULL,
  `logo` varchar(191) NOT NULL,
  `akreditasi` varchar(191) NOT NULL,
  `visi_misi` text NOT NULL,
  `mars` text NOT NULL,
  `favicon` varchar(50) NOT NULL,
  `klikchat` text NOT NULL,
  `livechat` text NOT NULL,
  `nolivechat` varchar(50) NOT NULL,
  `infobayar` text NOT NULL,
  `syarat` text NOT NULL,
  `instagram_src` varchar(256) NOT NULL,
  `instagram_usrc` varchar(256) NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_active_psb` int(1) NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `m_sekolah`
--

INSERT INTO `m_sekolah` (`sekolah_id`, `kd_campus`, `kd_sekolah`, `nss`, `npsn`, `nama_sekolah`, `alamat`, `sekolah_provinsi_id`, `sekolah_kota_id`, `sekolah_kecamatan_id`, `telp`, `kodepos`, `email`, `web`, `sebutan_kepala`, `nip`, `kurikulum`, `sejarah`, `kop_1`, `kop_2`, `logo`, `akreditasi`, `visi_misi`, `mars`, `favicon`, `klikchat`, `livechat`, `nolivechat`, `infobayar`, `syarat`, `instagram_src`, `instagram_usrc`, `is_active`, `is_active_psb`, `date_create`) VALUES
(1, '', '', '10001', '10001', 'SEKOLAH ANAK DESA', 'Jl. Raya H. Usa', 1, 1, 1, '0856 9566 9612', '16120', 'anakdesa143@gmail.com', 'sad-smp.sch.id', 'Anak Desa', '-', '<p><b>Kurikulum 2013 (K-13/Kurtilas)</b>&nbsp;adalah&nbsp;<a href=\"https://id.wikipedia.org/wiki/Kurikulum\" title=\"Kurikulum\">kurikulum</a>&nbsp;yang berlaku dalam&nbsp;<a href=\"https://id.wikipedia.org/wiki/Pendidikan_di_Indonesia\" title=\"Pendidikan di Indonesia\">Sistem Pendidikan Indonesia</a>. Kurikulum ini merupakan kurikulum tetap diterapkan oleh pemerintah untuk menggantikan Kurikulum-2006 (yang sering disebut sebagai&nbsp;<a href=\"https://id.wikipedia.org/wiki/Kurikulum_Tingkat_Satuan_Pendidikan\" title=\"Kurikulum Tingkat Satuan Pendidikan\">Kurikulum Tingkat Satuan Pendidikan</a>) yang telah berlaku selama kurang lebih 6 tahun. Kurikulum 2013 masuk dalam masa percobaannya pada tahun&nbsp;<a href=\"https://id.wikipedia.org/wiki/2013\" title=\"2013\">2013</a>&nbsp;dengan menjadikan beberapa sekolah menjadi sekolah rintisan.</p>\r\n\r\n<p>Pada tahun ajaran 2013/2014, tepatnya sekitar pertengahan tahun 2013, Kurikulum 2013 diimplementasikan secara terbatas pada sekolah perintis, yakni pada kelas I dan IV untuk tingkat&nbsp;<a href=\"https://id.wikipedia.org/wiki/Sekolah_Dasar\" title=\"Sekolah Dasar\">Sekolah Dasar</a>, kelas VII untuk&nbsp;<a href=\"https://id.wikipedia.org/wiki/SMP\" title=\"SMP\">SMP</a>, dan kelas X untuk jenjang SMA/SMK, sedangkan pada tahun&nbsp;<a href=\"https://id.wikipedia.org/wiki/2014\" title=\"2014\">2014</a>, Kurikulum 2013 sudah diterapkan di Kelas I, II, IV, dan V sedangkan untuk SMP Kelas VII dan VIII dan SMA Kelas X dan XI. Jumlah sekolah yang menjadi sekolah perintis adalah sebanyak 6.326 sekolah tersebar di seluruh provinsi di Indonesia.<sup id=\"cite_ref-1\"><a href=\"https://id.wikipedia.org/wiki/Kurikulum_2013#cite_note-1\">[1]</a></sup></p>\r\n\r\n<p>Kurikulum 2013 memiliki empat aspek penilaian, yaitu aspek pengetahuan, aspek keterampilan, aspek sikap, dan perilaku. Di dalam Kurikulum 2013, terutama di dalam materi pembelajaran terdapat materi yang dirampingkan dan materi yang ditambahkan. Materi yang dirampingkan terlihat ada di materi&nbsp;<a href=\"https://id.wikipedia.org/wiki/Bahasa_Indonesia\" title=\"Bahasa Indonesia\">Bahasa Indonesia</a>,&nbsp;<a href=\"https://id.wikipedia.org/wiki/Ilmu_sosial\" title=\"Ilmu sosial\">IPS</a>,&nbsp;<a href=\"https://id.wikipedia.org/wiki/Kewarganegaraan\" title=\"Kewarganegaraan\">PPKn</a>, dan sebagainya sedangkan materi yang ditambahkan adalah materi&nbsp;<a href=\"https://id.wikipedia.org/wiki/Matematika\" title=\"Matematika\">Matematika</a>.<sup>[<i><a href=\"https://id.wikipedia.org/wiki/Wikipedia:Kutip_sumber_tulisan\" title=\"Wikipedia:Kutip sumber tulisan\">butuh rujukan</a></i>]</sup></p>\r\n\r\n<p>Materi pelajaran tersebut (terutama Matematika dan Ilmu Pengetahuan Alam) disesuaikan dengan materi pembelajaran standar Internasional (seperti&nbsp;<i><a href=\"https://id.wikipedia.org/wiki/Program_Penilaian_Pelajar_Internasional\" title=\"Program Penilaian Pelajar Internasional\">PISA</a></i>&nbsp;dan&nbsp;<i><a href=\"https://id.wikipedia.org/wiki/Kecenderungan_Pembelajaran_Matematika_dan_Sains_Internasional\" title=\"Kecenderungan Pembelajaran Matematika dan Sains Internasional\">TIMSS</a></i>) sehingga pemerintah berharap dapat menyeimbangkan pendidikan di dalam negeri dengan pendidikan di luar negeri.<sup id=\"cite_ref-2\"><a href=\"https://id.wikipedia.org/wiki/Kurikulum_2013#cite_note-2\">[2]</a></sup></p>\r\n\r\n<p>Berdasarkan Peraturan Menteri Pendidikan dan Kebudayaan,&nbsp;<a href=\"https://id.wikipedia.org/wiki/Anies_Baswedan\" title=\"Anies Baswedan\">Anies Baswedan</a>, nomor 60 tahun 2014 tanggal 11 Desember 2014, pelaksanaan Kurikulum 2013 dihentikan dan sekolah-sekolah untuk sementara kembali menggunakan&nbsp;<a href=\"https://id.wikipedia.org/wiki/Kurikulum_Tingkat_Satuan_Pendidikan\" title=\"Kurikulum Tingkat Satuan Pendidikan\">Kurikulum Tingkat Satuan Pendidikan</a>&nbsp;kecuali bagi satuan pendidikan dasar dan menengah yang sudah melaksanakannya selama 3 (tiga) semester, satuan pendidikan usia dini, dan satuan pendidikan khusus.<sup id=\"cite_ref-3\"><a href=\"https://id.wikipedia.org/wiki/Kurikulum_2013#cite_note-3\">[3]</a></sup><sup id=\"cite_ref-4\"><a href=\"https://id.wikipedia.org/wiki/Kurikulum_2013#cite_note-4\">[4]</a></sup>&nbsp;Penghentian tersebut bersifat sementara, paling lama sampai tahun pelajaran 2019/2020.<sup id=\"cite_ref-5\"><a href=\"https://id.wikipedia.org/wiki/Kurikulum_2013#cite_note-5\">[5]</a></sup></p>\r\n\r\n<h2>Aspek penilaian</h2>\r\n\r\n<p>Sikap dan perilaku (moral) adalah aspek penilaian yang teramat penting (nilai aspek 60%<sup>[<i><a href=\"https://id.wikipedia.org/wiki/Wikipedia:Kutip_sumber_tulisan\" title=\"Wikipedia:Kutip sumber tulisan\">butuh rujukan</a></i>]</sup>). Apabila salah seorang siswa melakukan sikap buruk, maka dianggap seluruh nilainya kurang<sup>[<i><a href=\"https://id.wikipedia.org/wiki/Wikipedia:Kutip_sumber_tulisan\" title=\"Wikipedia:Kutip sumber tulisan\">butuh rujukan</a></i>]</sup>. Ada empat aspek penilaian dalam K-13:</p>\r\n\r\n<ul>\r\n	<li>keterampilan (KI-4);</li>\r\n	<li>pengetahuan (KI-3);</li>\r\n	<li>sosial (KI-2); dan</li>\r\n	<li>spiritual (KI-1).</li>\r\n</ul>\r\n\r\n<h3>Sekolah Menengah Pertama / Madrasah Tsanawiyah (SMP/MTs)</h3>\r\n\r\n<ul>\r\n	<li><b>Kelompok A (Wajib)</b>\r\n\r\n	<ul>\r\n		<li>Pendidikan Agama dan Budi Pekerti</li>\r\n		<li>Pendidikan Pancasila dan Kewarganegaraan</li>\r\n		<li>Matematika</li>\r\n		<li>Bahasa Indonesia</li>\r\n		<li>Ilmu Pengetahuan Alam</li>\r\n		<li>Ilmu Pengetahuan Sosial</li>\r\n		<li>Bahasa Inggris</li>\r\n	</ul>\r\n	</li>\r\n	<li><b>Kelompok B (Pilihan)</b>\r\n	<ul>\r\n		<li>Seni Budaya (<i>Rupa/Musik/Tari/Teater</i>)</li>\r\n		<li>Pendidikan Jasmani dan Kesehatan</li>\r\n		<li>Prakarya (<i>Rekayasa/Kerajinan/Budidaya/Pengolahan</i>)</li>\r\n		<li>Bahasa Daerah (Sesuai dengan kebijakan sekolah masing-masing)</li>\r\n		<li>Bahasa Asing (Sesuai dengan kebijakan sekolah masing-masing)</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n', '<p>Asal muasal sekolah</p>\r\n\r\n<p><b>Sekolah</b>&nbsp;dirancang sebagai tempat pengajaran kepada siswa dengan bimbingan guru menggunakan sistem pendidikan formal yang telah ditentukan. Secara etimologi, istilah&nbsp;<b>sekolah</b>&nbsp;dalam bahasa Indonesia berasal dari bahasa latin, yaitu schola yang secara harfiah bermakna &ldquo;waktu lapang&rdquo; atau &ldquo;waktu senggang&rdquo;.</p>\r\n', '', '', 'Logo_Tutwuri2.png', 'akreditasi-sertifikat.jpg', '<p><b>A. &nbsp;VISI SEKOLAH</b></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp;&ldquo;Berprestasi dilandasi Iman, Taqwa dan Berbudaya Lingkungan serta Berwawasan Global&rdquo;</p>\r\n\r\n<p><strong>B. &nbsp;MISI SEKOLAH</strong></p>\r\n\r\n<p>1.&nbsp; &nbsp;Mewujudkan pendidikan untuk menghasilkan prestasi dan lulusa berkwalitas tinggi yang peduli dengan lingkungan hidup</p>\r\n\r\n<p>2. &nbsp; Mewujudkan sumber daya manusia yang beriman, produktif, kreatif, inofatif dan efektif</p>\r\n\r\n<p>3. &nbsp; Mewujudkan pengembangan inovasi pembelajaran sesuai tuntutan</p>\r\n\r\n<p>4. &nbsp; Mewujudkan sumber daya manusia yang peduli dalam mencegahan pencemaran, mencegahan kerusakan lingkungan dan melestarikan lingkungan hidup</p>\r\n\r\n<p>5. &nbsp; Mewujudkan sarana prasarana reprensentatif dan up to date</p>\r\n\r\n<p>6. &nbsp; Mewujudkan pengelolaan pendidikan yang professional</p>\r\n\r\n<p>7. &nbsp; Mewujudkan sistim penilaian yang berafiliasi</p>\r\n\r\n<p>8. &nbsp; Mewujudkan budaya yang berkualifikasi</p>\r\n\r\n<p>9. &nbsp; Mewujudkan Sekolah yang bersih,hijau dan meminimalis hasil sampah yang tidak bermanfaat</p>\r\n\r\n<p>10. Mewujudkan manusia Indonesia yang mampu berkontribusi pada kehidupan bermasyarakat, berbangsa, bernegara dalam peradaban dunia</p>\r\n\r\n<p>11. Mewujudkan generasi emas, sehat tanpa narkoba</p>\r\n', '<p><strong>Cipt: Reynaldo S.I.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Disini Tempat Kami Berkreasi</p>\r\n\r\n<p>Tuk&rsquo; Jadi Siswa Yang Kreatif</p>\r\n\r\n<p>Bertaqwa Landasan Hidup Kami</p>\r\n\r\n<p>Berprestasi Tujuan Kami SMANEBA</p>\r\n\r\n<p>Tempat kami Belajar</p>\r\n\r\n<p>Pencetak Insan Muda Bangsa</p>\r\n\r\n<p>Berpribadi Luhur Dan Berakhlaq Mulia</p>\r\n\r\n<p>Mutu Berdaya Saing Global</p>\r\n\r\n<p>Reff :</p>\r\n\r\n<p>Ayo &hellip;&hellip; Ayo Semua</p>\r\n\r\n<p>Torehkan Prestasi Tuk&rsquo; SMANEBA</p>\r\n\r\n<p>Jadikan Dia Gudang Juara Skolah</p>\r\n\r\n<p>Tercinta Kita Semua</p>\r\n\r\n<p>Sayangi , Cintai, SMANEBA slalu dihati</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Bareng, 10 September 2012</strong></p>\r\n\r\n<p>Lihat versi jpeg (dok. asli) :&nbsp;<a href=\"http://smanbareng.sch.id/wp-content/uploads/2020/07/mars-smaneba.jpg\">Mars Smaneba</a></p>\r\n\r\n<p>Download versi mp3 :&nbsp;<a href=\"http://smanbareng.sch.id/wp-content/uploads/2020/07/Mars-Smaneba.mp3\">Mars-Smaneba.mp3</a></p>\r\n', '', '', '', 'Mohon segera isi kembali kelengkapan data', '<p>Bayarlah sesuai petunjuk yang ada</p>\r\n', '<ul>\r\n <li>Akta Lahir</li>\r\n <li>KIA</li>\r\n <li>KK</li>\r\n</ul>\r\n\r\n<p> </p>\r\n', '', '', 1, 1, '2022-08-18 09:00:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_siswa`
--

CREATE TABLE `m_siswa` (
  `siswa_id` int(11) NOT NULL,
  `kd_campus` char(11) NOT NULL,
  `kd_sekolah` char(11) NOT NULL,
  `tingkat` char(11) NOT NULL,
  `th_active` char(4) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_daftar` varchar(20) NOT NULL,
  `nis` char(25) NOT NULL DEFAULT '0',
  `nisn` char(11) NOT NULL DEFAULT '0',
  `tmp_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `agama` varchar(10) NOT NULL,
  `sek_asal` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `status` varchar(2) NOT NULL,
  `anakke` int(2) NOT NULL,
  `notelp` varchar(13) NOT NULL,
  `sek_asal_alamat` varchar(50) NOT NULL,
  `diterima_kelas` varchar(15) NOT NULL,
  `diterima_tgl` date NOT NULL,
  `diterima_smt` varchar(3) NOT NULL,
  `ijazah_no` varchar(50) NOT NULL,
  `ijazah_thn` varchar(4) NOT NULL,
  `skhun_no` varchar(50) NOT NULL,
  `skhun_thn` varchar(4) NOT NULL,
  `ortu_ayah` varchar(50) NOT NULL,
  `ortu_ibu` varchar(50) NOT NULL,
  `ortu_ayah_pkj` varchar(30) NOT NULL,
  `ortu_ibu_pkj` varchar(30) NOT NULL,
  `ortu_alamat` varchar(50) NOT NULL,
  `ortu_notelp` varchar(13) NOT NULL,
  `desa` varchar(191) NOT NULL,
  `kecamatan` varchar(191) NOT NULL,
  `kota` varchar(191) NOT NULL,
  `provinsi` varchar(191) NOT NULL,
  `notelp_rumah` varchar(13) NOT NULL,
  `wali` varchar(20) NOT NULL,
  `wali_alamat` varchar(50) NOT NULL,
  `wali_pkj` varchar(13) NOT NULL,
  `inputID` int(2) NOT NULL,
  `tgl_input` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tgl_update` datetime NOT NULL,
  `stat_data` enum('A','K','M','L') NOT NULL,
  `foto` varchar(100) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_siswa`
--

INSERT INTO `m_siswa` (`siswa_id`, `kd_campus`, `kd_sekolah`, `tingkat`, `th_active`, `nama`, `no_daftar`, `nis`, `nisn`, `tmp_lahir`, `tgl_lahir`, `jk`, `agama`, `sek_asal`, `alamat`, `status`, `anakke`, `notelp`, `sek_asal_alamat`, `diterima_kelas`, `diterima_tgl`, `diterima_smt`, `ijazah_no`, `ijazah_thn`, `skhun_no`, `skhun_thn`, `ortu_ayah`, `ortu_ibu`, `ortu_ayah_pkj`, `ortu_ibu_pkj`, `ortu_alamat`, `ortu_notelp`, `desa`, `kecamatan`, `kota`, `provinsi`, `notelp_rumah`, `wali`, `wali_alamat`, `wali_pkj`, `inputID`, `tgl_input`, `tgl_update`, `stat_data`, `foto`, `is_active`) VALUES
(1, '', '', 'VII', '2022', 'Siswa 01', '', '222307001', '222307001', 'Kota', '2000-01-01', 'P', 'Agama', '', '', '', 0, '08090001', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(2, '', '', 'VII', '2022', 'Siswa 02', '', '222307002', '222307002', 'Kota', '2000-02-02', 'P', 'Agama', '', '', '', 0, '08090002', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(3, '', '', 'VII', '2022', 'Siswa 03', '', '222307003', '222307003', 'Kota', '2000-03-03', 'L', 'Agama', '', '', '', 0, '08090003', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(4, '', '', 'VII', '2022', 'Siswa 04', '', '222307004', '222307004', 'Kota', '2000-04-04', 'L', 'Agama', '', '', '', 0, '08090004', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(5, '', '', 'VII', '2022', 'Siswa 05', '', '222307005', '222307005', 'Kota', '2000-05-05', 'P', 'Agama', '', '', '', 0, '08090005', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(6, '', '', 'VII', '2022', 'Siswa 06', '', '222307006', '222307006', 'Kota', '2000-06-06', 'P', 'Agama', '', '', '', 0, '08090006', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(7, '', '', 'VII', '2022', 'Siswa 07', '', '222307007', '222307007', 'Kota', '2000-07-07', 'L', 'Agama', '', '', '', 0, '08090007', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(8, '', '', 'VII', '2022', 'Siswa 08', '', '222307008', '222307008', 'Kota', '2000-08-08', 'L', 'Agama', '', '', '', 0, '08090008', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(9, '', '', 'VII', '2022', 'Siswa 09', '', '222307009', '222307009', 'Kota', '2000-09-09', 'P', 'Agama', '', '', '', 0, '08090009', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(10, '', '', 'VII', '2022', 'Siswa 10', '', '222307010', '222307010', 'Kota', '2000-10-10', 'P', 'Agama', '', '', '', 0, '08090010', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(11, '', '', 'VII', '2022', 'Siswa 11', '', '222307011', '222307011', 'Kota', '2000-01-01', 'L', 'Agama', '', '', '', 0, '08090011', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(12, '', '', 'VII', '2022', 'Siswa 12', '', '222307012', '222307012', 'Kota', '2000-02-02', 'L', 'Agama', '', '', '', 0, '08090012', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(13, '', '', 'VII', '2022', 'Siswa 13', '', '222307013', '222307013', 'Kota', '2000-03-03', 'P', 'Agama', '', '', '', 0, '08090013', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(14, '', '', 'VII', '2022', 'Siswa 14', '', '222307014', '222307014', 'Kota', '2000-04-04', 'P', 'Agama', '', '', '', 0, '08090014', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(15, '', '', 'VII', '2022', 'Siswa 15', '', '222307015', '222307015', 'Kota', '2000-05-05', 'L', 'Agama', '', '', '', 0, '08090015', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(16, '', '', 'VII', '2022', 'Siswa 16', '', '222307016', '222307016', 'Kota', '2000-06-06', 'L', 'Agama', '', '', '', 0, '08090016', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(17, '', '', 'VII', '2022', 'Siswa 17', '', '222307017', '222307017', 'Kota', '2000-07-07', 'P', 'Agama', '', '', '', 0, '08090017', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(18, '', '', 'VII', '2022', 'Siswa 18', '', '222307018', '222307018', 'Kota', '2000-08-08', 'P', 'Agama', '', '', '', 0, '08090018', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(19, '', '', 'VII', '2022', 'Siswa 19', '', '222307019', '222307019', 'Kota', '2000-09-09', 'L', 'Agama', '', '', '', 0, '08090019', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(20, '', '', 'VII', '2022', 'Siswa 20', '', '222307020', '222307020', 'Kota', '2000-10-10', 'L', 'Agama', '', '', '', 0, '08090020', '', 'VII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:37:54', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(21, '', '', 'VIII', '2022', 'Siswa 21', '', '212207001', '212207001', 'Kota', '2000-01-01', 'P', 'Agama', '', '', '', 0, '08090001', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(22, '', '', 'VIII', '2022', 'Siswa 22', '', '212207002', '212207002', 'Kota', '2000-02-02', 'P', 'Agama', '', '', '', 0, '08090002', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(23, '', '', 'VIII', '2022', 'Siswa 23', '', '212207003', '212207003', 'Kota', '2000-03-03', 'L', 'Agama', '', '', '', 0, '08090003', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(24, '', '', 'VIII', '2022', 'Siswa 24', '', '212207004', '212207004', 'Kota', '2000-04-04', 'L', 'Agama', '', '', '', 0, '08090004', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(25, '', '', 'VIII', '2022', 'Siswa 25', '', '212207005', '212207005', 'Kota', '2000-05-05', 'P', 'Agama', '', '', '', 0, '08090005', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(26, '', '', 'VIII', '2022', 'Siswa 26', '', '212207006', '212207006', 'Kota', '2000-06-06', 'P', 'Agama', '', '', '', 0, '08090006', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(27, '', '', 'VIII', '2022', 'Siswa 27', '', '212207007', '212207007', 'Kota', '2000-07-07', 'L', 'Agama', '', '', '', 0, '08090007', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(28, '', '', 'VIII', '2022', 'Siswa 28', '', '212207008', '212207008', 'Kota', '2000-08-08', 'L', 'Agama', '', '', '', 0, '08090008', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(29, '', '', 'VIII', '2022', 'Siswa 29', '', '212207009', '212207009', 'Kota', '2000-09-09', 'P', 'Agama', '', '', '', 0, '08090009', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(30, '', '', 'VIII', '2022', 'Siswa 30', '', '212207010', '212207010', 'Kota', '2000-10-10', 'P', 'Agama', '', '', '', 0, '08090010', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(31, '', '', 'VIII', '2022', 'Siswa 31', '', '212207011', '212207011', 'Kota', '2000-01-01', 'L', 'Agama', '', '', '', 0, '08090011', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(32, '', '', 'VIII', '2022', 'Siswa 32', '', '212207012', '212207012', 'Kota', '2000-02-02', 'L', 'Agama', '', '', '', 0, '08090012', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(33, '', '', 'VIII', '2022', 'Siswa 33', '', '212207013', '212207013', 'Kota', '2000-03-03', 'P', 'Agama', '', '', '', 0, '08090013', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(34, '', '', 'VIII', '2022', 'Siswa 34', '', '212207014', '212207014', 'Kota', '2000-04-04', 'P', 'Agama', '', '', '', 0, '08090014', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(35, '', '', 'VIII', '2022', 'Siswa 35', '', '212207015', '212207015', 'Kota', '2000-05-05', 'L', 'Agama', '', '', '', 0, '08090015', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(36, '', '', 'VIII', '2022', 'Siswa 36', '', '212207016', '212207016', 'Kota', '2000-06-06', 'L', 'Agama', '', '', '', 0, '08090016', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(37, '', '', 'VIII', '2022', 'Siswa 37', '', '212207017', '212207017', 'Kota', '2000-07-07', 'P', 'Agama', '', '', '', 0, '08090017', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(38, '', '', 'VIII', '2022', 'Siswa 38', '', '212207018', '212207018', 'Kota', '2000-08-08', 'P', 'Agama', '', '', '', 0, '08090018', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(39, '', '', 'VIII', '2022', 'Siswa 39', '', '212207019', '212207019', 'Kota', '2000-09-09', 'L', 'Agama', '', '', '', 0, '08090019', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(40, '', '', 'VIII', '2022', 'Siswa 40', '', '212207020', '212207020', 'Kota', '2000-10-10', 'L', 'Agama', '', '', '', 0, '08090020', '', 'VIII', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:39:48', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(41, '', '', 'IX', '2022', 'Siswa 41', '', '202107001', '202107001', 'Kota', '2000-01-01', 'P', 'Agama', '', '', '', 0, '08090001', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(42, '', '', 'IX', '2022', 'Siswa 42', '', '202107002', '202107002', 'Kota', '2000-02-02', 'P', 'Agama', '', '', '', 0, '08090002', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(43, '', '', 'IX', '2022', 'Siswa 43', '', '202107003', '202107003', 'Kota', '2000-03-03', 'L', 'Agama', '', '', '', 0, '08090003', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(44, '', '', 'IX', '2022', 'Siswa 44', '', '202107004', '202107004', 'Kota', '2000-04-04', 'L', 'Agama', '', '', '', 0, '08090004', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(45, '', '', 'IX', '2022', 'Siswa 45', '', '202107005', '202107005', 'Kota', '2000-05-05', 'P', 'Agama', '', '', '', 0, '08090005', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(46, '', '', 'IX', '2022', 'Siswa 46', '', '202107006', '202107006', 'Kota', '2000-06-06', 'P', 'Agama', '', '', '', 0, '08090006', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(47, '', '', 'IX', '2022', 'Siswa 47', '', '202107007', '202107007', 'Kota', '2000-07-07', 'L', 'Agama', '', '', '', 0, '08090007', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(48, '', '', 'IX', '2022', 'Siswa 48', '', '202107008', '202107008', 'Kota', '2000-08-08', 'L', 'Agama', '', '', '', 0, '08090008', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(49, '', '', 'IX', '2022', 'Siswa 49', '', '202107009', '202107009', 'Kota', '2000-09-09', 'P', 'Agama', '', '', '', 0, '08090009', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(50, '', '', 'IX', '2022', 'Siswa 50', '', '202107010', '202107010', 'Kota', '2000-10-10', 'P', 'Agama', '', '', '', 0, '08090010', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(51, '', '', 'IX', '2022', 'Siswa 51', '', '202107011', '202107011', 'Kota', '2000-01-01', 'L', 'Agama', '', '', '', 0, '08090011', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(52, '', '', 'IX', '2022', 'Siswa 52', '', '202107012', '202107012', 'Kota', '2000-02-02', 'L', 'Agama', '', '', '', 0, '08090012', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(53, '', '', 'IX', '2022', 'Siswa 53', '', '202107013', '202107013', 'Kota', '2000-03-03', 'P', 'Agama', '', '', '', 0, '08090013', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(54, '', '', 'IX', '2022', 'Siswa 54', '', '202107014', '202107014', 'Kota', '2000-04-04', 'P', 'Agama', '', '', '', 0, '08090014', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(55, '', '', 'IX', '2022', 'Siswa 55', '', '202107015', '202107015', 'Kota', '2000-05-05', 'L', 'Agama', '', '', '', 0, '08090015', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(56, '', '', 'IX', '2022', 'Siswa 56', '', '202107016', '202107016', 'Kota', '2000-06-06', 'L', 'Agama', '', '', '', 0, '08090016', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(57, '', '', 'IX', '2022', 'Siswa 57', '', '202107017', '202107017', 'Kota', '2000-07-07', 'P', 'Agama', '', '', '', 0, '08090017', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(58, '', '', 'IX', '2022', 'Siswa 58', '', '202107018', '202107018', 'Kota', '2000-08-08', 'P', 'Agama', '', '', '', 0, '08090018', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(59, '', '', 'IX', '2022', 'Siswa 59', '', '202107019', '202107019', 'Kota', '2000-09-09', 'L', 'Agama', '', '', '', 0, '08090019', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0),
(60, '', '', 'IX', '2022', 'Siswa 60', '', '202107020', '202107020', 'Kota', '2000-10-10', 'L', 'Agama', '', '', '', 0, '08090020', '', 'IX', '2022-07-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2022-08-18 04:41:45', '0000-00-00 00:00:00', 'K', 'default.jpg', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_vaksin`
--

CREATE TABLE `m_vaksin` (
  `id_vaksin` int(11) NOT NULL,
  `nik` char(30) NOT NULL,
  `nama_siswa` varchar(191) NOT NULL,
  `tempat_lahir` varchar(191) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `vaksin_1` varchar(191) NOT NULL,
  `vaksin_2` varchar(191) NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `m_vaksin`
--

INSERT INTO `m_vaksin` (`id_vaksin`, `nik`, `nama_siswa`, `tempat_lahir`, `tanggal_lahir`, `vaksin_1`, `vaksin_2`, `createdate`) VALUES
(1, '111111111111111111', 'aaaaaaaaaaaaaaaa', '', '0000-00-00', 'gamabar_profil.PNG', 'web_sekolah.PNG', '2022-08-02 04:51:05'),
(2, '222222222222222222', 'aaaaaaaa', '', '0000-00-00', 'Login_Guru.PNG', 'Login_Kepsek.PNG', '2022-08-02 04:56:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `nik` char(15) NOT NULL,
  `departemen_id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `lokasi_id` int(11) NOT NULL,
  `kd_campus` char(11) NOT NULL,
  `kd_sekolah` char(11) NOT NULL,
  `nip` char(15) NOT NULL,
  `nama_pegawai` varchar(255) NOT NULL,
  `email_pegawai` varchar(255) NOT NULL,
  `username` varchar(125) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salah_password` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `img` varchar(100) NOT NULL,
  `qr_code_image` varchar(125) NOT NULL,
  `is_active` int(1) NOT NULL,
  `qr_code_use` int(2) NOT NULL,
  `is_online` int(1) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `blokir` enum('0','1') NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `kode_pegawai` varchar(125) NOT NULL,
  `bagian_shift` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`nik`, `departemen_id`, `jabatan_id`, `lokasi_id`, `kd_campus`, `kd_sekolah`, `nip`, `nama_pegawai`, `email_pegawai`, `username`, `password`, `salah_password`, `role_id`, `img`, `qr_code_image`, `is_active`, `qr_code_use`, `is_online`, `last_login`, `blokir`, `date_create`, `kode_pegawai`, `bagian_shift`) VALUES
('0001', 0, 0, 0, '', '', '', 'Guru1', 'Guru1@sad-smp.sch.id', '', '$2y$10$lCpm2rrahI/x8PNpmEuAYO1DRv/J40Fsg3D84qkSWdsYICJr8c616', 0, 23, 'avatar6.png', '', 1, 0, 0, NULL, '0', '2022-08-25 03:06:36', '', 'ON'),
('0002', 0, 0, 0, '', '', '', 'Guru2', 'Guru2@sad-smp.sch.id', '', '$2y$10$1RbEtqcPE2hGMVpNFoyw/.rpnPEk87cKTJQ8bM085Ml4/YBb8Z2JG', 0, 26, 'avatar51.png', '', 1, 0, 0, NULL, '0', '2022-08-18 15:50:34', '', 'ON'),
('0003', 0, 0, 0, '', '', '', 'Guru3', 'Guru3@sad-smp.sch.id', '', '$2y$10$.79t6jjqf8oxMB0xFbz8FOqYz9eIzEdi1Axem1aiDh1Ll0Q3gb5zu', 0, 18, 'avatar3.png', '', 1, 0, 0, NULL, '0', '2022-08-18 15:00:49', '', 'ON'),
('0004', 0, 0, 0, '', '', '', 'Guru4', 'Guru4@sad-smp.sch.id', '', '$2y$10$2rWj7LpALKaISfZnpsQg4e26prfLXPTTnWx7u0V/sS82sLzx5KGVe', 0, 24, 'avatar2.png', '', 1, 0, 0, NULL, '0', '2022-08-18 04:43:41', '', 'ON'),
('0005', 0, 0, 0, '', '', '', 'Guru5', 'Guru5@sad-smp.sch.id', '', '$2y$10$ivrwUwS2.JfV02dm9Mkmae/cIPjrg95pnwFaciSIBaIFNMyMEjkIu', 0, 25, 'default.jpg', '', 1, 0, 0, NULL, '0', '2022-08-18 04:16:23', '', 'ON'),
('12345678900', 1, 1, 1, '', '', '', 'Admnistrator', 'admin@sad-smp.sch.id', '', '$2y$10$2PAssh79p9Q9S7peKL2douCr3K6M8oDCiq2e34nnDn1jAT6fpMUBu', 0, 1, 'avatar-1.png', '', 1, 0, 0, NULL, '0', '2025-07-30 17:28:25', '', 'ON');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai_access_menu`
--

CREATE TABLE `pegawai_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pegawai_access_menu`
--

INSERT INTO `pegawai_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(15, 18, 2),
(17, 18, 4),
(18, 18, 5),
(19, 18, 6),
(20, 18, 7),
(21, 18, 3),
(22, 18, 8),
(23, 18, 9),
(24, 18, 10),
(25, 18, 11),
(26, 18, 12),
(27, 19, 2),
(28, 19, 3),
(33, 20, 6),
(34, 20, 7),
(35, 20, 8),
(37, 1, 15),
(38, 18, 15),
(39, 22, 15),
(40, 1, 16),
(42, 1, 14),
(43, 1, 26),
(44, 1, 2),
(45, 1, 27),
(46, 1, 28),
(47, 1, 29),
(48, 1, 30),
(49, 1, 31),
(50, 18, 13),
(51, 18, 14),
(52, 18, 16),
(53, 19, 4),
(54, 19, 5),
(55, 20, 9),
(56, 20, 10),
(57, 21, 11),
(58, 21, 12),
(59, 22, 14),
(60, 22, 16),
(62, 1, 32),
(63, 1, 33),
(64, 1, 34),
(65, 1, 35),
(66, 1, 36),
(72, 24, 32),
(73, 24, 33),
(74, 24, 34),
(75, 24, 35),
(76, 24, 36),
(77, 24, 31),
(78, 24, 16),
(79, 24, 12),
(80, 24, 10),
(81, 23, 36),
(82, 23, 31),
(83, 23, 16),
(84, 23, 12),
(85, 23, 10),
(86, 23, 9),
(87, 23, 8),
(88, 1, 37),
(89, 18, 37),
(91, 18, 38),
(92, 25, 34),
(93, 26, 34),
(94, 26, 35),
(95, 26, 36),
(96, 25, 36),
(99, 1, 39),
(100, 1, 38),
(101, 1, 1),
(102, 1, 40);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai_data`
--

CREATE TABLE `pegawai_data` (
  `data_id` int(11) NOT NULL,
  `nik` char(25) NOT NULL,
  `email_pribadi` varchar(255) NOT NULL,
  `email` char(100) NOT NULL,
  `nama_lengkap` char(100) NOT NULL,
  `alamat` varchar(500) NOT NULL,
  `telp` varchar(25) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_keluar` date NOT NULL,
  `departemen_id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `lokasi_id` int(11) NOT NULL,
  `atasan1` char(100) NOT NULL,
  `atasan2` char(100) NOT NULL,
  `hrd` char(100) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pegawai_data`
--

INSERT INTO `pegawai_data` (`data_id`, `nik`, `email_pribadi`, `email`, `nama_lengkap`, `alamat`, `telp`, `foto`, `tgl_lahir`, `tgl_masuk`, `tgl_keluar`, `departemen_id`, `jabatan_id`, `lokasi_id`, `atasan1`, `atasan2`, `hrd`, `create_date`) VALUES
(18, '0001', '001@gmail.com', 'Guru1@sad-smp.sch.id', 'Guru1', 'Bogor', '8600001', 'default.jpg', '2000-02-20', '2021-01-19', '0000-00-00', 0, 0, 0, '', '', '', '2022-08-18 04:15:16'),
(19, '0002', '002@gmail.com', 'Guru2@sad-smp.sch.id', 'Guru2', 'Bogor', '8600002', 'default.jpg', '2000-02-20', '2021-01-20', '0000-00-00', 0, 0, 0, '', '', '', '2022-08-18 04:15:16'),
(20, '0003', '003@gmail.com', 'Guru3@sad-smp.sch.id', 'Guru3', 'Bogor', '8600003', 'default.jpg', '2000-02-20', '2021-01-21', '0000-00-00', 0, 0, 0, '', '', '', '2022-08-18 04:15:16'),
(21, '0004', '004@gmail.com', 'Guru4@sad-smp.sch.id', 'Guru4', 'Bogor', '8600004', 'default.jpg', '2000-02-20', '2021-01-22', '0000-00-00', 0, 0, 0, '', '', '', '2022-08-18 04:15:16'),
(22, '0005', '005@gmail.com', 'Guru5@sad-smp.sch.id', 'Guru5', 'Bogor', '8600005', 'default.jpg', '2000-02-20', '2021-01-23', '0000-00-00', 0, 0, 0, '', '', '', '2022-08-18 04:15:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai_menu`
--

CREATE TABLE `pegawai_menu` (
  `id` int(11) NOT NULL,
  `nama_menu` char(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `m_icon` varchar(3000) DEFAULT NULL,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pegawai_menu`
--

INSERT INTO `pegawai_menu` (`id`, `nama_menu`, `url`, `m_icon`, `date_create`) VALUES
(1, 'Persiapan', 'data_persiapan', 'fa fa-cogs', '2022-07-29 09:17:00'),
(2, 'Web_Profil', 'web_data_profil', 'fa fa-thin fa-blog', '2025-07-29 18:38:02'),
(3, 'Web_Kesiswaan', 'web_data_kesiswaan', 'fa fa-thin fa-blog', '2025-07-29 18:38:07'),
(4, 'Web_Informasi', 'web_data_informasi', 'fa fa-thin fa-blog', '2025-07-29 18:38:14'),
(5, 'Web_Kegiatan', 'web_data_kegiatan', 'fa fa-thin fa-blog', '2025-07-29 18:38:20'),
(6, 'PPDB_Setting', 'ppdb_setting', 'fa fa-address-book', '2022-07-29 09:41:05'),
(7, 'PPDB_Biaya', 'ppdb_biaya', 'fa fa-address-book', '2022-07-29 09:41:25'),
(8, 'PPDB_Daftar', 'ppdb_pendaftar', 'fa fa-address-book', '2022-07-29 09:41:34'),
(9, 'PPDB_Info', 'ppdb_info', 'fa fa-address-book', '2022-07-29 09:41:46'),
(10, 'PPDB_Tes_Masuk', 'ppdb_tesmasuk', 'fa fa-address-book', '2022-07-29 09:41:53'),
(37, 'Lulus_Info', 'info_lulus', 'fas fa-user-graduate', '2025-07-30 18:20:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai_role`
--

CREATE TABLE `pegawai_role` (
  `id` int(11) NOT NULL,
  `role` varchar(191) NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pegawai_role`
--

INSERT INTO `pegawai_role` (`id`, `role`, `date_create`) VALUES
(1, 'administrator', '2020-12-30 05:53:29'),
(18, 'tata_usaha', '2022-02-10 15:17:11'),
(23, 'kepala_sekolah', '2022-03-06 04:15:28'),
(24, 'wakil_kurikulum', '2022-03-09 13:58:47'),
(25, 'guru', '2022-07-14 07:20:39'),
(26, 'walikelas', '2022-07-14 07:20:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai_sub_menu`
--

CREATE TABLE `pegawai_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `judul_menu` varchar(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `s_icon` varchar(191) NOT NULL,
  `is_active` int(1) NOT NULL,
  `order_id` int(11) NOT NULL,
  `hide` int(1) NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pegawai_sub_menu`
--

INSERT INTO `pegawai_sub_menu` (`id`, `menu_id`, `judul_menu`, `url`, `s_icon`, `is_active`, `order_id`, `hide`, `date_create`) VALUES
(1, 1, 'Master Provinsi', 'data_persiapan/persiapan_provinsi', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:43:54'),
(2, 1, 'Master Kota', 'data_persiapan/persiapan_kota', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:44:14'),
(3, 1, 'Master Kecamatan', 'data_persiapan/persiapan_kecamatan', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:44:18'),
(4, 1, 'Master Desa', 'data_persiapan/persiapan_desa', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:44:23'),
(5, 1, 'Master Kelas', 'data_persiapan/persiapan_kelas', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:44:29'),
(6, 2, 'Profil Sekolah', 'web_data_profil/profil_sekolah', 'fas fa-check-circle', 1, 1, 1, '2025-07-29 18:44:46'),
(7, 2, 'Profil KepSek', 'web_data_profil/profil_kepsek', 'fas fa-check-circle', 1, 1, 1, '2025-07-29 18:46:12'),
(8, 2, 'Profil Guru', 'web_data_profil/profil_guru', 'fas fa-check-circle', 1, 1, 1, '2025-07-29 18:46:17'),
(9, 2, 'Profil Slide', 'web_data_profil/profil_slide', 'fas fa-check-circle', 1, 1, 1, '2025-07-29 18:46:23'),
(11, 3, 'Ekstrakurikuler', 'web_data_kesiswaan/kesiswaan_ekstra', 'fas fa-check-circle', 1, 1, 1, '2025-07-29 18:46:29'),
(12, 3, 'Prestasi', 'web_data_kesiswaan/kesiswaan_prestasi', 'fas fa-check-circle', 1, 1, 1, '2025-07-29 18:46:35'),
(13, 6, 'Master Sekolah', 'ppdb_setting/master_sekolah', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:45:50'),
(14, 6, 'Master Jenis Daftar', 'ppdb_setting/master_jenis_daftar', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:45:58'),
(15, 6, 'Master Kuota', 'ppdb_setting/master_kuota', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:46:07'),
(16, 6, 'Master Periode', 'ppdb_setting/master_periode', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:46:36'),
(17, 6, 'Master Mapel', 'ppdb_setting/master_mapel', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:46:46'),
(18, 6, 'Master Bank', 'ppdb_setting/master_bank', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:46:56'),
(19, 7, 'Master Biaya', 'ppdb_biaya/master_biaya', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:47:07'),
(20, 7, 'Verifikasi Biaya', 'ppdb_biaya/verifikasi_biaya', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:47:19'),
(21, 7, 'Pembayaran', 'ppdb_biaya/pembayaran', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:47:29'),
(22, 8, 'Data Pendaftar', 'ppdb_pendaftar/data_pendaftar', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:47:39'),
(23, 8, 'Pendaftar Diterima', 'ppdb_pendaftar/pendaftar_diterima', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:47:49'),
(24, 8, 'Pendaftar Cadangan', 'ppdb_pendaftar/pendaftar_cadangan', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:48:01'),
(25, 9, 'Data kontak', 'ppdb_info/data_kontak', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:48:12'),
(26, 9, 'Pembayaran', 'ppdb_info/info_pembayaran', 'fas fa-check-circle', 1, 1, 1, '2022-07-29 21:48:23'),
(27, 9, 'Persyaratan', 'ppdb_info/info_persyaratan', 'fas fa-check-circle', 1, 1, 1, '2022-07-31 08:35:04'),
(28, 9, 'Pengumuman', 'ppdb_info/data_pengumuman', 'fas fa-check-circle', 1, 1, 1, '2022-07-31 08:35:20'),
(29, 10, 'Quiz', 'ppdb_tesmasuk/quiz', 'fas fa-check-circle', 1, 1, 1, '2022-07-31 08:35:29'),
(30, 4, 'Vaksin', 'web_data_informasi/vaksin', 'fas fa-check-circle', 1, 1, 1, '2025-07-29 18:56:36'),
(32, 4, 'Beasiswa', 'web_data_informasi/beasiswa', 'fas fa-check-circle', 1, 1, 1, '2025-07-29 18:57:45'),
(33, 5, 'Belajar', 'web_data_kegiatan/data_kegiatan/belajar', 'fas fa-check-circle', 1, 1, 1, '2025-07-29 18:59:16'),
(34, 5, 'Berita', 'web_data_kegiatan/data_kegiatan/berita', 'fas fa-check-circle', 1, 1, 1, '2025-07-29 18:59:28'),
(35, 5, 'Galery', 'web_data_kegiatan/data_kegiatan/galery', 'fas fa-check-circle', 1, 1, 1, '2025-07-29 18:59:34'),
(107, 2, 'Profil Fasilitas', 'web_data_profil/profil_fasilitas', 'fas fa-check-circle', 1, 1, 1, '2025-07-29 18:53:14'),
(108, 2, 'Profil Info', 'web_data_profil/profil_info', 'fas fa-check-circle', 1, 1, 1, '2025-07-29 18:53:59'),
(109, 37, 'Atur Surat Kelulusan', 'info_lulus/lulusInfo_isi', 'fas fa-check-circle', 1, 1, 1, '2025-07-29 19:03:50'),
(113, 3, 'OSIS', 'web_data_kesiswaan/kesiswaan_osis', 'fas fa-check-circle', 1, 1, 1, '2025-07-29 18:55:55'),
(116, 37, 'Atur Surat Kelulusan', 'info_lulus/lulusInfo_siswa', 'fas fa-check-circle', 1, 1, 1, '2025-07-29 19:03:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_bank`
--

CREATE TABLE `ppdb_bank` (
  `kode_bank` char(25) NOT NULL,
  `nama_bank` varchar(191) NOT NULL,
  `status` int(1) NOT NULL,
  `datecreate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ppdb_bank`
--

INSERT INTO `ppdb_bank` (`kode_bank`, `nama_bank`, `status`, `datecreate`) VALUES
('001', 'Bayar Cash', 1, '2022-08-02 08:17:29'),
('002', 'Bank BRI', 1, '2021-08-13 08:46:48'),
('008', 'Bank Mandiri', 1, '2021-08-13 08:47:03'),
('009', 'Bank BNI', 1, '2021-08-13 08:47:23'),
('014', 'Bank BCA', 1, '2021-08-13 08:47:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_bayar`
--

CREATE TABLE `ppdb_bayar` (
  `id_bayar` varchar(20) NOT NULL,
  `id_user` char(15) NOT NULL,
  `id_daftar` int(10) NOT NULL,
  `periode` varchar(191) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `bank` varchar(191) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `keterangan` varchar(191) DEFAULT NULL,
  `bukti` varchar(50) DEFAULT NULL,
  `verifikasi` int(1) NOT NULL DEFAULT 0,
  `hapus` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ppdb_bayar`
--

INSERT INTO `ppdb_bayar` (`id_bayar`, `id_user`, `id_daftar`, `periode`, `jumlah`, `bank`, `tgl_bayar`, `keterangan`, `bukti`, `verifikasi`, `hapus`) VALUES
('202208020001', '', 1, 'Gelombang 1', 200000, 'Bank BRI', '2022-08-02', 'Formulir Perdaftaran', 'Agustus.jpeg', 0, NULL),
('202208020002', '', 2, 'Siswa Mutasi', 300000, 'Bayar Cash', '2022-08-02', 'Formulir Pendaftaran Siswa Mutasi', 'Juli.jpeg', 0, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_biaya`
--

CREATE TABLE `ppdb_biaya` (
  `id_biaya` varchar(50) NOT NULL,
  `kd_campus` char(11) NOT NULL,
  `kd_sekolah` char(11) NOT NULL,
  `periode` varchar(191) NOT NULL,
  `nama_biaya` varchar(200) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `status` int(1) NOT NULL,
  `jenis_daftar` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ppdb_biaya`
--

INSERT INTO `ppdb_biaya` (`id_biaya`, `kd_campus`, `kd_sekolah`, `periode`, `nama_biaya`, `jumlah`, `status`, `jenis_daftar`) VALUES
('FPSB', '', '', 'Gelombang_1', 'Formulir Pendaftaran Siswa Baru', 200000, 1, 'Siswa_Baru'),
('FPSM', '', '', 'Siswa_Mutasi', 'Formulir Pendaftaran Siswa Mutasi', 300000, 1, 'Siswa_Mutasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_daftar`
--

CREATE TABLE `ppdb_daftar` (
  `id_daftar` int(11) NOT NULL,
  `kd_campus` char(11) NOT NULL,
  `kd_sekolah` char(11) NOT NULL,
  `no_daftar` varchar(20) DEFAULT NULL,
  `tahun_daftar` char(5) NOT NULL,
  `periode` varchar(191) NOT NULL,
  `jenis` varchar(50) DEFAULT NULL,
  `baju` varchar(10) DEFAULT NULL,
  `nis` char(30) DEFAULT NULL,
  `nisn` char(30) NOT NULL,
  `nik` char(50) DEFAULT NULL,
  `no_kk` char(30) DEFAULT NULL,
  `nama` varchar(128) NOT NULL,
  `tempat_lahir` varchar(128) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenkel` varchar(1) DEFAULT NULL,
  `agama` varchar(50) DEFAULT NULL,
  `no_hp` varchar(16) DEFAULT NULL,
  `npsn_asal` varchar(20) DEFAULT NULL,
  `asal_sekolah` varchar(128) DEFAULT NULL,
  `anak_ke` int(2) DEFAULT NULL,
  `saudara` int(11) DEFAULT NULL,
  `tinggi` int(3) DEFAULT NULL,
  `berat` int(3) DEFAULT NULL,
  `status_keluarga` varchar(50) DEFAULT NULL,
  `no_kip` varchar(30) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `rt` varchar(5) DEFAULT NULL,
  `rw` varchar(5) DEFAULT NULL,
  `desa` varchar(128) DEFAULT NULL,
  `kecamatan` varchar(128) DEFAULT NULL,
  `kota` varchar(128) DEFAULT NULL,
  `provinsi` varchar(128) DEFAULT NULL,
  `kode_pos` varchar(6) DEFAULT NULL,
  `tinggal` varchar(128) DEFAULT NULL,
  `jarak` varchar(128) DEFAULT NULL,
  `waktu` varchar(128) DEFAULT NULL,
  `transportasi` varchar(128) DEFAULT NULL,
  `foto` varchar(128) NOT NULL,
  `kelas` varchar(11) DEFAULT NULL,
  `jurusan` varchar(11) DEFAULT '',
  `jenjang` varchar(11) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `nik_ayah` varchar(16) DEFAULT NULL,
  `nama_ayah` varchar(128) DEFAULT NULL,
  `tempat_ayah` varchar(128) DEFAULT NULL,
  `tgl_lahir_ayah` date DEFAULT NULL,
  `status_ayah` varchar(128) DEFAULT NULL,
  `pendidikan_ayah` varchar(128) DEFAULT NULL,
  `pekerjaan_ayah` varchar(128) DEFAULT NULL,
  `penghasilan_ayah` varchar(128) DEFAULT NULL,
  `no_hp_ayah` varchar(16) DEFAULT NULL,
  `nik_ibu` varchar(16) DEFAULT NULL,
  `nama_ibu` varchar(128) DEFAULT NULL,
  `tempat_ibu` varchar(128) DEFAULT NULL,
  `tgl_lahir_ibu` date DEFAULT NULL,
  `status_ibu` varchar(128) DEFAULT NULL,
  `pendidikan_ibu` varchar(128) DEFAULT NULL,
  `pekerjaan_ibu` varchar(128) DEFAULT NULL,
  `penghasilan_ibu` varchar(128) DEFAULT NULL,
  `no_hp_ibu` varchar(16) DEFAULT NULL,
  `nik_wali` varchar(16) DEFAULT NULL,
  `nama_wali` varchar(128) DEFAULT NULL,
  `tempat_wali` varchar(128) DEFAULT NULL,
  `tgl_lahir_wali` date DEFAULT NULL,
  `pendidikan_wali` varchar(50) DEFAULT NULL,
  `pekerjaan_wali` varchar(50) DEFAULT NULL,
  `penghasilan_wali` varchar(50) DEFAULT NULL,
  `no_hp_wali` varchar(16) DEFAULT NULL,
  `no_ijazah` varchar(128) DEFAULT NULL,
  `no_shun` varchar(128) DEFAULT NULL,
  `no_ujian` varchar(128) DEFAULT NULL,
  `file_kip` varchar(256) DEFAULT NULL,
  `file_kk` varchar(256) DEFAULT NULL,
  `file_ijazah` varchar(256) DEFAULT NULL,
  `file_akte` varchar(256) DEFAULT NULL,
  `file_shun` varchar(256) DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `alasan_keluar` varchar(100) DEFAULT NULL,
  `surat_keluar` varchar(255) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `aktif` int(1) DEFAULT 0,
  `status` int(1) DEFAULT 0,
  `petugas_daftar` varchar(10) DEFAULT NULL,
  `petugas_konfirmasi` varchar(10) DEFAULT NULL,
  `tgl_daftar` varchar(5) DEFAULT NULL,
  `tgl_konfirmasi` date DEFAULT NULL,
  `bayar` varchar(100) DEFAULT NULL,
  `online` int(1) DEFAULT 0,
  `password` text DEFAULT NULL,
  `password_x` varchar(191) NOT NULL,
  `is_active` int(1) NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ppdb_daftar`
--

INSERT INTO `ppdb_daftar` (`id_daftar`, `kd_campus`, `kd_sekolah`, `no_daftar`, `tahun_daftar`, `periode`, `jenis`, `baju`, `nis`, `nisn`, `nik`, `no_kk`, `nama`, `tempat_lahir`, `tgl_lahir`, `jenkel`, `agama`, `no_hp`, `npsn_asal`, `asal_sekolah`, `anak_ke`, `saudara`, `tinggi`, `berat`, `status_keluarga`, `no_kip`, `alamat`, `rt`, `rw`, `desa`, `kecamatan`, `kota`, `provinsi`, `kode_pos`, `tinggal`, `jarak`, `waktu`, `transportasi`, `foto`, `kelas`, `jurusan`, `jenjang`, `email`, `nik_ayah`, `nama_ayah`, `tempat_ayah`, `tgl_lahir_ayah`, `status_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `no_hp_ayah`, `nik_ibu`, `nama_ibu`, `tempat_ibu`, `tgl_lahir_ibu`, `status_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `no_hp_ibu`, `nik_wali`, `nama_wali`, `tempat_wali`, `tgl_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `penghasilan_wali`, `no_hp_wali`, `no_ijazah`, `no_shun`, `no_ujian`, `file_kip`, `file_kk`, `file_ijazah`, `file_akte`, `file_shun`, `tgl_keluar`, `alasan_keluar`, `surat_keluar`, `level`, `aktif`, `status`, `petugas_daftar`, `petugas_konfirmasi`, `tgl_daftar`, `tgl_konfirmasi`, `bayar`, `online`, `password`, `password_x`, `is_active`, `createdate`) VALUES
(1, '', '', 'PPDB2223001', '', 'Gelombang_1', 'Siswa_Baru', NULL, NULL, '', '123456111111111111', NULL, 'siswa baru', 'aaa', '2022-08-02', NULL, NULL, '1234566778889999', '12345678', 'SD SWASTA ST.FRANSISKUS ASISI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default-avatar.png', 'VII', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2223', NULL, NULL, 0, '$2y$10$QjCZnWAMGs/580yURbj3euUIDa7TCy2FVSk7hk.w8Ufof/LgzDHtG', '12345', 1, '2022-08-02 15:51:31'),
(2, '', '', 'PPDB2122002', '', 'Siswa_Mutasi', 'Siswa_Mutasi', NULL, NULL, '', '222222222222222222', NULL, 'siswa mutasi', 'data', '2022-08-02', NULL, NULL, '1234567890123', '12345678', 'SD SWASTA ST.FRANSISKUS ASISI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default-avatar.png', 'VIII', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2021', NULL, NULL, 0, '$2y$10$IiEQnUTeDFQz9fOwHiUvTe6lgeotXrIbmtps2SaC3.4pAJWXPAKlO', '12345678', 1, '2022-08-02 15:58:11'),
(5, '', '', 'PPDB2223002', '', 'Gelombang_2', 'Siswa_Baru', NULL, NULL, '', '333333333333333333', NULL, 'Ujicoba', 'Ujicoba', '2025-08-01', NULL, NULL, '085805156113', '123456789', 'SD SWASTA ST.FRANSISKUS ASISI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default-avatar.png', 'VII', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2223', NULL, NULL, 0, '$2y$10$qIW1ZJHLI0ukDa/ssOdDzO2EvJN7JuFNG9K1JhFZ3/ASh11LjipVy', '12345678', 1, '2025-07-31 17:48:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_histori`
--

CREATE TABLE `ppdb_histori` (
  `id` int(11) NOT NULL,
  `id_permohonan` varchar(30) NOT NULL,
  `nik` int(30) NOT NULL,
  `status` int(1) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_jenis`
--

CREATE TABLE `ppdb_jenis` (
  `id_jenis` varchar(50) NOT NULL,
  `nama_jenis` varchar(50) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ppdb_jenis`
--

INSERT INTO `ppdb_jenis` (`id_jenis`, `nama_jenis`, `status`) VALUES
('SB', 'Siswa_Baru', 1),
('SM', 'Siswa_Mutasi', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_jenjang`
--

CREATE TABLE `ppdb_jenjang` (
  `id_jenjang` varchar(5) NOT NULL,
  `nama_jenjang` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_jurusan`
--

CREATE TABLE `ppdb_jurusan` (
  `id_jurusan` varchar(50) NOT NULL,
  `nama_jurusan` varchar(100) DEFAULT NULL,
  `kuota` int(10) DEFAULT NULL,
  `jenis_daftar` varchar(191) NOT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ppdb_jurusan`
--

INSERT INTO `ppdb_jurusan` (`id_jurusan`, `nama_jurusan`, `kuota`, `jenis_daftar`, `status`) VALUES
('', 'SEKOLAH ANAK DESA', 67, 'Siswa Baru', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_kontak`
--

CREATE TABLE `ppdb_kontak` (
  `id_kontak` int(11) NOT NULL,
  `kd_campus` char(11) NOT NULL,
  `kd_sekolah` char(11) NOT NULL,
  `nama_kontak` varchar(50) DEFAULT NULL,
  `no_kontak` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ppdb_kontak`
--

INSERT INTO `ppdb_kontak` (`id_kontak`, `kd_campus`, `kd_sekolah`, `nama_kontak`, `no_kontak`, `status`) VALUES
(1, '', '', 'Anak Desa', '085695669612', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_kursus`
--

CREATE TABLE `ppdb_kursus` (
  `id_kursus` int(11) NOT NULL,
  `kd_campus` char(11) NOT NULL,
  `kd_sekolah` char(11) NOT NULL,
  `id_guru` char(15) DEFAULT NULL,
  `id_mapel` varchar(30) DEFAULT NULL,
  `kelas` varchar(191) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_mapel`
--

CREATE TABLE `ppdb_mapel` (
  `id_mapel` varchar(30) NOT NULL,
  `nama_mapel` varchar(191) NOT NULL,
  `status` int(1) NOT NULL,
  `datecreate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ppdb_mapel`
--

INSERT INTO `ppdb_mapel` (`id_mapel`, `nama_mapel`, `status`, `datecreate`) VALUES
('BHSI', 'BAHASA INDONERSIA', 0, '2022-08-02 08:15:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_materi`
--

CREATE TABLE `ppdb_materi` (
  `id_materi` int(255) NOT NULL,
  `kd_campus` char(11) NOT NULL,
  `kd_sekolah` char(11) NOT NULL,
  `id_guru` char(15) NOT NULL,
  `nama_mapel` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `tgl_buka` datetime NOT NULL,
  `tgl_tutup` datetime NOT NULL,
  `komentar` int(1) NOT NULL,
  `jawab` int(1) NOT NULL,
  `kuis` int(1) NOT NULL,
  `kelas` varchar(191) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ppdb_materi`
--

INSERT INTO `ppdb_materi` (`id_materi`, `kd_campus`, `kd_sekolah`, `id_guru`, `nama_mapel`, `isi`, `tgl_buka`, `tgl_tutup`, `komentar`, `jawab`, `kuis`, `kelas`, `status`) VALUES
(1, '', '', '12345678900', 'BAHASA INDONERSIA', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, 'VII', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_nilai_quiz`
--

CREATE TABLE `ppdb_nilai_quiz` (
  `id_nilai` int(11) NOT NULL,
  `id_siswa` varchar(20) NOT NULL,
  `id_materi` int(11) DEFAULT NULL,
  `nilai` float DEFAULT NULL,
  `benar` int(2) DEFAULT NULL,
  `salah` int(2) DEFAULT NULL,
  `jawaban` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ppdb_nilai_quiz`
--

INSERT INTO `ppdb_nilai_quiz` (`id_nilai`, `id_siswa`, `id_materi`, `nilai`, `benar`, `salah`, `jawaban`) VALUES
(0, 'PPDB2223001', 1, 100, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_pengumuman`
--

CREATE TABLE `ppdb_pengumuman` (
  `id_pengumuman` int(11) NOT NULL,
  `kd_campus` char(11) NOT NULL,
  `kd_sekolah` char(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `pengumuman` text DEFAULT NULL,
  `tgl` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jenis` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ppdb_pengumuman`
--

INSERT INTO `ppdb_pengumuman` (`id_pengumuman`, `kd_campus`, `kd_sekolah`, `id_user`, `judul`, `pengumuman`, `tgl`, `jenis`) VALUES
(1, '', '', 2147483647, 'Tes', '<p>Kerjakan Tes</p>\r\n', '2022-08-03 00:01:19', 1),
(2, '', '', 2147483647, 'Pelaksanaan TES', '<p>Gelombang 1</p>\r\n\r\n<p>pelaksaan tanggal</p>\r\n\r\n<p>12222</p>\r\n', '2022-08-03 00:01:57', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_periode`
--

CREATE TABLE `ppdb_periode` (
  `id` int(10) UNSIGNED NOT NULL,
  `periode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_mulai` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_selesai` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Aktif','Off') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(1) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ppdb_periode`
--

INSERT INTO `ppdb_periode` (`id`, `periode`, `tgl_mulai`, `tgl_selesai`, `tahun`, `status`, `is_active`, `created_date`) VALUES
(2, 'Gelombang_1', '2022-08-02', '2022-08-02', '2223', '', 0, '2022-08-02 16:18:15'),
(3, 'Siswa_Mutasi', '2022-08-02', '2022-08-02', '2021', '', 0, '2022-08-02 16:18:13'),
(4, 'Gelombang_1', '2022-08-02', '2022-08-02', '2122', '', 0, '2022-08-02 16:08:01'),
(5, 'Gelombang_I', '2022-08-02', '2022-08-02', '1920', '', 0, '2022-08-02 16:08:04'),
(6, 'Gelombang_2', '2022-08-02', '2022-08-02', '2223', 'Aktif', 1, '2022-08-02 17:04:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_sekolah`
--

CREATE TABLE `ppdb_sekolah` (
  `npsn` varchar(16) NOT NULL,
  `nama_sekolah` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ppdb_sekolah`
--

INSERT INTO `ppdb_sekolah` (`npsn`, `nama_sekolah`, `alamat`, `status`) VALUES
('12345678', 'Lainnya', '11111111111', 1),
('123456789', 'SD SWASTA ST.FRANSISKUS ASISI', 'bbbbbbbbbbbbb', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_soal`
--

CREATE TABLE `ppdb_soal` (
  `id_soal` int(11) NOT NULL,
  `id_banksoal` int(11) NOT NULL,
  `id_materi` int(11) NOT NULL,
  `nomor` int(5) DEFAULT NULL,
  `soal` longtext DEFAULT NULL,
  `jenis` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `ppdb_soal`
--

INSERT INTO `ppdb_soal` (`id_soal`, `id_banksoal`, `id_materi`, `nomor`, `soal`, `jenis`) VALUES
(1, 0, 1, NULL, '<p>aaa</p>\r\n', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_soal_opsi`
--

CREATE TABLE `ppdb_soal_opsi` (
  `id_opsi` int(11) NOT NULL,
  `id_soal` int(11) DEFAULT NULL,
  `opsi` text DEFAULT NULL,
  `benar` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ppdb_soal_opsi`
--

INSERT INTO `ppdb_soal_opsi` (`id_opsi`, `id_soal`, `opsi`, `benar`) VALUES
(1, 1, 'a', 1),
(2, 1, 'b', 0),
(3, 1, 'c', 0),
(4, 1, 'd', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_tugas`
--

CREATE TABLE `ppdb_tugas` (
  `id_tugas` int(11) NOT NULL,
  `kd_campus` char(11) NOT NULL,
  `kd_sekolah` char(11) NOT NULL,
  `id_kursus` int(11) NOT NULL,
  `id_guru` char(15) NOT NULL,
  `judul` varchar(191) NOT NULL,
  `tugas` mediumtext NOT NULL,
  `file` varchar(255) NOT NULL,
  `tgl_buka` datetime NOT NULL,
  `tgl_tutup` datetime NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `komentar` int(11) NOT NULL,
  `file_guru` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_tugas_jawab`
--

CREATE TABLE `ppdb_tugas_jawab` (
  `id` int(11) NOT NULL,
  `kd_campus` char(11) NOT NULL,
  `kd_sekolah` char(11) NOT NULL,
  `id_tugas` int(11) NOT NULL,
  `id_kursus` int(11) NOT NULL,
  `id_siswa` varchar(20) NOT NULL,
  `jawaban` text NOT NULL,
  `file` varchar(50) NOT NULL,
  `nilai` int(11) NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_user_access_menu`
--

CREATE TABLE `ppdb_user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ppdb_user_access_menu`
--

INSERT INTO `ppdb_user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(4, 1, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_user_menu`
--

CREATE TABLE `ppdb_user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ppdb_user_menu`
--

INSERT INTO `ppdb_user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Menu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_user_role`
--

CREATE TABLE `ppdb_user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ppdb_user_role`
--

INSERT INTO `ppdb_user_role` (`id`, `role`) VALUES
(1, 'administrator'),
(2, 'member'),
(3, 'student'),
(4, 'teacher'),
(5, 'staff'),
(6, 'guest');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb_user_sub_menu`
--

CREATE TABLE `ppdb_user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ppdb_user_sub_menu`
--

INSERT INTO `ppdb_user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'ppdb/user', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'Formulir', 'ppdb/formulir', 'fas fa-paste', 1),
(3, 2, 'Pembayaran', 'ppdb/pembayaran', 'fas fa-comment-dollar', 1),
(4, 2, 'Tes Masuk', 'ppdb/tes_masuk', 'fas fa-envelope-open-text', 1),
(5, 3, 'Pengumuman', 'ppdb/pengumuman', 'fas fa-bullhorn', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_artikel`
--

CREATE TABLE `profil_artikel` (
  `id_artikel` int(11) NOT NULL,
  `judul_artikel` varchar(191) NOT NULL,
  `deskripsi` longtext CHARACTER SET latin1 NOT NULL,
  `status` int(1) NOT NULL,
  `gambar` varchar(191) NOT NULL,
  `user_update` varchar(191) NOT NULL,
  `tanggal_terbit` varchar(191) NOT NULL,
  `datecreate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `profil_artikel`
--

INSERT INTO `profil_artikel` (`id_artikel`, `judul_artikel`, `deskripsi`, `status`, `gambar`, `user_update`, `tanggal_terbit`, `datecreate`) VALUES
(1, 'Inilah Para Juara OSN Jenjang SMP Tahun 2022!', '<p>Halo, Sobat SMP! Beberapa waktu lalu perhelatan lomba sains peserta didik terbesar di Indonesia, Olimpiade Sains Nasional, telah dilangsungkan. Perlombaan yang dikenal juga dengan istilah OSN, khususnya bagi jenjang SMP, kini sudah usai dan tentunya melahirkan para juara-juara baru <i>lho</i>!</p>\r\n\r\n<p>Bagi Sobat SMP yang belum mengetahui apa itu OSN, OSN merupakan salah satu program dalam rangka meningkatkan prestasi peserta didik. Tujuan dari diselenggarakannya OSN adalah sebagai wahana olimpiade bidang ilmu sains sekaligus untuk dapat menjaring peserta didik berprestasi di bidang sains yang mampu berdaya saing nasional maupun global.</p>\r\n\r\n<p>Untuk OSN jenjang SMP tahun 2022 ini, tema yang diangkat adalah <b>“Talenta Sains Untuk Indonesia Maju”</b>. Ada pun bidang OSN yang diperlombakan pada tahun 2022 ini seperti matematika, IPA, dan juga IPS. </p>\r\n\r\n<p>Hasil penilaian dari Bidang Lomba Matematika, IPA dan IPS telah menganugerahkan medali sebanyak 10 (sepuluh) medali emas, 15 (lima belas) medali perak, dan 20 (dua puluh) medali perunggu. Selain itu, peserta Lomba IPA dan IPS juga menganugerahkan penghargaan kategori berupa: Teori Terbaik (<i>Best Theory</i>) bagi 1 (satu) peserta, dan Pengamatan Terbaik (<i>Best Observation</i>) bagi 1 (satu) peserta.</p>\r\n\r\n<p>Nah, Sobat SMP penasaran tidak siapa saja yang berhasil menjuarai OSN jenjang SMP di tahun ini? Berdasarkan Keputusan Kepala Balai Pengembangan Talenta Indonesia Sekretariat Jenderal Kementerian Pendidikan, Kebudayaan, Riset Dan Teknologi nomor 0361/J7.1/PN.01/2022 tentang Pemenang Olimpiade Sains Nasional-Sekolah Menengah Pertama (OSN-SMP) Tingkat Nasional Tahun 2022, terdapat beberapa pemenang untuk masing-masing bidang lomba dengan rincian berikut:</p>\r\n\r\n<p>Nah, itulah tadi para peraih medali emas dari OSN jenjang SMP tahun 2022. Untuk para peraih medali perak, perunggu, dan juga Teori Terbaik dan Pengamatan Terbaik, Sobat SMP dapat melihat langsung pada <a href=\"https://pusatprestasinasional.kemdikbud.go.id/uploads/lampiran_pengumuman/SK PEMENANG OSN JENJANG SMP TK. NASIONAL TAHUN 2022.pdf\"><b>SK PEMENANG OSN JENJANG SMP 2022</b></a>. Selamat kepada para juara yang berhasil meraih medali! Bagi Sobat SMP yang belum meraih medali, tetap semangat ya! Jangan menyerah untuk terus maju dan berprestasi dalam membanggakan Indonesia!</p>\r\n\r\n<p> </p>\r\n\r\n<p><a href=\"https://ditsmp.kemdikbud.go.id/kurikulum-merdeka-sebagai-upaya-pemulihan-pembelajaran/\" rel=\"nofollow\" target=\"_self\">Baca Juga  Kurikulum Merdeka Sebagai Upaya Pemulihan Pembelajaran</a></p>\r\n\r\n<p>Penulis: Pengelola Web Direktorat SMP</p>\r\n\r\n<p>Referensi:</p>\r\n\r\n<p><a href=\"https://pusatprestasinasional.kemdikbud.go.id/uploads/lampiran_pengumuman/SK PEMENANG OSN JENJANG SMP TK. NASIONAL TAHUN 2022.pdf\">SK Pemenang OSN Jenjang SMP 2022</a></p>\r\n', 1, 'Inilah-Para-Juara-OSN-Jenjang-SMP-Tahun-2022-min.jpg', 'Tata Usaha', '2022-08-02', '2022-08-16 03:43:08'),
(2, 'Kenali 9 Aspek dalam Survei Lingkungan Belajar ANBK', '<p>Halo, Sobat SMP! Tak lama lagi, Asesmen Nasional (khususnya jenjang SMP) akan diselenggarakan. Asesmen Nasional sendiri terdiri dari tiga instrumen utama, yakni Asesmen Kompetensi Minimum (AKM), survei karakter, dan juga survei lingkungan belajar. Nah, pada kesempatan kali ini kita akan mengenal lebih dalam lagi tentang survei lingkungan belajar.</p>\r\n\r\n<p>Survei lingkungan belajar mengukur kualitas 9 aspek yang memengaruhi kualitas belajar peserta didik. Survei lingkungan belajar akan memotret mutu satuan pendidikan secara utuh mulai dari input dan proses belajar-mengajar di dalam kelas maupun di tingkat sekolah.</p>\r\n\r\n<p>Seperti yang tadi sudah disinggung, terdapat 9 aspek dalam survei lingkungan belajar pada Asesmen Nasional. Kira-kira apa saja ya 9 aspek tersebut? Yuk simak artikel ini sampai selesai agar kalian paham ya, Sobat SMP!</p>\r\n\r\n<p><b>1. Kualitas pembelajaran</b></p>\r\n\r\n<p>Kualitas pembelajaran akan mengukur tingkat kualitas interaksi yang terjadi antara peserta didik, guru, dan juga materi pembelajaran yang dijelaskan oleh guru kepada peserta didik dalam proses pembelajaran. Kualitas pembelajaran mencakup pengelolaan kelas, dukungan afektif, pembelajaran interaktif, dan penyesuaian cara mengajar sesuai dengan kemampuan peserta didik.</p>\r\n\r\n<p><b>2. Praktik perbaikan pembelajaran oleh guru</b></p>\r\n\r\n<p>Pembelajaran yang dilakukan juga perlu direfleksikan oleh guru. Dalam aspek ini dapat melalui belajar seputar pembelajaran, refleksi atas praktik pengajaran, serta penerapan praktik inovatif.</p>\r\n\r\n<p><b>3. Kepemimpinan instruksional</b></p>\r\n\r\n<p>Kepemimpinan instruksional di sini lebih kepada peran kepala sekolah dalam memimpin satuan pendidikan. Misalnya seperti kemampuan kepala sekolah untuk menyusun visi, misi, program, dan juga kebijakan yang mendukung guru dalam meningkatkan mutu pembelajaran.</p>\r\n\r\n<p><b>4. Iklim keamanan di sekolah</b></p>\r\n\r\n<p>Satuan pendidikan seyogianya harus memberikan perlindungan dan rasa aman bagi seluruh warga sekolah, baik secara fisik dan juga psikologis. Oleh karena itu, satuan pendidikan perlu memiliki pemahaman, program, serta menerapkan kebijakan terkait perundungan, hukuman fisik, kekerasan seksual, dan narkoba. </p>\r\n\r\n<p><b>5. Iklim kebinekaan di sekolah</b></p>\r\n\r\n<p><a href=\"https://ditsmp.kemdikbud.go.id/keahlian-komunikasi-yang-harus-dimiliki-seorang-pemimpin/\" rel=\"nofollow\" target=\"_self\">Baca Juga  Keahlian Komunikasi yang Harus Dimiliki Seorang Pemimpin</a></p>\r\n\r\n<p>Indonesia adalah negara yang kaya akan keanekaragaman. Maka dari itu, satuan pendidikan perlu menghargai keragaman agama, sosial, budaya, dukungan kesetaraan hak sipil, dan komitmen kebangsaan.</p>\r\n\r\n<p><b>6. Dukungan atas kesetaraan gender</b></p>\r\n\r\n<p>Lingkungan di satuan pendidikan harus bisa berperilaku adil dan memberikan kesempatan yang bagi seluruh warga sekolah, baik laki-laki maupun perempuan, dalam menjalankan peran di lingkungan satuan pendidikan.</p>\r\n\r\n<p><b>7. Iklim inklusivitas</b></p>\r\n\r\n<p>Satuan pendidikan harus mampu mengedukasi pengetahuan, menerima, dan juga mendukung para peserta didik yang memiliki kebutuhan khusus, serta murid cerdas istimewa ataupun bakat istimewa.</p>\r\n\r\n<p><b>8. Dukungan partisipasi orang tua dan peserta didik</b></p>\r\n\r\n<p>Seluruh elemen warga sekolah idealnya harus terlibat dalam setiap kegiatan dan juga program yang diselenggarakan oleh satuan pendidikan. Maka dari itu, orang tua bisa ikut berpartisipasi dalam kepanitiaan kegiatan sekolah dan juga peserta didik bisa berperan serta dalam penyusunan program sekolah.</p>\r\n\r\n<p><b>9. Latar belakang sosial-ekonomi peserta didik</b></p>\r\n\r\n<p>Survei lingkungan belajar juga mencoba untuk memetakan latar belakang sosial-ekonomi peserta didik. Kondisi sosial-ekonomi di sini terkait dengan mengakses dan juga memperoleh layanan pendidikan yang berkualitas, seperti tingkat pendidikan orang tua dan juga fasilitas belajar yang tersedia di rumah.</p>\r\n\r\n<p>Jadi kesimpulannya, banyak aspek yang memengaruhi hasil belajar dari peserta didik. Oleh karena itu, mari berpartisipasi mengisi survei lingkungan belajar secara berintegritas agar bisa memperoleh potret mutu pendidikan secara utuh dari <i>input</i>, proses, hingga <i>output</i>. Semoga informasi ini bermanfaat ya, Sobat SMP!</p>\r\n\r\n<p> </p>\r\n\r\n<p>Penulis: Pengelola Web Direktorat SMP</p>\r\n\r\n<p>Referensi: <a href=\"https://www.youtube.com/watch?v=oVIE0PN05Kg\">https://www.youtube.com/watch?v=oVIE0PN05Kg</a> </p>\r\n', 1, 'Kenali-9-Aspek-dalam-Survei-Lingkungan-Belajar-ANBK-01-min-1024x480.jpg', 'Tata Usaha', '2022-08-02', '2022-08-16 03:42:25'),
(3, 'Tip Berlatih Basket Secara Mandiri di Rumah', '<p>Halo, Sobat SMP! Siapa di sini yang suka bermain olahraga basket? Bola basket adalah salah satu olahraga paling populer di dunia. Penggemarnya yang berasal dari segala usia merasakan bahwa bola basket adalah olahraga yang menyenangkan, kompetitif, mendidik, menghibur, dan menyehatkan.</p>\r\n\r\n<p>Agar semakin mahir dalam bermain bola basket, mungkin Sobat SMP memerlukan latihan-latihan tertentu. Latihan-latihan yang dilakukan harus dapat meningkatkan stamina dan juga mengasah teknik-teknik dasar dalam permainan bola basket. </p>\r\n\r\n<p>Meskipun umumnya latihan basket lebih efektif apabila dilakukan bersama pelatih dan juga teman, Sobat SMP juga bisa kok berlatih basket sendiri di rumah. Latihan mandiri juga berguna agar kita mengurangi kontak fisik dengan orang lain mengingat saat ini masih dalam masa pandemi dan juga banyak ancaman virus serta penyakit. Kira-kira seperti apa latihannya? Yuk simak artikel ini!</p>\r\n\r\n<ul>\r\n <li aria-level=\"1\"><b>Latihan daya tahan</b></li>\r\n</ul>\r\n\r\n<p>Daya tahan atau <i>endurance</i> adalah salah satu hal yang harus diperhatikan dalam permainan olahraga bola basket. Agar daya tahan tubuh bisa bagus, Sobat SMP dapat mencoba beberapa latihan, misalnya seperti <i>jogging</i> di sekitar rumah, bersepeda, ataupun berenang.</p>\r\n\r\n<ul>\r\n <li aria-level=\"1\"><b>Latihan kekuatan</b></li>\r\n</ul>\r\n\r\n<p>Kekuatan atau <i>strength </i>juga perlu diasah secara mandiri karena permainan bola basket memerlukan kontak badan. Latihannya bisa dibagi menjadi dua, yakni latihan <i>upper body</i> (tubuh bagian atas) dan juga <i>lower body </i>(tubuh bagian bawah). Untuk <i>upper body</i>, jenis latihan yang bisa dilakukan adalah <i>push up, dipping</i>, <i>plank</i>, dan juga <i>back up</i>. Tubuh bagian bawah dapat dilatih dengan gerakan <i>squat</i>, <i>calf raises</i>, <i>wall sit</i>, serta <i>lunges</i>.</p>\r\n\r\n<ul>\r\n <li aria-level=\"1\"><b>Latihan kecepatan</b></li>\r\n</ul>\r\n\r\n<p><a href=\"https://ditsmp.kemdikbud.go.id/kebijakan-dak-fisik-pendidikan-terbaru-tahun-2022/\" rel=\"nofollow\" target=\"_self\">Baca Juga  Kebijakan DAK Fisik Pendidikan Terbaru Tahun 2022</a></p>\r\n\r\n<p>Kecepatan sangat penting dalam olahraga bola basket karena permainan ini membutuhkan kecepatan dan mengubah arah dengan cepat. Sobat SMP bisa mengasah kecepatan dengan melakukan <i>speed run</i>, lari cepat dalam beberapa meter (10-20 meter). Latihan lainnya seperti <i>slide speed</i>, bisa dilakukan dengan cara ke samping beberapa meter atau <i>slide </i>mundur kanan dua kali, kiri dua kali.</p>\r\n\r\n<ul>\r\n <li aria-level=\"1\"><b>Latihan power</b></li>\r\n</ul>\r\n\r\n<p>Selain kecepatan, <i>power </i>atau daya ledak otot juga sangat penting karena <i>rebound</i>, <i>speed dribble</i>, dan <i>jump shoot </i>membutuhkan <i>power</i>. Latihan yang dapat dilakukan misalnya seperti <i>jumping jack</i>, <i>skipping</i>, <i>jump</i>, dan juga <i>tuck jump</i>.</p>\r\n\r\n<ul>\r\n <li aria-level=\"1\"><b>Latihan teknik dasar</b></li>\r\n</ul>\r\n\r\n<p>Hal yang tidak boleh dilupakan adalah berlatih teknik dasar. Beberapa teknik dasar yang perlu dilatih adalah latihan <i>dribble</i>, <i>passing</i>, dan juga <i>shooting</i>. Untuk <i>dribble</i>, sobat SMP bisa berlatih <i>lower dribble</i>, <i>high dribble</i>, dan juga <i>crossover dribble </i>di tempat. Sedangkan untuk <i>passing </i>dan <i>shooting</i>, Sobat SMP dapat memanfaatkan tembok rumah untuk memantulkan tembakan bola.</p>\r\n\r\n<p>Nah, itulah tadi beberapa latihan basket mandiri di rumah yang bisa Sobat SMP lakukan. Silakan mencoba sendiri di rumah selama masa pandemi seperti ini agar imun tetap terjaga dan teknik bermain basket tetap terlatih. Jika pandemi sudah berakhir, kamu menjadi semakin mahir bermain basket karena tetap berlatih di rumah selama masa pandemi. Semoga bermanfaat ya, Sobat SMP!</p>\r\n\r\n<p> </p>\r\n\r\n<p>Penulis: Pengelola Web Direktorat SMP</p>\r\n\r\n<p>Referensi: Buku NPK Ekstrakurikuler Basket Jenjang SMP terbitan Direktorat SMP tahun 2021</p>\r\n', 1, 'Tip-Berlatih-Basket-Secara-Mandiri-di-Rumah-min.jpg', 'Tata Usaha', '2022-08-10', '2022-08-16 03:44:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_belajar`
--

CREATE TABLE `profil_belajar` (
  `belajar_id` int(11) NOT NULL,
  `judul` varchar(191) NOT NULL,
  `text` text NOT NULL,
  `gambar` varchar(191) NOT NULL,
  `link` varchar(225) NOT NULL,
  `status` int(1) NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `profil_belajar`
--

INSERT INTO `profil_belajar` (`belajar_id`, `judul`, `text`, `gambar`, `link`, `status`, `datecreated`) VALUES
(1, 'Login Guru', 'administrasi guru', 'avatar.png', 'http://localhost/sad_smp/guru', 1, '2022-08-02 05:10:05'),
(2, 'Login TU', 'Administrasi Tata Usaha', 'avatar2.png', 'http://localhost/sad_smp/tu', 1, '2022-08-02 05:10:32'),
(3, 'Login Kepala Sekolah', 'Administarasi Kepala Sekolah', 'avatar5.png', 'http://localhost/sad_smp/kepsek', 1, '2022-08-02 05:11:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_ekstra`
--

CREATE TABLE `profil_ekstra` (
  `ekstra_id` int(11) NOT NULL,
  `judul` varchar(191) NOT NULL,
  `text` text NOT NULL,
  `gambar` varchar(225) NOT NULL,
  `status` int(1) NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `profil_ekstra`
--

INSERT INTO `profil_ekstra` (`ekstra_id`, `judul`, `text`, `gambar`, `status`, `createdate`) VALUES
(1, 'Ekstrakurikuler 1', 'Ekstrakurikuler Utama', 'futsal.jpg', 1, '2022-08-16 03:17:07'),
(2, 'Ekstrakurikuler 2', 'Ekstrakurikuler Kedua', 'folly.jpg', 1, '2022-08-16 03:16:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_fasilitas`
--

CREATE TABLE `profil_fasilitas` (
  `id` int(11) NOT NULL,
  `judul` varchar(191) NOT NULL,
  `text` text NOT NULL,
  `gambar` varchar(191) NOT NULL,
  `status` int(1) NOT NULL,
  `datecreate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `profil_fasilitas`
--

INSERT INTO `profil_fasilitas` (`id`, `judul`, `text`, `gambar`, `status`, `datecreate`) VALUES
(1, 'Lapangan Indor', 'Lapangan Indor', 'Lapangan-Indoor.jpg', 1, '2022-08-16 03:11:33'),
(2, 'Gedung Sekolah', 'Gedung Sekolah', 'gedung_sekolah.jpg', 1, '2022-08-16 03:10:47'),
(3, 'Lapangan Outdoor', 'Lapangan Outdoor', 'Lapangan-Outdoor.jpg', 1, '2022-08-16 03:13:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_galeri`
--

CREATE TABLE `profil_galeri` (
  `id_galeri` int(11) NOT NULL,
  `judul_galeri` varchar(191) NOT NULL,
  `deskripsi` longtext NOT NULL,
  `status` int(1) NOT NULL,
  `user_update` varchar(250) NOT NULL,
  `gambar` varchar(191) NOT NULL,
  `datecreate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `profil_galeri`
--

INSERT INTO `profil_galeri` (`id_galeri`, `judul_galeri`, `deskripsi`, `status`, `user_update`, `gambar`, `datecreate`) VALUES
(1, 'HTML', '<p>Hypertext Markup Language adalah bahasa markah standar untuk dokumen yang dirancang untuk ditampilkan di peramban internet. Ini dapat dibantu oleh teknologi seperti Cascading Style Sheets dan bahasa scripting seperti JavaScript dan VBScript.</p>\r\n', 1, 'Admnistrator', 'web_sekolah.PNG', '2022-08-02 06:52:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_galeri_sub`
--

CREATE TABLE `profil_galeri_sub` (
  `id_galeri_sub` int(11) NOT NULL,
  `id_galeri` int(11) DEFAULT NULL,
  `foto` varchar(191) NOT NULL,
  `datecreate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `profil_galeri_sub`
--

INSERT INTO `profil_galeri_sub` (`id_galeri_sub`, `id_galeri`, `foto`, `datecreate`) VALUES
(1, 1, 'gamabar_profil.PNG', '2022-08-02 06:54:04'),
(2, 1, 'Login_Kepsek.PNG', '2022-08-02 06:54:10'),
(3, 1, 'Login_Guru.PNG', '2022-08-02 06:54:16'),
(4, 1, 'Login_TU.PNG', '2022-08-02 06:54:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_guru`
--

CREATE TABLE `profil_guru` (
  `profil_id` int(11) NOT NULL,
  `nama_guru` varchar(191) NOT NULL,
  `mengajar` varchar(191) NOT NULL,
  `gambar` varchar(191) NOT NULL,
  `status` int(1) NOT NULL,
  `createdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `profil_guru`
--

INSERT INTO `profil_guru` (`profil_id`, `nama_guru`, `mengajar`, `gambar`, `status`, `createdate`) VALUES
(1, 'ANAK DESA', 'Kepala Sekolah', 'avatar5.png', 1, '0000-00-00 00:00:00'),
(2, 'Guru 1', 'Wali Kelas 7', 'avatar.png', 1, '0000-00-00 00:00:00'),
(3, 'Guru 2', 'Wali Kelas 8', 'avatar2.png', 1, '0000-00-00 00:00:00'),
(4, 'Guru 3', 'Wali Kelas 9', 'avatar3.png', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_info`
--

CREATE TABLE `profil_info` (
  `id` int(11) NOT NULL,
  `text_info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `profil_info`
--

INSERT INTO `profil_info` (`id`, `text_info`) VALUES
(0, '<p>tessssssssssssssssssss !!!!!!!!!!!!</p>\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_kepsek`
--

CREATE TABLE `profil_kepsek` (
  `nip` int(35) NOT NULL,
  `nama_kepsek` varchar(191) NOT NULL,
  `foto` varchar(191) NOT NULL,
  `kata_sambutan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `profil_kepsek`
--

INSERT INTO `profil_kepsek` (`nip`, `nama_kepsek`, `foto`, `kata_sambutan`) VALUES
(1, 'ANAK DESA', '5363.jpeg', '<p>Assalamualaikum Wr.Wb.<br />\r\n<br />\r\nSelamat datang di website SEKOLAH ANAK DESA<br />\r\n<br />\r\nAlhamdulillah, segala puji hanya milik Allah SWT semata, atas kehendak-Nya kami bisa hadir ditengah derasnya perkembangan teknologi informasi setelah kami lakukan update, baik dari sisi pengelolaan maupun isinya. Perkembangan tekhnologi menuntut perubahan dan peningkatan di bidang pendidikan dalam menyiapkan peserta didik untuk mewujudkan Sumber Daya Manusia yang berbudi pekerti luhur, berbudaya, berkarakter ,kreatif, inovasi dan unggul dalam prestasi serta kompetitif dalam dunia Digital.<br />\r\n<br />\r\nWebsite SEKOLAH ANAK DESA&nbsp; merupakan pintu gerbang untuk memperoleh informasi tentang kegiatan sekolah, prestasi akademik maupun non akademik kepada orangtua/wali siswa, maupun masyarakat secara luas serta sebagai ajang komunikasi antara guru, siswa, alumni dan masyarakat. Pemanfaatan lainnya adalah website sekolah sebagai media pembelajaran dan evaluasi online.<br />\r\n<br />\r\nSemoga website ini dapat bermanfaat khususnya dalam meningkatkan mutu pendidikan di SEKOLAH ANAK DESA dan dunia pendidikan pada umumnya. Aamiin.<br />\r\n<br />\r\nWassalamualaikum Wr.Wb</p>\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_osis`
--

CREATE TABLE `profil_osis` (
  `osis_id` int(11) NOT NULL,
  `judul` varchar(191) NOT NULL,
  `text` text NOT NULL,
  `gambar` varchar(225) NOT NULL,
  `status` int(1) NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `profil_osis`
--

INSERT INTO `profil_osis` (`osis_id`, `judul`, `text`, `gambar`, `status`, `createdate`) VALUES
(1, 'Ketua Osis 2021', 'Nama : PaijoKelas  : 7B', 'avatar5.png', 1, '2022-08-16 03:15:32'),
(2, 'Ketua Osis 2022', 'Nama : JoniKelas : 7A', 'avatar2.png', 1, '2022-08-16 03:15:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_prestasi`
--

CREATE TABLE `profil_prestasi` (
  `prestasi_id` int(11) NOT NULL,
  `judul` varchar(191) NOT NULL,
  `text` text NOT NULL,
  `gambar` varchar(225) NOT NULL,
  `status` int(1) NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `profil_prestasi`
--

INSERT INTO `profil_prestasi` (`prestasi_id`, `judul`, `text`, `gambar`, `status`, `createdate`) VALUES
(1, 'Juara 1', 'Sepak Bola', 'avatar4.png', 1, '2022-08-16 03:18:13'),
(2, 'Juara 2', 'Bulu Tangkis', 'avatar2.png', 1, '2022-08-16 03:18:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_slide`
--

CREATE TABLE `profil_slide` (
  `slide_id` int(11) NOT NULL,
  `judul` varchar(191) NOT NULL,
  `text` text NOT NULL,
  `gambar` varchar(191) NOT NULL,
  `status` int(1) NOT NULL,
  `datecreate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `profil_slide`
--

INSERT INTO `profil_slide` (`slide_id`, `judul`, `text`, `gambar`, `status`, `datecreate`) VALUES
(8, 'PRAMUKA', 'Harlah Pramuka ke-61 Tahun 2022', 'slide_1.jpg', 1, '2022-08-16 02:08:31'),
(9, 'KEMERDEKAAN INDONESIA', 'Peringatan Hari Ulang Tahun (HUT) Ke-77 Kemerdekaan Republik Indonesia (RI) Tahun 2022', 'slide_2.jpg', 1, '2022-08-16 02:18:44'),
(10, 'PPDB', 'PPDB Online 2022', 'slide_3.jpeg', 1, '2022-08-16 02:50:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_tahun`
--

CREATE TABLE `t_tahun` (
  `id` int(3) NOT NULL,
  `kd_campus` char(11) NOT NULL,
  `kd_sekolah` char(11) NOT NULL,
  `tahun` varchar(5) NOT NULL,
  `aktif` enum('Y','N') NOT NULL,
  `nik` char(15) NOT NULL,
  `nip_kepsek` varchar(30) NOT NULL,
  `tgl_biodata` date NOT NULL,
  `tgl_raport_pts` date NOT NULL,
  `tgl_raport_pas` date NOT NULL,
  `tgl_raport_pat` date NOT NULL,
  `semester` char(15) NOT NULL,
  `th_pelajaran` varchar(25) NOT NULL,
  `nama_kepsek` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_tahun`
--

INSERT INTO `t_tahun` (`id`, `kd_campus`, `kd_sekolah`, `tahun`, `aktif`, `nik`, `nip_kepsek`, `tgl_biodata`, `tgl_raport_pts`, `tgl_raport_pas`, `tgl_raport_pat`, `semester`, `th_pelajaran`, `nama_kepsek`) VALUES
(0, '', '', '20221', 'Y', '0001', '-', '2022-08-18', '2022-08-18', '2022-08-18', '2022-08-18', '1', '2022/2023', 'Guru Satu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(128) NOT NULL,
  `level` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` text NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `visitor`
--

CREATE TABLE `visitor` (
  `ip` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `hits` int(11) NOT NULL,
  `online` varchar(255) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `visitor`
--

INSERT INTO `visitor` (`ip`, `date`, `hits`, `online`, `time`) VALUES
('::1', '2022-07-31', 4, '1659274320', '2022-07-31 11:33:54'),
('::1', '2022-08-01', 15, '1659332808', '2022-08-01 02:59:56'),
('::1', '2022-08-02', 389, '1659460149', '2022-08-02 04:44:06'),
('::1', '2022-08-03', 3, '1659502039', '2022-08-03 03:54:38'),
('::1', '2022-08-04', 2, '1659640698', '2022-08-04 02:20:07'),
('::1', '2022-08-13', 45, '1660396722', '2022-08-13 06:29:16'),
('::1', '2022-08-15', 17, '1660581136', '2022-08-15 03:49:45'),
('::1', '2022-08-16', 174, '1660660050', '2022-08-16 03:00:51'),
('::1', '2022-08-17', 2, '1660753073', '2022-08-17 17:16:21'),
('::1', '2022-08-18', 47, '1660838656', '2022-08-18 06:08:38'),
('::1', '2022-08-19', 1, '1660892327', '2022-08-19 08:58:47'),
('::1', '2022-08-21', 36, '1661052555', '2022-08-21 05:11:40'),
('::1', '2022-08-25', 20, '1661427156', '2022-08-25 04:41:15'),
('::1', '2022-08-26', 69, '1661513616', '2022-08-26 03:08:56'),
('::1', '2022-08-28', 1, '1661659551', '2022-08-28 06:05:51'),
('::1', '2022-09-03', 2, '1662190375', '2022-09-03 09:16:25'),
('::1', '2022-09-15', 1, '1663199613', '2022-09-15 01:53:33'),
('::1', '2022-09-21', 1, '1663758555', '2022-09-21 13:09:15'),
('::1', '2022-10-08', 1, '1665183770', '2022-10-08 06:02:50'),
('::1', '2022-11-10', 8, '1668072148', '2022-11-10 16:22:00'),
('::1', '2023-07-17', 1, '1689552665', '2023-07-17 07:11:05'),
('::1', '2023-11-04', 18, '1699111590', '2023-11-04 22:22:28'),
('::1', '2023-11-21', 1, '1700552590', '2023-11-21 14:43:10'),
('::1', '2024-01-10', 1, '1704857792', '2024-01-10 10:36:32'),
('::1', '2025-01-30', 9, '1738219618', '2025-01-30 13:45:19'),
('::1', '2025-07-30', 30, '1753816150', '2025-07-30 00:18:58'),
('::1', '2025-07-31', 33, '1753901117', '2025-07-31 00:20:30'),
('::1', '2025-08-01', 9, '1753984247', '2025-08-01 00:03:02');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `l_kelas`
--
ALTER TABLE `l_kelas`
  ADD PRIMARY KEY (`l_kelas_id`);

--
-- Indeks untuk tabel `l_tahun`
--
ALTER TABLE `l_tahun`
  ADD PRIMARY KEY (`id_tahun`);

--
-- Indeks untuk tabel `m_beasiswa`
--
ALTER TABLE `m_beasiswa`
  ADD PRIMARY KEY (`beasiswa_id`),
  ADD UNIQUE KEY `nis` (`nis`);

--
-- Indeks untuk tabel `m_contacts`
--
ALTER TABLE `m_contacts`
  ADD PRIMARY KEY (`no`) USING BTREE;

--
-- Indeks untuk tabel `m_desa`
--
ALTER TABLE `m_desa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_kecamatan`
--
ALTER TABLE `m_kecamatan`
  ADD PRIMARY KEY (`kecamatan_id`);

--
-- Indeks untuk tabel `m_kelas`
--
ALTER TABLE `m_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_kota`
--
ALTER TABLE `m_kota`
  ADD PRIMARY KEY (`kota_id`);

--
-- Indeks untuk tabel `m_lulus`
--
ALTER TABLE `m_lulus`
  ADD PRIMARY KEY (`lulus_id`),
  ADD UNIQUE KEY `nis` (`nis`);

--
-- Indeks untuk tabel `m_lulus_data`
--
ALTER TABLE `m_lulus_data`
  ADD PRIMARY KEY (`id_data`);

--
-- Indeks untuk tabel `m_mapel`
--
ALTER TABLE `m_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_provinsi`
--
ALTER TABLE `m_provinsi`
  ADD PRIMARY KEY (`provinsi_id`);

--
-- Indeks untuk tabel `m_sekolah`
--
ALTER TABLE `m_sekolah`
  ADD PRIMARY KEY (`sekolah_id`);

--
-- Indeks untuk tabel `m_siswa`
--
ALTER TABLE `m_siswa`
  ADD PRIMARY KEY (`siswa_id`) USING BTREE,
  ADD UNIQUE KEY `nis` (`nis`,`kd_sekolah`,`no_daftar`) USING BTREE;

--
-- Indeks untuk tabel `m_vaksin`
--
ALTER TABLE `m_vaksin`
  ADD PRIMARY KEY (`id_vaksin`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nik`),
  ADD UNIQUE KEY `email_pegawai` (`email_pegawai`);

--
-- Indeks untuk tabel `pegawai_access_menu`
--
ALTER TABLE `pegawai_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pegawai_data`
--
ALTER TABLE `pegawai_data`
  ADD PRIMARY KEY (`data_id`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `pegawai_menu`
--
ALTER TABLE `pegawai_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_menu` (`nama_menu`);

--
-- Indeks untuk tabel `pegawai_role`
--
ALTER TABLE `pegawai_role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pegawai_sub_menu`
--
ALTER TABLE `pegawai_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ppdb_bank`
--
ALTER TABLE `ppdb_bank`
  ADD PRIMARY KEY (`kode_bank`);

--
-- Indeks untuk tabel `ppdb_bayar`
--
ALTER TABLE `ppdb_bayar`
  ADD PRIMARY KEY (`id_bayar`);

--
-- Indeks untuk tabel `ppdb_biaya`
--
ALTER TABLE `ppdb_biaya`
  ADD PRIMARY KEY (`id_biaya`);

--
-- Indeks untuk tabel `ppdb_daftar`
--
ALTER TABLE `ppdb_daftar`
  ADD PRIMARY KEY (`id_daftar`),
  ADD UNIQUE KEY `no_daftar` (`no_daftar`);

--
-- Indeks untuk tabel `ppdb_histori`
--
ALTER TABLE `ppdb_histori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ppdb_jenis`
--
ALTER TABLE `ppdb_jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `ppdb_jenjang`
--
ALTER TABLE `ppdb_jenjang`
  ADD PRIMARY KEY (`id_jenjang`);

--
-- Indeks untuk tabel `ppdb_jurusan`
--
ALTER TABLE `ppdb_jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `ppdb_kontak`
--
ALTER TABLE `ppdb_kontak`
  ADD PRIMARY KEY (`id_kontak`);

--
-- Indeks untuk tabel `ppdb_kursus`
--
ALTER TABLE `ppdb_kursus`
  ADD PRIMARY KEY (`id_kursus`);

--
-- Indeks untuk tabel `ppdb_mapel`
--
ALTER TABLE `ppdb_mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indeks untuk tabel `ppdb_materi`
--
ALTER TABLE `ppdb_materi`
  ADD PRIMARY KEY (`id_materi`);

--
-- Indeks untuk tabel `ppdb_nilai_quiz`
--
ALTER TABLE `ppdb_nilai_quiz`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indeks untuk tabel `ppdb_pengumuman`
--
ALTER TABLE `ppdb_pengumuman`
  ADD PRIMARY KEY (`id_pengumuman`);

--
-- Indeks untuk tabel `ppdb_periode`
--
ALTER TABLE `ppdb_periode`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ppdb_sekolah`
--
ALTER TABLE `ppdb_sekolah`
  ADD PRIMARY KEY (`npsn`);

--
-- Indeks untuk tabel `ppdb_soal`
--
ALTER TABLE `ppdb_soal`
  ADD PRIMARY KEY (`id_soal`);

--
-- Indeks untuk tabel `ppdb_soal_opsi`
--
ALTER TABLE `ppdb_soal_opsi`
  ADD PRIMARY KEY (`id_opsi`);

--
-- Indeks untuk tabel `ppdb_tugas`
--
ALTER TABLE `ppdb_tugas`
  ADD PRIMARY KEY (`id_tugas`),
  ADD UNIQUE KEY `id_kursus` (`id_kursus`);

--
-- Indeks untuk tabel `ppdb_tugas_jawab`
--
ALTER TABLE `ppdb_tugas_jawab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kursus` (`id_kursus`) USING BTREE;

--
-- Indeks untuk tabel `ppdb_user_access_menu`
--
ALTER TABLE `ppdb_user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ppdb_user_menu`
--
ALTER TABLE `ppdb_user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ppdb_user_role`
--
ALTER TABLE `ppdb_user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ppdb_user_sub_menu`
--
ALTER TABLE `ppdb_user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `profil_artikel`
--
ALTER TABLE `profil_artikel`
  ADD PRIMARY KEY (`id_artikel`);

--
-- Indeks untuk tabel `profil_belajar`
--
ALTER TABLE `profil_belajar`
  ADD PRIMARY KEY (`belajar_id`);

--
-- Indeks untuk tabel `profil_ekstra`
--
ALTER TABLE `profil_ekstra`
  ADD PRIMARY KEY (`ekstra_id`);

--
-- Indeks untuk tabel `profil_fasilitas`
--
ALTER TABLE `profil_fasilitas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `profil_galeri`
--
ALTER TABLE `profil_galeri`
  ADD PRIMARY KEY (`id_galeri`);

--
-- Indeks untuk tabel `profil_galeri_sub`
--
ALTER TABLE `profil_galeri_sub`
  ADD PRIMARY KEY (`id_galeri_sub`);

--
-- Indeks untuk tabel `profil_guru`
--
ALTER TABLE `profil_guru`
  ADD PRIMARY KEY (`profil_id`);

--
-- Indeks untuk tabel `profil_info`
--
ALTER TABLE `profil_info`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `profil_kepsek`
--
ALTER TABLE `profil_kepsek`
  ADD PRIMARY KEY (`nip`);

--
-- Indeks untuk tabel `profil_osis`
--
ALTER TABLE `profil_osis`
  ADD PRIMARY KEY (`osis_id`);

--
-- Indeks untuk tabel `profil_prestasi`
--
ALTER TABLE `profil_prestasi`
  ADD PRIMARY KEY (`prestasi_id`);

--
-- Indeks untuk tabel `profil_slide`
--
ALTER TABLE `profil_slide`
  ADD PRIMARY KEY (`slide_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `l_kelas`
--
ALTER TABLE `l_kelas`
  MODIFY `l_kelas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `l_tahun`
--
ALTER TABLE `l_tahun`
  MODIFY `id_tahun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `m_beasiswa`
--
ALTER TABLE `m_beasiswa`
  MODIFY `beasiswa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `m_desa`
--
ALTER TABLE `m_desa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `m_kecamatan`
--
ALTER TABLE `m_kecamatan`
  MODIFY `kecamatan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `m_kelas`
--
ALTER TABLE `m_kelas`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `m_kota`
--
ALTER TABLE `m_kota`
  MODIFY `kota_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `m_lulus`
--
ALTER TABLE `m_lulus`
  MODIFY `lulus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `m_mapel`
--
ALTER TABLE `m_mapel`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `m_provinsi`
--
ALTER TABLE `m_provinsi`
  MODIFY `provinsi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `m_sekolah`
--
ALTER TABLE `m_sekolah`
  MODIFY `sekolah_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `m_siswa`
--
ALTER TABLE `m_siswa`
  MODIFY `siswa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT untuk tabel `m_vaksin`
--
ALTER TABLE `m_vaksin`
  MODIFY `id_vaksin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pegawai_access_menu`
--
ALTER TABLE `pegawai_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT untuk tabel `pegawai_data`
--
ALTER TABLE `pegawai_data`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `pegawai_menu`
--
ALTER TABLE `pegawai_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `pegawai_role`
--
ALTER TABLE `pegawai_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `pegawai_sub_menu`
--
ALTER TABLE `pegawai_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT untuk tabel `ppdb_daftar`
--
ALTER TABLE `ppdb_daftar`
  MODIFY `id_daftar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `ppdb_histori`
--
ALTER TABLE `ppdb_histori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ppdb_kontak`
--
ALTER TABLE `ppdb_kontak`
  MODIFY `id_kontak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `ppdb_kursus`
--
ALTER TABLE `ppdb_kursus`
  MODIFY `id_kursus` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ppdb_materi`
--
ALTER TABLE `ppdb_materi`
  MODIFY `id_materi` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `ppdb_pengumuman`
--
ALTER TABLE `ppdb_pengumuman`
  MODIFY `id_pengumuman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `ppdb_periode`
--
ALTER TABLE `ppdb_periode`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `ppdb_soal`
--
ALTER TABLE `ppdb_soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `ppdb_soal_opsi`
--
ALTER TABLE `ppdb_soal_opsi`
  MODIFY `id_opsi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `ppdb_tugas`
--
ALTER TABLE `ppdb_tugas`
  MODIFY `id_tugas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `profil_artikel`
--
ALTER TABLE `profil_artikel`
  MODIFY `id_artikel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `profil_belajar`
--
ALTER TABLE `profil_belajar`
  MODIFY `belajar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `profil_ekstra`
--
ALTER TABLE `profil_ekstra`
  MODIFY `ekstra_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `profil_fasilitas`
--
ALTER TABLE `profil_fasilitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `profil_galeri`
--
ALTER TABLE `profil_galeri`
  MODIFY `id_galeri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `profil_galeri_sub`
--
ALTER TABLE `profil_galeri_sub`
  MODIFY `id_galeri_sub` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `profil_guru`
--
ALTER TABLE `profil_guru`
  MODIFY `profil_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `profil_kepsek`
--
ALTER TABLE `profil_kepsek`
  MODIFY `nip` int(35) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `profil_osis`
--
ALTER TABLE `profil_osis`
  MODIFY `osis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `profil_prestasi`
--
ALTER TABLE `profil_prestasi`
  MODIFY `prestasi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `profil_slide`
--
ALTER TABLE `profil_slide`
  MODIFY `slide_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
