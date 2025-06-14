import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final recentSearches = ["Product Manager", "UX Designer", "Product Designer"];

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Top Bar
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Search',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0, // balance center
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              // Search Field
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search a job or position",
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.tune),
                  )
                ],
              ),

              // Recent Searches
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recent Searches",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ...recentSearches.map((item) => ListTile(
                    leading: Icon(Icons.history),
                    title: Text(item),
                    trailing: Icon(Icons.close),
                    contentPadding: EdgeInsets.zero,
                  )),

              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recently Viewed",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              // Recently Viewed Item
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: Icon(Icons.music_note, color: Colors.white),
                  ),
                  title: Text("Product Manager"),
                  subtitle: Text("Beats\nFlorida, US"),
                  trailing: Text("\$84,000/y"),
                  isThreeLine: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
