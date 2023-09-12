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
      title: 'A House Divided',
      author: 'Nicole Ciacchella',
      imagePath: 'assets/images/books/book1.png',
      pdfPath: 'assets/pdf/book1.pdf'),
  Book(
      title: 'A Princess of Mars',
      author: 'Edgar Rice Burroughs',
      imagePath: 'assets/images/books/book2.png',
      pdfPath: 'assets/pdf/book2.pdf'),
  Book(
      title: 'Around the World in Eighty Days',
      author: 'Jules Verne',
      imagePath: 'assets/images/books/book3.png',
      pdfPath: 'assets/pdf/book3.pdf'),
  Book(
      title: 'Dead & Buried (A Partners in Crime Supernatural Mystery)',
      author: 'T.K. Eldridge',
      imagePath: 'assets/images/books/book4.png',
      pdfPath: 'assets/pdf/book4.pdf'),
  Book(
      title: '20000 Lieues sous les mers',
      author: 'Jules Verne',
      imagePath: 'assets/images/books/book5.png',
      pdfPath: 'assets/pdf/book5.pdf'),
];
