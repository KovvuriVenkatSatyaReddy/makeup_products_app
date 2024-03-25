import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../api/api_service.dart';
import '../models/product.dart';

class ProductController extends GetxController {
  var isLoading = true;
  List<Product> productList = [];
  String currBrand = "colourpop";

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    isLoading = true;
    productList = [];
    update();
    var products = await ApiService.fetchProducts(currBrand);

    products.forEach((element) async {
      var res = await http.get(Uri.parse(element.imageLink));
      if (res.statusCode == 200) {
        productList.add(element);
        update();
      }
    });

    isLoading = false;
    update();

    // for (var product in products) {
    //   var res = await http.get(Uri.parse(product.imageLink));
    //   if (res.statusCode == 200) {
    //     productList.add(product);
    //     isLoading = false;
    //     update();
    //   }
    // }
  }
}
