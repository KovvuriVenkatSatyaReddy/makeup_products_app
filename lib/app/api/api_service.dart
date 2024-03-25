import 'package:http/http.dart' as http;

import '../models/product.dart';

class ApiService {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts(String brand) async {
    try {
      var response = await client.get(
        Uri.parse(
            'https://makeup-api.herokuapp.com/api/v1/products.json?brand=$brand'),
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var res = productFromJson(jsonString);
        return res;
      } else {
        print('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Exception: $e');
      return [];
    }
  }
}
