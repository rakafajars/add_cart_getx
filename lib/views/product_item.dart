import 'package:belajar_getx_cart/viewmodel/add_to_cart_vm.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  final String image, itemName;

  const ProductItem({Key? key, required this.image, required this.itemName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(10),
      height: screenSize.height * 0.2,
      width: screenSize.width * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.blue[200]!.withOpacity(0.3),
            offset: Offset(0, 0),
            blurRadius: 3,
            spreadRadius: 3,
          )
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              height: screenSize.height * 0.13,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              imageUrl: image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(itemName),
          ),
          GetBuilder<AddToCartVM>(
            builder: (value) => InkWell(
              onTap: () {
                value.add(image, itemName);
                print(value);
              },
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Container(
                  height: screenSize.height * 0.03,
                  width: screenSize.width * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      "ADD",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
