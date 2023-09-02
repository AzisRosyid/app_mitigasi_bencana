import 'package:flutter/material.dart';

class Lapor extends StatefulWidget {
  @override
  _LaporState createState() => _LaporState();
}

class _LaporState extends State<Lapor> {
  // Sample data for the list of items.
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    // Add more items as needed.
  ];

  // Track the selected item for showing the description.
  String selectedItem = "";

  // Method to show the item description in a pop-up dialog.
  void showItemDescription(String item) {
    setState(() {
      selectedItem = item;
    });

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Description for $item goes here.', // Replace with the actual description for the selected item.
            style: TextStyle(fontSize: 18.0),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lapor'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                    color:
                        Colors.white, // Background color for the rounded edge
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ]),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        width: double.infinity, // Full width for the item
                        decoration: BoxDecoration(
                          color: Colors
                              .white, // White background color for the item
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.5), // Shadow color
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // Shadow position
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              selectedItem = item;
                            });
                          },
                        ),
                      ),
                    ),
                    if (selectedItem == item)
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                        ),
                        child: Container(
                          width:
                              double.infinity, // Full width for the description
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              color: Colors.black, // Shadow color
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // Shadow position
                            ),
                          ]),
                          child: Column(
                            children: [
                              Container(
                                height: 8.0,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.5), // Shadow color
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3), // Shadow position
                                      ),
                                    ]),
                              ),
                              Container(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Description for $item goes here.', // Replace with the actual description for the selected item.
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
