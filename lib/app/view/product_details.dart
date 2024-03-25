import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:simple_flutter_website/app/models/product.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final Product product;

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 167, 156),
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image(
                image: NetworkImage(
                  product.imageLink,
                ),
                // height: 400,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Text(
                product.brand,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF4C3931),
                  fontSize: 25,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Name: ',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF4C3931),
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text: product.name,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF6D4C41),
                          fontSize: 20,
                        ),
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Type: ',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF4C3931),
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    product.productType,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF6D4C41),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Product Description: ',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF4C3931),
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Text(
                product.description,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF6D4C41),
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Price: ',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF4C3931),
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '\$${product.price}',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF6D4C41),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              product.productColors.isNotEmpty
                  ? Row(
                      children: [
                        Text(
                          'Available Colors: ',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF4C3931),
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    )
                  : const SizedBox(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: product.productColors
                      .map(
                        (color) => Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  // color: Colors.black,
                                  color: HexColor(
                                    color.hexValue,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              Text(
                                color.colourName ?? ' ',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF6D4C41),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              TextButton(
                onPressed: () async {
                  Uri url = Uri.parse(product.productLink);
                  _launchUrl(url);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF4C3931)),
                ),
                child: Text(
                  'Buy Link',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF9A7B6F),
                    fontSize: 20,
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
