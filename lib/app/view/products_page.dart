import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/product_controller.dart';
import 'product_card.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 167, 156),
      appBar: AppBar(
        title: GetBuilder<ProductController>(
          init: ProductController(),
          builder: (controller) => Text(
            'Products from ${controller.currBrand}',
            style: GoogleFonts.poppins(),
          ),
        ),
      ),
      body: GetBuilder<ProductController>(
        builder: (controller) => Center(
          child: controller.productList.isEmpty
              ? controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Center(
                      child: Text(
                        'No products from the given brand',
                        style: GoogleFonts.poppins(),
                      ),
                    )
              : GridView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      child: ProductCard(
                        prodDetails: controller.productList[index],
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                  ),
                ),
        ),
      ),
    );
  }
}
