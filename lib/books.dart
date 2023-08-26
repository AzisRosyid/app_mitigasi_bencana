import 'package:app_mitigasi_bencana/read_book.dart';
import 'package:flutter/material.dart';

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

class Education extends StatelessWidget {
  final List<Book> books = [
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
    // Add more books here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
      ),
      body: BookGrid(books),
    );
  }
}

class BookGrid extends StatelessWidget {
  final List<Book> books;

  BookGrid(this.books);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.7, // Adjust this value to change item aspect ratio
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(8.0), // Add a margin of 8
          child: BookItem(book: books[index]),
        );
      },
    );
  }
}

class BookItem extends StatelessWidget {
  final Book book;

  BookItem({required this.book});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReadBook(
                  pdfAssetPath: 'assets/pdf/book1.pdf', // Replace with your asset PDF path
                ),
              ),
            );
      },
      padding: EdgeInsets.zero, // Remove padding
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                book.imagePath,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: 1,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          book.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          book.author,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
