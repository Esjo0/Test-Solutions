import 'package:flutter/material.dart';
import 'api_service.dart';

class ResponsiveLayout extends StatefulWidget {
  @override
  _ResponsiveLayoutState createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  late Future<List<String>> images;

  @override
  void initState() {
    super.initState();
    images = ApiService().fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(title: Text('Responsive UI Design')),
      body: FutureBuilder<List<String>>(
        future: images,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No images available.'));
          } else {
            List<String> imageUrls = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: isTablet
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Image.network(imageUrls[index], fit: BoxFit.cover),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.network(imageUrls[index], fit: BoxFit.cover),
                        );
                      },
                    ),
            );
          }
        },
      ),
    );
  }
}
