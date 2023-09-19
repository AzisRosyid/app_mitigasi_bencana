class Book {
  final String title;
  final String author;
  final String imagePath;
  final String pdfPath;

  Book(
      {required this.title,
      required this.author,
      required this.imagePath,
      required this.pdfPath});
}


final List<Book> getBooks = [
  Book(
      title: 'Edukasi Umum Bencana Gunung Meletus',
      author: 'EDU MIT',
      imagePath: 'assets/images/books/book1.png',
      pdfPath: 'assets/pdf/book1.pdf'),
  Book(
      title: 'Sikap Dan Cara Pasca Menanggulangi Bencana Gunung Meletus Terjadi',
      author: 'EDU MIT',
      imagePath: 'assets/images/books/book2.png',
      pdfPath: 'assets/pdf/book2.pdf'),
  Book(
      title: 'Strategi Bijak Dalam Menghadapi Ancaman Letusan Gunung Dan Persiapan Yang Tepat',
      author: 'EDU MIT',
      imagePath: 'assets/images/books/book3.png',
      pdfPath: 'assets/pdf/book3.pdf'),
  Book(
      title: 'Cara Selamat Dari Gunung Merapi',
      author: 'EDU MIT',
      imagePath: 'assets/images/books/book4.png',
      pdfPath: 'assets/pdf/book4.pdf'),
];
