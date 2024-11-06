import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = 'Sa0UF4TpzEBgkvUQkNSa8KVehYsnoUbTh64WL2Csn2BZy52aUqWR0PKe';

  Future<List<String>> fetchImages() async {
    final url = Uri.parse('https://api.pexels.com/v1/curated?per_page=10&page=1');
    final response = await http.get(url, headers: {
      'Authorization': apiKey,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<String> imageUrls = [];
      for (var photo in data['photos']) {
        imageUrls.add(photo['src']['medium']);
      }
      return imageUrls;
    } else {
      throw Exception('Failed to load images');
    }
  }
}
