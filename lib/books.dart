import 'package:app_mitigasi_bencana/helper.dart';
import 'package:app_mitigasi_bencana/read_book.dart';
import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(60), // Set the preferred height of the AppBar
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF930000),
                  Color(0xFFC30000)
                ], // Gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20), // Adjust the radius as needed
              ),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent, // Make AppBar transparent
              elevation: 0, // Remove the shadow
              leading: GestureDetector(
                onTap: () {
                  // Handle back button action here
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
                  child: Image.asset(
                    'assets/images/back.png', // Replace with your custom image asset path
                    width: 24, // Adjust the width as needed
                    height: 24, // Adjust the height as needed
                  ),
                ),
              ),
              title: Text(
                "Buku Edukasi",
                style: TextStyle(
                    color: Colors.white, // Set text color to white
                    fontSize: 20, // Adjust font size as needed
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true, // Center the title horizontally
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(right: 4, left: 4),
          child: BookGrid(getBooks),
        ));
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
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
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
              title: book.title,
              pdfPath: book.pdfPath,
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
