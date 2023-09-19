class Quiz {
  final String title;
  final List<Question> questions;

  Quiz({required this.title, required this.questions});
}

class Question {
  final List<QuestionContent> contents;
  final List<String> answers; // index lenght must be 4 {0, 1, 2, 3}
  final int correct; // filled with index of correct answers

  Question(
      {required this.contents, required this.answers, required this.correct});
}

class QuestionContent {
  final String
      content; // if type is 1 it's filled with question and if type is 2 it's filled with image asset path
  final int type; // only 1 or 2

  QuestionContent({required this.content, required this.type});
}

List<Quiz> getQuizzes = [
  // Quiz(title: 'Disaster', questions: [
  //   Question(
  //     contents: [
  //       QuestionContent(
  //         content: 'What is the primary cause of earthquakes?',
  //         type: 1,
  //       ),
  //     ],
  //     answers: [
  //       'Volcanic eruptions',
  //       'Tornadoes',
  //       'Tectonic plate movement',
  //       'Heavy rainfall',
  //     ],
  //     correct: 2,
  //   ),
  //   Question(
  //     contents: [
  //       QuestionContent(
  //         content:
  //             'Which of the following is a natural disaster associated with water?',
  //         type: 1,
  //       ),
  //     ],
  //     answers: [
  //       'Wildfire',
  //       'Flood',
  //       'Earthquake',
  //       'Heatwave',
  //     ],
  //     correct: 1,
  //   ),
  //   Question(
  //     contents: [
  //       QuestionContent(
  //         content:
  //             'What is the most common gas emitted during a volcanic eruption?',
  //         type: 1,
  //       ),
  //     ],
  //     answers: [
  //       'Oxygen',
  //       'Carbon dioxide',
  //       'Hydrogen',
  //       'Methane',
  //     ],
  //     correct: 1,
  //   ),
  //   Question(
  //     contents: [
  //       QuestionContent(
  //         content:
  //             'Which of the following disasters is caused by the rapid shifting of tectonic plates beneath the Earth\'s surface?',
  //         type: 1,
  //       ),
  //     ],
  //     answers: [
  //       'Tornado',
  //       'Hurricane',
  //       'Earthquake',
  //       'Flood',
  //     ],
  //     correct: 2,
  //   ),
  //   Question(
  //     contents: [
  //       QuestionContent(
  //         content: 'What is the primary cause of tsunamis?',
  //         type: 1,
  //       ),
  //     ],
  //     answers: [
  //       'Volcanic eruption',
  //       'Tornado',
  //       'Earthquake under the ocean floor',
  //       'Heavy rainfall',
  //     ],
  //     correct: 2,
  //   ),
  //   Question(
  //     contents: [
  //       QuestionContent(
  //         content:
  //             'Which type of disaster is characterized by a sudden and violent shaking of the ground?',
  //         type: 1,
  //       ),
  //     ],
  //     answers: [
  //       'Tornado',
  //       'Earthquake',
  //       'Flood',
  //       'Hurricane',
  //     ],
  //     correct: 1,
  //   ),
  //   Question(
  //     contents: [
  //       QuestionContent(
  //         content: 'What is the main cause of wildfires?',
  //         type: 1,
  //       ),
  //     ],
  //     answers: [
  //       'Heavy rainfall',
  //       'Tornadoes',
  //       'Human activity',
  //       'Earthquakes',
  //     ],
  //     correct: 2,
  //   ),
  //   Question(
  //     contents: [
  //       QuestionContent(
  //         content:
  //             'Which of the following disasters is driven by the heating of the Earth\'s atmosphere?',
  //         type: 1,
  //       ),
  //     ],
  //     answers: [
  //       'Earthquake',
  //       'Tornado',
  //       'Heatwave',
  //       'Flood',
  //     ],
  //     correct: 2,
  //   ),
  //   Question(
  //     contents: [
  //       QuestionContent(
  //         content: 'What is the primary cause of landslides?',
  //         type: 1,
  //       ),
  //     ],
  //     answers: [
  //       'Tornadoes',
  //       'Heavy rainfall',
  //       'Volcanic eruption',
  //       'Tectonic plate movement',
  //     ],
  //     correct: 1,
  //   ),
  //   Question(
  //     contents: [
  //       QuestionContent(
  //         content:
  //             'Which disaster is characterized by the overflow of water onto normally dry land?',
  //         type: 1,
  //       ),
  //     ],
  //     answers: [
  //       'Tornado',
  //       'Wildfire',
  //       'Flood',
  //       'Earthquake',
  //     ],
  //     correct: 2,
  //   ),
  // ]),

  // Quiz 2
  Quiz(title: 'Mitigasi Gunung Merapi', questions: [
    Question(
      contents: [
        QuestionContent(
          content: 'Berapa ketinggian puncak Gunung Merapi?',
          type: 1,
        ),
      ],
      answers: [
        '2.290 meter',
        '3.142 meter',
        '4.365 meter',
        '5.678 meter',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'Apa nama sistem peringatan dini yang digunakan di Sleman?',
          type: 1,
        ),
      ],
      answers: [
        'SMART',
        'SIAGA',
        'SATKORLAK',
        'EWS',
      ],
      correct: 3,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'Apa yang harus dilakukan jika terjadi hujan abu vulkanik?',
          type: 1,
        ),
      ],
      answers: [
        'Berjemur di luar rumah',
        'Menggunakan payung biasa',
        'Menggunakan masker N95',
        'Bermain di luar rumah',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'Bagaimana cara mengidentifikasi zona bahaya Gunung Merapi?',
          type: 1,
        ),
      ],
      answers: [
        'Dengan melihat perubahan warna langit',
        'Dengan mendengarkan nyanyian burung',
        'Menggunakan peta evakuasi',
        'Mengandalkan perasaan pribadi',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'Apa fungsi pos pengamatan Gunung Merapi?',
          type: 1,
        ),
        QuestionContent(
          content: 'quiz1.jpg',
          type: 2,
        ),
      ],
      answers: [
        'Menjual suvenir Gunung Merapi',
        'Memantau aktivitas Gunung Merapi',
        'Menyediakan makanan',
        'Mengadakan konser musik',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'Bagaimana cara menghindari bahaya dari lahar dingin?',
          type: 1,
        ),
      ],
      answers: [
        'Berlari secepat mungkin',
        'Tetap di dalam rumah',
        'Mendaki ke puncak gunung',
        'Mengikuti rute evakuasi yang ditetapkan',
      ],
      correct: 3,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Apa yang harus dilakukan saat terjadi erupsi Gunung Merapi?',
          type: 1,
        ),
      ],
      answers: [
        'Melihat erupsi dari jarak dekat',
        'Meninggalkan zona bahaya sesuai perintah',
        'Berjemur di luar rumah',
        'Mencoba memadamkan erupsi',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Bagaimana cara merawat masker N95 untuk perlindungan dari abu vulkanik?',
          type: 1,
        ),
      ],
      answers: [
        'Melemparkannya setelah digunakan sekali',
        'Mencucinya dengan sabun biasa',
        'Menyimpannya di tempat kering dan bersih',
        'Menggunakannya berulang kali tanpa mencuci',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'Apa itu Tanggap Darurat Bencana (TDB) dan apa peranannya?',
          type: 1,
        ),
      ],
      answers: [
        'TDB adalah tarian tradisional di Sleman',
        'TDB adalah tim penyelamat bencana',
        'TDB adalah tempat bermain anak-anak',
        'TDB adalah festival kuliner',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Apa langkah pertama yang harus diambil saat mendengar peringatan awal erupsi Gunung Merapi?',
          type: 1,
        ),
      ],
      answers: [
        'Berbicara dengan teman-teman tentangnya',
        'Mengabaikannya dan berharap tidak terjadi',
        'Menerima peringatan dan mengikuti petunjuk resmi',
        'Bermain game online',
      ],
      correct: 2,
    ),
  ]),

  // Quiz 3

  Quiz(title: 'Evakuasi Aman di Gunung Merapi', questions: [
    Question(
      contents: [
        QuestionContent(
          content:
              'Bagaimana prosedur evakuasi yang benar saat terjadi erupsi Gunung Merapi?',
          type: 1,
        ),
        QuestionContent(
          content: 'quiz2.jpg',
          type: 2,
        ),
      ],
      answers: [
        'Tetap tinggal di dalam rumah',
        'Berlari ke arah Gunung Merapi',
        'Meninggalkan zona bahaya sesuai petunjuk resmi',
        'Mengadakan pesta evakuasi',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'Apa yang harus dibawa saat evakuasi dari zona bahaya?',
          type: 1,
        ),
      ],
      answers: [
        'Peralatan camping',
        'Buku-buku pelajaran',
        'Tas darurat dengan persediaan makanan, air, obat-obatan, dan dokumen penting',
        'Peralatan memasak',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Apa yang harus dilakukan jika terjebak di dalam rumah saat erupsi?',
          type: 1,
        ),
      ],
      answers: [
        'Mencoba keluar dengan aman jika memungkinkan',
        'Tetap berada di dalam rumah dan menunggu bantuan',
        'Membuka jendela untuk melihat keadaan luar',
        'Menghidupkan TV dan menonton berita',
      ],
      correct: 0,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'Bagaimana mengamankan kendaraan saat terjadi erupsi?',
          type: 1,
        ),
      ],
      answers: [
        'Meninggalkan kendaraan di mana saja',
        'Membawa kendaraan ke zona aman',
        'Menggunakan kendaraan untuk berlindung dari erupsi',
        'Meninggalkan kendaraan di jalan raya',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'Apa yang perlu diperhatikan saat mencari tempat evakuasi?',
          type: 1,
        ),
      ],
      answers: [
        'Pilih tempat yang terdekat tanpa memeriksa kondisinya',
        'Pastikan tempat tersebut aman dari bahaya erupsi',
        'Pilih tempat yang memiliki fasilitas mewah',
        'Tidak perlu mencari tempat evakuasi',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Apa yang harus dilakukan jika ada anggota keluarga yang terpisah selama evakuasi?',
          type: 1,
        ),
      ],
      answers: [
        'Biarkan saja mereka mencari tempat sendiri',
        'Tetaplah di tempat yang aman dan hubungi pihak berwenang',
        'Lanjutkan evakuasi tanpa peduli pada anggota keluarga yang terpisah',
        'Cari mereka dengan segera tanpa memperhatikan keamanan diri',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Bagaimana cara mengidentifikasi tempat aman di dalam rumah?',
          type: 1,
        ),
      ],
      answers: [
        'Terus berjalan di dalam rumah sampai menemukan tempat yang sesuai',
        'Pilih ruangan dengan jendela besar',
        'Pilih ruangan terdekat dengan pintu keluar',
        'Tidur di bawah tangga',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'Apa yang harus dilakukan jika rute evakuasi terhalang?',
          type: 1,
        ),
      ],
      answers: [
        'Terus mencoba menembus rute yang terhalang',
        'Kembali ke rumah dan menunggu di sana',
        'Mencari rute alternatif atau tempat perlindungan',
        'Mengadakan piknik di tempat tersebut',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'Apa yang harus dilakukan jika terluka selama evakuasi?',
          type: 1,
        ),
      ],
      answers: [
        'Menutupi luka dengan tanah atau abu',
        'Meminta orang lain untuk melihat luka',
        'Membersihkan luka dan memberikan perawatan pertama',
        'Melanjutkan perjalanan tanpa memperhatikan luka',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Bagaimana cara membantu tetangga yang membutuhkan selama evakuasi?',
          type: 1,
        ),
      ],
      answers: [
        'Mengabaikan mereka karena harus fokus pada diri sendiri',
        'Menyediakan bantuan jika memungkinkan, seperti membawa persediaan darurat',
        'Menertawakan mereka karena panik',
        'Menyuruh mereka untuk mencari pertolongan sendiri',
      ],
      correct: 1,
    ),
  ]),

  // Quiz 4
  Quiz(title: 'Pemahaman Peta Evakuasi Gunung Merapi', questions: [
    Question(
      contents: [
        QuestionContent(
          content: 'Bagaimana cara membaca peta evakuasi Gunung Merapi?',
          type: 1,
        ),
      ],
      answers: [
        'Menggunakan teropong',
        'Melihat ke arah Gunung Merapi',
        'Mengikuti petunjuk dan simbol yang tertera',
        'Menghitung jumlah pohon di sekitar Gunung Merapi',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'Apa itu zona bahaya tinggi, zona siaga, dan zona aman?',
          type: 1,
        ),
      ],
      answers: [
        'Nama-nama sekolah di Sleman',
        'Tingkat kebahayaan berdasarkan jarak dari Gunung Merapi',
        'Nama-nama sungai di Sleman',
        'Tingkat kesulitan pendakian Gunung Merapi',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Bagaimana mengidentifikasi lokasi tempat evakuasi terdekat?',
          type: 1,
        ),
      ],
      answers: [
        'Bertanya pada tetangga',
        'Mengikuti arah mata angin',
        'Menggunakan peta evakuasi dan menemukan lokasi yang paling dekat',
        'Memanggil pihak berwenang',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'Apa perbedaan antara rute evakuasi primer dan sekunder?',
          type: 1,
        ),
      ],
      answers: [
        'Tidak ada perbedaan',
        'Rute evakuasi primer hanya untuk kendaraan',
        'Rute evakuasi sekunder adalah yang paling aman',
        'Rute evakuasi primer adalah yang paling pendek',
      ],
      correct: 3,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'Apa yang harus dilakukan jika rute evakuasi terhalang?',
          type: 1,
        ),
      ],
      answers: [
        'Berhenti dan menunggu di tempat yang terhalang',
        'Kembali ke rumah dan tidur',
        'Menyerah dan menyerahkan nasib pada keadaan',
        'Mencari rute alternatif atau tempat perlindungan',
      ],
      correct: 3,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Apa yang perlu diperhatikan saat menggunakan peta evakuasi dalam situasi darurat?',
          type: 1,
        ),
      ],
      answers: [
        'Menyalakan ponsel untuk mencari petunjuk',
        'Tetap tenang dan fokus pada petunjuk peta',
        'Melupakan peta dan mengandalkan insting',
        'Membaca peta dengan cepat tanpa memeriksa simbol',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'Bagaimana cara mengidentifikasi titik kumpul yang aman?',
          type: 1,
        ),
      ],
      answers: [
        'Mencari tempat dengan banyak pohon',
        'Mengikuti kerumunan orang lain tanpa berpikir',
        'Menggunakan peta evakuasi untuk menemukan titik kumpul yang ditunjukkan',
        'Menunggu di tempat yang nyaman',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Apa yang harus dilakukan jika ada perubahan situasi selama evakuasi?',
          type: 1,
        ),
      ],
      answers: [
        'Terus bergerak tanpa memperhatikan perubahan',
        'Mengabaikan perubahan dan tetap di tempat semula',
        'Panik dan berlari ke arah yang tidak jelas',
        'Mengikuti petunjuk pihak berwenang dan beradaptasi dengan perubahan',
      ],
      correct: 3,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'Apa peran peta evakuasi dalam upaya mitigasi bencana?',
          type: 1,
        ),
      ],
      answers: [
        'Memberikan panduan visual tentang zona-zona bahaya dan rute evakuasi',
        'Hanya untuk tujuan dekorasi',
        'Menunjukkan jalan-jalan indah di sekitar Gunung Merapi',
        'Tidak memiliki peran dalam mitigasi bencana',
      ],
      correct: 0,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Bagaimana cara berkomunikasi dengan keluarga selama evakuasi menggunakan peta?',
          type: 1,
        ),
      ],
      answers: [
        'Mengabaikan keluarga dan fokus pada peta',
        'Menyebutkan koordinat GPS secara terus-menerus',
        'Menggambar gambar lucu di peta untuk menghibur keluarga',
        'Menggunakan peta untuk menjelaskan lokasi dan rencana evakuasi kepada keluarga',
      ],
      correct: 3,
    ),
  ]),

  // Quiz 5
  Quiz(title: 'Persiapan Keluarga untuk Erupsi Gunung Merapi', questions: [
    Question(
      contents: [
        QuestionContent(
          content: 'Apa yang harus ada di dalam tas darurat keluarga?',
          type: 1,
        ),
      ],
      answers: [
        'Dokumen penting, persediaan makanan, air, obat-obatan, pakaian, dan alat komunikasi',
        'Sepatu lari',
        'Perangkat elektronik',
        'Sepeda gunung',
      ],
      correct: 0,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Bagaimana cara merencanakan pertemuan keluarga jika terpisah selama evakuasi?',
          type: 1,
        ),
      ],
      answers: [
        'Tidak perlu merencanakan pertemuan',
        'Mencari mereka di seluruh kota',
        'Menetapkan titik kumpul dan menyusun rencana komunikasi',
        'Mengandalkan keberuntungan',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Apa yang perlu disiapkan untuk anak-anak dan lansia selama evakuasi?',
          type: 1,
        ),
      ],
      answers: [
        'Baju renang',
        'Mainan baru',
        'Obat-obatan dan perlengkapan khusus sesuai kebutuhan',
        'Alat-alat berat',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Apa yang harus diperhatikan saat memilih tempat aman di dalam rumah?',
          type: 1,
        ),
      ],
      answers: [
        'Pilih ruangan terdekat dengan pintu keluar dan bebas dari jendela pecah',
        'Ukuran televisi',
        'Ketersediaan jendela yang besar',
        'Kualitas furnitur',
      ],
      correct: 0,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Bagaimana cara membuat rencana komunikasi keluarga dalam situasi darurat?',
          type: 1,
        ),
      ],
      answers: [
        'Tidak perlu membuat rencana komunikasi',
        'Menggunakan bahasa yang rumit',
        'Menetapkan kontak darurat, tempat kumpul, dan cara berkomunikasi',
        'Menggantungkan diri pada telepon seluler',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Apa peran hewan peliharaan dalam rencana evakuasi keluarga?',
          type: 1,
        ),
      ],
      answers: [
        'Dibiarkan di rumah',
        'Disiapkan dengan makanan, air, dan tempat tinggal yang aman',
        'Menjadi prioritas utama dalam evakuasi',
        'Tidak perlu memikirkan hewan peliharaan',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Bagaimana cara mengamankan dokumen penting seperti KTP dan kartu keluarga?',
          type: 1,
        ),
      ],
      answers: [
        'Membakarnya untuk menghindari pencurian identitas',
        'Meninggalkannya di rumah',
        'Membuangnya',
        'Menyimpannya dalam tas darurat keluarga',
      ],
      correct: 3,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Apa yang harus dilakukan jika anggota keluarga memiliki kebutuhan khusus?',
          type: 1,
        ),
      ],
      answers: [
        'Tidak perlu memperhatikan kebutuhan khusus mereka',
        'Mengabaikan mereka',
        'Memasukkan kebutuhan khusus mereka dalam rencana evakuasi keluarga',
        'Membiarkan mereka merasa sendiri',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'Bagaimana cara melindungi barang berharga selama evakuasi?',
          type: 1,
        ),
      ],
      answers: [
        'Menggunakan tas darurat untuk barang berharga',
        'Meninggalkan barang berharga di rumah',
        'Menyimpannya di dalam mobil',
        'Membagikannya kepada orang lain',
      ],
      correct: 0,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Apa yang perlu dilakukan setelah kembali ke rumah setelah erupsi?',
          type: 1,
        ),
      ],
      answers: [
        'Mengabaikan peralatan darurat',
        'Membersihkan rumah dan memeriksa kondisi bangunan',
        'Langsung tidur',
        'Melanjutkan aktivitas seperti biasa',
      ],
      correct: 1,
    ),
  ]),

  // Quiz 6
  Quiz(
      title: 'Kesiapsiagaan Sekolah terhadap Erupsi Gunung Merapi',
      questions: [
        Question(
          contents: [
            QuestionContent(
              content:
                  'Apa langkah-langkah yang harus diambil oleh sekolah saat mendengar peringatan erupsi?',
              type: 1,
            ),
          ],
          answers: [
            'Melanjutkan kegiatan pelajaran seperti biasa',
            'Mengabaikan peringatan tersebut',
            'Menghentikan semua kegiatan dan mengikuti prosedur evakuasi sekolah',
            'Mengundurkan diri dari sekolah',
          ],
          correct: 2,
        ),
        Question(
          contents: [
            QuestionContent(
              content:
                  'Bagaimana cara mengatur evakuasi siswa dan staf sekolah dengan aman?',
              type: 1,
            ),
            QuestionContent(
              content: 'quiz3.jpg',
              type: 2,
            ),
          ],
          answers: [
            'Tidak perlu mengatur evakuasi',
            'Menggunakan tangga yang sempit',
            'Berteriak dan panik',
            'Mengikuti rute evakuasi yang telah ditentukan dan memastikan semua orang mengikuti',
          ],
          correct: 3,
        ),
        Question(
          contents: [
            QuestionContent(
              content:
                  'Apa yang harus dilakukan agar fasilitas sekolah tetap aman selama erupsi?',
              type: 1,
            ),
          ],
          answers: [
            'Mengikuti panduan pemeliharaan dan melaksanakan tindakan pencegahan yang diberikan oleh pihak berwenang',
            'Mengerahkan siswa untuk membersihkan area sekolah',
            'Menutup pintu dan jendela dengan rapat',
            'Tidak melakukan apa-apa',
          ],
          correct: 0,
        ),
        Question(
          contents: [
            QuestionContent(
              content:
                  'Bagaimana cara memberikan edukasi tentang mitigasi bencana kepada siswa?',
              type: 1,
            ),
          ],
          answers: [
            'Mengadakan pertunjukan sulap',
            'Menggunakan materi pelajaran reguler untuk itu',
            'Mengabaikan pendidikan bencana',
            'Menyuruh siswa membaca buku sendiri',
          ],
          correct: 1,
        ),
        Question(
          contents: [
            QuestionContent(
              content:
                  'Apa peran guru dan staf sekolah dalam mengamankan siswa selama erupsi?',
              type: 1,
            ),
          ],
          answers: [
            'Tidak memiliki peran',
            'Melarikan diri dan meninggalkan siswa',
            'Bertanggung jawab untuk memastikan siswa mengikuti prosedur evakuasi dengan aman',
            'Menggunakan siswa sebagai perlindungan tubuh',
          ],
          correct: 2,
        ),
        Question(
          contents: [
            QuestionContent(
              content:
                  'Bagaimana mengidentifikasi titik kumpul dan rute evakuasi di sekolah?',
              type: 1,
            ),
          ],
          answers: [
            'Tidak perlu mengetahuinya',
            'Menggunakan peta sekolah dan mengikuti tanda-tanda',
            'Bergantung pada penunjuk jalan lisan',
            'Mengandalkan insting',
          ],
          correct: 1,
        ),
        Question(
          contents: [
            QuestionContent(
              content:
                  'Apa yang harus dilakukan jika siswa terpisah dari kelompok selama evakuasi?',
              type: 1,
            ),
          ],
          answers: [
            'Tidak perlu mencari siswa yang terpisah',
            'Melanjutkan evakuasi tanpa memperhatikan siswa yang terpisah',
            'Menghubungi pihak berwenang dan memberikan informasi tentang siswa yang terpisah',
            'Mengabaikan siswa yang terpisah',
          ],
          correct: 2,
        ),
        Question(
          contents: [
            QuestionContent(
              content:
                  'Apa peran orang tua dalam kesiapsiagaan sekolah terhadap bencana?',
              type: 1,
            ),
          ],
          answers: [
            'Tidak memiliki peran',
            'Mengawasi anak-anak mereka di sekolah',
            'Memberi tahu anak-anak untuk tidak mendengarkan petunjuk sekolah',
            'Mengabaikan komunikasi dengan sekolah',
          ],
          correct: 1,
        ),
        Question(
          contents: [
            QuestionContent(
              content:
                  'Bagaimana mengatur komunikasi antara sekolah dan orang tua selama erupsi?',
              type: 1,
            ),
          ],
          answers: [
            'Tidak perlu berkomunikasi dengan orang tua',
            'Menggunakan surat dan telepon',
            'Menghindari kontak dengan orang tua',
            'Menggunakan kode Morse',
          ],
          correct: 1,
        ),
        Question(
          contents: [
            QuestionContent(
              content:
                  'Apa langkah-langkah untuk pemulihan sekolah setelah erupsi?',
              type: 1,
            ),
          ],
          answers: [
            'Tidak melakukan apa-apa',
            'Membuka kembali sekolah tanpa memeriksa kerusakan',
            'Mengevaluasi kerusakan, memulihkan fasilitas, dan melanjutkan aktivitas sekolah',
            'Menunggu berbulan-bulan sebelum melanjutkan sekolah',
          ],
          correct: 2,
        ),
      ]),

  // Quiz 7
  Quiz(title: 'Kesiapan Komunitas untuk Erupsi Gunung Merapi', questions: [
    Question(
      contents: [
        QuestionContent(
          content:
              'Apa yang harus dilakukan oleh anggota komunitas saat mendengar peringatan dini erupsi?',
          type: 1,
        ),
      ],
      answers: [
        'Melanjutkan aktivitas seperti biasa',
        'Segera meninggalkan rumah dan pergi ke tempat yang aman sesuai panduan evakuasi',
        'Mengadakan pesta evakuasi',
        'Tidak mempedulikan peringatan dini',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Apa yang perlu diperhatikan saat membantu anggota komunitas yang membutuhkan selama erupsi?',
          type: 1,
        ),
      ],
      answers: [
        'Mengabaikan mereka',
        'Memberikan dukungan, termasuk persediaan makanan dan obat-obatan, jika memungkinkan',
        'Mengejek mereka',
        'Menyuruh mereka mencari pertolongan sendiri',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Bagaimana cara berkomunikasi dengan tetangga selama erupsi?',
          type: 1,
        ),
      ],
      answers: [
        'Tidak perlu berkomunikasi dengan tetangga',
        'Menggunakan telepon seluler untuk mengirim pesan teks',
        'Berbicara langsung dan berbagi informasi tentang situasi',
        'Menutup pintu dan jendela dan bersembunyi',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Apa yang perlu diperhatikan saat merawat hewan peliharaan milik tetangga selama erupsi?',
          type: 1,
        ),
      ],
      answers: [
        'Tidak perlu merawat hewan peliharaan tetangga',
        'Menyediakan makanan dan air untuk hewan peliharaan jika pemiliknya tidak ada',
        'Menyingkirkan hewan peliharaan karena mereka menjadi beban',
        'Membawa hewan peliharaan ke zona bahaya',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Bagaimana mengorganisir pertemuan komunitas untuk membahas rencana darurat?',
          type: 1,
        ),
      ],
      answers: [
        'Tidak perlu mengadakan pertemuan',
        'Mengadakan pertemuan secara rutin dan mendiskusikan rencana darurat bersama komunitas',
        'Menggunakan media sosial untuk berkomunikasi',
        'Mengabaikan rencana darurat',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Apa yang harus dilakukan jika ada anggota komunitas yang memerlukan evakuasi darurat?',
          type: 1,
        ),
      ],
      answers: [
        'Membantu mereka meninggalkan zona bahaya dengan segera',
        'Mengabaikan mereka',
        'Meninggalkan mereka di rumah',
        'Menyalahkan mereka atas situasi tersebut',
      ],
      correct: 0,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Bagaimana cara mengakses layanan kesehatan darurat saat fasilitas kesehatan tradisional tidak dapat dijangkau?',
          type: 1,
        ),
      ],
      answers: [
        'Tidak perlu mencari layanan kesehatan darurat',
        'Menggunakan alat medis sendiri',
        'Menghubungi pusat layanan darurat dan mengikuti petunjuk mereka',
        'Membuang barang-barang medis yang tidak terpakai',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Apa yang perlu dilakukan jika anggota komunitas mengalami masalah kesehatan selama erupsi?',
          type: 1,
        ),
        QuestionContent(
          content: 'quiz4.jpg',
          type: 2,
        ),
      ],
      answers: [
        'Mengabaikan mereka',
        'Mencari dokter secepat mungkin',
        'Membantu mereka mendapatkan perawatan medis sesuai kebutuhan',
        'Menyalahkan mereka atas masalah kesehatan mereka',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Bagaimana cara berpartisipasi dalam jaringan komunitas untuk berbagi informasi dan dukungan?',
          type: 1,
        ),
      ],
      answers: [
        'Tidak perlu berpartisipasi',
        'Menggunakan media sosial untuk berbicara dengan orang lain',
        'Menjauhi komunikasi dengan komunitas',
        'Bergabung dalam kelompok komunitas atau forum online yang relevan',
      ],
      correct: 3,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Apa peran posko komunitas dalam mendukung mitigasi bencana?',
          type: 1,
        ),
      ],
      answers: [
        'Tidak memiliki peran',
        'Menjadi tempat berkumpul untuk berpesta',
        'Memberikan informasi, dukungan, dan bantuan dalam situasi darurat',
        'Menjauhi posko komunitas',
      ],
      correct: 2,
    ),
  ]),

  // Quiz 8
  Quiz(
    title: 'Keselamatan dan Pertolongan Pertama saat Erupsi Gunung Merapi',
    questions: [
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang perlu dilakukan saat terkena hujan abu vulkanik selama erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Mencoba menangkap sebanyak mungkin abu vulkanik untuk koleksi',
          'Menggunakan masker N95 dan melindungi mata dengan kacamata',
          'Berlari secepat mungkin ke tempat aman',
          'Mencari payung biasa',
        ],
        correct: 1,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Bagaimana cara mengenali gejala awal keracunan gas vulkanik?',
            type: 1,
          ),
        ],
        answers: [
          'Mengikuti informasi dari pihak berwenang ketika merasa sakit atau pusing',
          'Tidak perlu mengenali gejala tersebut',
          'Mengandalkan insting',
          'Mencoba menghirup lebih banyak gas vulkanik',
        ],
        correct: 0,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang perlu dilakukan jika terkena luka akibat puing atau batuan selama erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Mengabaikannya',
          'Menutupi luka dengan tangan',
          'Membersihkan luka dan memberikan perawatan pertama',
          'Melanjutkan bermain dengan batuan tersebut',
        ],
        correct: 2,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Bagaimana cara mengamankan diri saat terjadi aliran lahar dingin?',
            type: 1,
          ),
        ],
        answers: [
          'Mencoba berlari lebih cepat dari lahar dingin',
          'Menghindari daerah yang mungkin terkena lahar dingin',
          'Berenang di dalam lahar dingin',
          'Mencoba menangkap lahar dingin untuk digunakan nanti',
        ],
        correct: 1,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang perlu diperhatikan saat memberikan pertolongan pertama kepada korban selama erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Tidak perlu memberikan pertolongan pertama',
          'Mengabaikan korban',
          'Mengetahui tindakan pertolongan pertama yang benar dan melakukannya dengan hati-hati',
          'Menyuruh orang lain untuk memberikan pertolongan pertama',
        ],
        correct: 2,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Bagaimana cara mengidentifikasi tempat yang aman untuk berlindung saat erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Bergantung pada insting semata',
          'Membaca petunjuk dari pihak berwenang dan mengikuti rute evakuasi',
          'Menutup mata dan berdoa',
          'Tidak perlu mencari tempat yang aman',
        ],
        correct: 1,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang harus dilakukan jika seseorang mengalami kesulitan bernapas akibat paparan asap vulkanik?',
            type: 1,
          ),
        ],
        answers: [
          'Menghindari membantu dan melarikan diri',
          'Mencoba menyelamatkan diri sendiri terlebih dahulu',
          'Membantu orang tersebut dengan memberikan pertolongan pertama, jika memungkinkan',
          'Mengabaikan mereka',
        ],
        correct: 2,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Bagaimana cara memberikan pertolongan pertama kepada seseorang yang terluka oleh pohon tumbang selama erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Mencoba membebaskan mereka dengan aman',
          'Menyuruh mereka berlari',
          'Mengabaikan mereka',
          'Meninggalkan mereka di tempat kejadian',
        ],
        correct: 0,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang perlu diperhatikan saat mengenali gejala awal dehidrasi selama erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Tidak perlu memperhatikan gejala dehidrasi',
          'Menjaga asupan cairan, mengenali gejala seperti mulut kering, haus berlebihan, dan urine gelap',
          'Mengandalkan intuisi',
          'Minum alkohol untuk menghilangkan rasa haus',
        ],
        correct: 1,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Bagaimana cara mengidentifikasi sumber air yang aman untuk digunakan selama erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Mencoba air dari semua sumber yang tersedia',
          'Mengandalkan indera penciuman',
          'Mengikuti petunjuk dari pihak berwenang dan menggunakan air yang telah disediakan',
          'Tidak perlu mencari sumber air',
        ],
        correct: 2,
      ),
    ],
  ),

  // Quiz 9
  Quiz(
    title:
        'Kesiapsiagaan Pihak Berwenang dalam Menghadapi Erupsi Gunung Merapi',
    questions: [
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang harus dilakukan oleh pihak berwenang ketika menerima peringatan dini erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Mengabaikan peringatan tersebut',
          'Menunda pengambilan tindakan',
          'Segera mengaktifkan prosedur darurat dan menginformasikan masyarakat',
          'Mencoba mengelak dari tanggung jawab',
        ],
        correct: 2,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Bagaimana cara mendistribusikan informasi darurat kepada masyarakat secara efektif?',
            type: 1,
          ),
        ],
        answers: [
          'Hanya mengandalkan media sosial',
          'Menggunakan berbagai saluran komunikasi, seperti radio, televisi, sirene, dan pesan teks',
          'Mengirimkan surat kepada setiap rumah',
          'Mengabaikan upaya komunikasi',
        ],
        correct: 1,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa peran petugas pemadam kebakaran dalam mitigasi erupsi Gunung Merapi?',
            type: 1,
          ),
        ],
        answers: [
          'Tidak memiliki peran',
          'Mengabaikan upaya pemadaman',
          'Membantu dalam evakuasi dan pemadaman kebakaran yang mungkin terjadi akibat erupsi',
          'Hanya berfokus pada pemadaman kebakaran biasa',
        ],
        correct: 2,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Bagaimana cara mengkoordinasikan evakuasi dan bantuan darurat antara berbagai pihak berwenang?',
            type: 1,
          ),
        ],
        answers: [
          'Tidak perlu berkoordinasi',
          'Membuat keputusan secara individual',
          'Membiarkan setiap pihak berwenang bertindak sesuai keinginan mereka',
          'Menggunakan posko komando darurat dan berkomunikasi secara teratur',
        ],
        correct: 3,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang perlu dilakukan oleh pihak berwenang untuk memastikan perlindungan terhadap fasilitas penting, seperti jalan raya dan infrastruktur kritis?',
            type: 1,
          ),
        ],
        answers: [
          'Tidak perlu melakukan apa-apa',
          'Menghentikan semua transportasi umum',
          'Melakukan perawatan dan perlindungan terhadap fasilitas tersebut sesuai prosedur',
          'Mengabaikan fasilitas tersebut',
        ],
        correct: 2,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Bagaimana cara mempersiapkan fasilitas evakuasi darurat untuk masyarakat yang terdampak?',
            type: 1,
          ),
        ],
        answers: [
          'Tidak perlu mempersiapkan fasilitas evakuasi',
          'Menggunakan tempat yang tersedia tanpa persiapan',
          'Mendirikan fasilitas evakuasi dengan persediaan makanan, air, dan tempat tidur',
          'Membuang fasilitas evakuasi',
        ],
        correct: 2,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang perlu dilakukan oleh pihak berwenang untuk memberikan dukungan psikososial kepada masyarakat yang terdampak erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Menyediakan konseling dan dukungan psikologis',
          'Tidak perlu memberikan dukungan psikososial',
          'Memberikan bantuan materi saja',
          'Menyalahkan masyarakat atas keadaan mereka',
        ],
        correct: 0,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Bagaimana mengelola logistik dan persediaan dalam situasi darurat seperti erupsi Gunung Merapi?',
            type: 1,
          ),
        ],
        answers: [
          'Tidak perlu mengelola logistik dan persediaan',
          'Mengabaikan persediaan',
          'Menggunakan sistem manajemen logistik yang terorganisir untuk memastikan persediaan mencukupi',
          'Membuang persediaan yang tidak terpakai',
        ],
        correct: 2,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang perlu diperhatikan dalam merencanakan relokasi masyarakat yang terdampak secara jangka panjang?',
            type: 1,
          ),
        ],
        answers: [
          'Tidak perlu merencanakan relokasi',
          'Memperhitungkan kebutuhan masyarakat dan memastikan akses terhadap fasilitas penting di lokasi baru',
          'Mereka hanya perlu meninggalkan tempat mereka tanpa rencana',
          'Mengabaikan kebutuhan masyarakat',
        ],
        correct: 1,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang perlu dilakukan oleh pihak berwenang setelah erupsi untuk pemulihan dan pemantauan situasi?',
            type: 1,
          ),
        ],
        answers: [
          'Melakukan evaluasi kerusakan dan melanjutkan pemantauan serta bantuan pemulihan',
          'Tidak perlu melakukan pemantauan',
          'Mengabaikan pemulihan',
          'Membuka kembali semua jalanan tanpa pengecekan',
        ],
        correct: 0,
      ),
    ],
  ),

  // Quiz 10
  Quiz(
    title: 'Kesiapan dalam Menghadapi Pasca Erupsi Gunung Merapi',
    questions: [
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang harus dilakukan oleh masyarakat saat kembali ke rumah setelah erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Membersihkan rumah dan periksa kondisi bangunan sebelum tinggal kembali',
          'Membuka pintu dan jendela untuk memeriksa kabut abu vulkanik',
          'Melanjutkan aktivitas seperti biasa tanpa memeriksa kondisi rumah',
          'Tidak perlu melakukan apa-apa',
        ],
        correct: 0,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Bagaimana cara mengenali gejala awal bahaya pasca erupsi, seperti aliran lahar dingin?',
            type: 1,
          ),
        ],
        answers: [
          'Tidak perlu mengenali gejala bahaya pasca erupsi',
          'Mengandalkan intuisi',
          'Mengikuti informasi dari pihak berwenang dan gejala seperti getaran tanah atau suara gemuruh',
          'Mengabaikan tanda-tanda bahaya',
        ],
        correct: 2,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang perlu diperhatikan saat membersihkan rumah dari abu vulkanik pasca erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Tidak perlu membersihkan rumah',
          'Menggunakan air untuk membersihkan abu vulkanik',
          'Menghirup abu vulkanik untuk menguji kekuatannya',
          'Menggunakan masker dan peralatan pelindung diri, serta tidak menghirup abu vulkanik',
        ],
        correct: 3,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Bagaimana mengelola sisa material vulkanik, seperti puing atau abu, yang terakumulasi selama erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Tidak perlu mengelola sisa material vulkanik',
          'Membuangnya di sembarang tempat',
          'Mengikuti petunjuk pihak berwenang tentang pembuangan yang aman',
          'Meninggalkannya di lokasi erupsi',
        ],
        correct: 2,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang harus dilakukan jika terjadi banjir lahar pasca erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Berenang di dalam banjir lahar',
          'Menghindari daerah yang berisiko dan mengikuti instruksi evakuasi darurat',
          'Menggunakan perahu karet untuk menyeberang',
          'Mencoba menghadang banjir lahar dengan tubuh sendiri',
        ],
        correct: 1,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Bagaimana cara melindungi lahan pertanian dari bahaya pasca erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Tidak perlu melindungi lahan pertanian',
          'Menggunakan metode seperti pembuatan teras dan pemeliharaan tanah yang baik',
          'Mengandalkan keberuntungan',
          'Mengabaikan lahan pertanian',
        ],
        correct: 1,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang perlu dilakukan untuk memulihkan mata pencaharian masyarakat pasca erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Tidak perlu memulihkan mata pencaharian',
          'Mengandalkan bantuan pemerintah saja',
          'Mengembangkan program pelatihan dan membantu masyarakat dalam mendapatkan mata pencaharian yang baru',
          'Menyuruh masyarakat untuk tidak bekerja',
        ],
        correct: 2,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Bagaimana mengidentifikasi sumber air yang aman untuk digunakan pasca erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Mengikuti petunjuk dari pihak berwenang dan menggunakan air yang telah disediakan atau diproses',
          'Tidak perlu mencari sumber air',
          'Menggunakan air dari sungai atau sungai kecil',
          'Mengandalkan indera penciuman',
        ],
        correct: 0,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang harus diperhatikan dalam merencanakan pembangunan kembali infrastruktur pasca erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Tidak perlu merencanakan pembangunan kembali infrastruktur',
          'Mengabaikan perencanaan dan membangun tanpa pertimbangan',
          'Meniru pembangunan yang ada tanpa perubahan',
          'Memperhitungkan mitigasi bencana dan pembangunan yang tahan bencana',
        ],
        correct: 3,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang perlu dilakukan oleh masyarakat dan pihak berwenang untuk memantau kondisi Gunung Merapi setelah erupsi?',
            type: 1,
          ),
        ],
        answers: [
          'Tidak perlu memantau kondisi Gunung Merapi',
          'Menggunakan teknologi pemantauan seperti seismograf dan mematuhi peringatan dari pihak berwenang',
          'Mengandalkan berita televisi saja',
          'Mengabaikan kondisi Gunung Merapi',
        ],
        correct: 1,
      ),
    ],
  ),

  // Quiz 11
  Quiz(
    title: 'Pengetahuan Umum tentang Gunung Merapi',
    questions: [
      Question(
        contents: [
          QuestionContent(
            content: 'Di mana letak Gunung Merapi?',
            type: 1,
          ),
          QuestionContent(
            content: 'quiz5.jpg',
            type: 2,
          ),
        ],
        answers: [
          'Jawa Barat',
          'Jawa Tengah dan DIY',
          'Jawa Timur',
          'Bali',
        ],
        correct: 1,
      ),
      Question(
        contents: [
          QuestionContent(
            content: 'Apa jenis gunung Merapi?',
            type: 1,
          ),
        ],
        answers: [
          'Gunung berapi perisai',
          'Gunung berapi stratovulkan',
          'Gunung berapi tipe kerucut',
          'Gunung berapi kaldera',
        ],
        correct: 2,
      ),
      Question(
        contents: [
          QuestionContent(
            content: 'Seberapa sering terjadi erupsi Gunung Merapi?',
            type: 1,
          ),
        ],
        answers: [
          'Setiap 100 tahun sekali',
          'Setiap 10 tahun sekali',
          'Setiap beberapa tahun sekali',
          'Tidak pernah erupsi',
        ],
        correct: 2,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa dampak erupsi Gunung Merapi terhadap lingkungan sekitarnya?',
            type: 1,
          ),
        ],
        answers: [
          'Tidak ada dampak',
          'Merusak ekosistem dan lahan pertanian',
          'Meningkatkan keanekaragaman hayati',
          'Menyehatkan tanah pertanian',
        ],
        correct: 1,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang dimaksud dengan "dom" dalam konteks erupsi Gunung Merapi?',
            type: 1,
          ),
        ],
        answers: [
          'Kawasan berbahaya yang terkena dampak langsung erupsi',
          'Tipe kerucut gunung berapi',
          'Nama ilmiah Gunung Merapi',
          'Tipe lahar dingin',
        ],
        correct: 0,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Berapa ketinggian puncak Gunung Merapi di atas permukaan laut?',
            type: 1,
          ),
        ],
        answers: [
          'Kurang dari 1.000 meter',
          'Antara 1.000 hingga 2.000 meter',
          'Lebih dari 3.000 meter',
          'Antara 2.000 hingga 3.000 meter',
        ],
        correct: 3,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa peran PVMBG (Pusat Vulkanologi dan Mitigasi Bencana Geologi) dalam pemantauan Gunung Merapi?',
            type: 1,
          ),
        ],
        answers: [
          'Membangun fasilitas pariwisata di sekitar Gunung Merapi',
          'Melakukan penelitian geologi',
          'Mengawasi aktivitas vulkanik dan memberikan peringatan dini',
          'Membantu dalam proses erupsi',
        ],
        correct: 2,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang harus dilakukan masyarakat ketika terjadi peringatan erupsi Gunung Merapi?',
            type: 1,
          ),
        ],
        answers: [
          'Menonton dan mengambil foto',
          'Mengabaikan peringatan tersebut',
          'Melanjutkan aktivitas seperti biasa',
          'Mengikuti petunjuk evakuasi dan peringatan dari pihak berwenang',
        ],
        correct: 3,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang harus ada dalam persiapan darurat saat tinggal di daerah yang dekat dengan Gunung Merapi?',
            type: 1,
          ),
        ],
        answers: [
          'Tidak perlu persiapan',
          'Mengumpulkan bahan bakar tambahan',
          'Mempersiapkan tas evakuasi dan persediaan darurat',
          'Mengandalkan bantuan pemerintah',
        ],
        correct: 2,
      ),
      Question(
        contents: [
          QuestionContent(
            content:
                'Apa yang bisa dilakukan untuk membantu masyarakat yang terdampak erupsi Gunung Merapi?',
            type: 1,
          ),
        ],
        answers: [
          'Menghindari mereka',
          'Memberikan bantuan materi seperti makanan dan pakaian',
          'Mengabaikan mereka',
          'Menyalahkan mereka atas situasi mereka',
        ],
        correct: 1,
      ),
    ],
  ),
];
