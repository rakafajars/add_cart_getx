import 'package:belajar_getx_cart/model/products.dart';
import 'package:belajar_getx_cart/viewmodel/add_to_cart_vm.dart';
import 'package:belajar_getx_cart/views/cart.dart';
import 'package:belajar_getx_cart/views/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        actions: [
          InkWell(
            onTap: () {
              Get.to(
                CartScreen(),
              );
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 15, top: 8, bottom: 8),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.blue,
                      size: 25,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: GetBuilder<AddToCartVM>(
                      init: AddToCartVM(),
                      builder: (value) => CartCounter(
                        count: value.lst.length.toString(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.menu_rounded, color: Colors.blue, size: 25),
        ),
        title: Center(
          child: Text(
            "My Mart",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenSize.height * 0.24,
            color: Colors.red,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: prds.length,
              itemBuilder: (context, int index) {
                print(prds[index]["image"]);
                return ProductItem(
                  image: prds[index]["image"] ?? "-",
                  itemName: prds[index]["name"] ?? "-",
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CartCounter extends StatelessWidget {
  final String? count;

  const CartCounter({Key? key, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(color: Colors.red[800], shape: BoxShape.circle),
      child: Center(
        child: Text(
          count ?? "0",
          style: TextStyle(color: Colors.white, fontSize: 7),
        ),
      ),
    );
  }
}
