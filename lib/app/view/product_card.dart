import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_flutter_website/app/view/home_page.dart';
import 'package:simple_flutter_website/app/view/product_details.dart';

import '../models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.prodDetails});
  final Product prodDetails;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProductDetails(
            product: prodDetails,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 171, 139, 127),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Image(
              height: 200,
              width: 170,
              image: NetworkImage(prodDetails.imageLink),
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 200,
                  width: 170,
                  child: Icon(Icons.error_outline_rounded),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              prodDetails.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: const Color(0xFF6D4C41),
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              prodDetails.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 10),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '\$${prodDetails.price}',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 255, 246, 246),
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
