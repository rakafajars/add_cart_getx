import 'package:belajar_getx_cart/viewmodel/add_to_cart_vm.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GetBuilder<AddToCartVM>(
      // specify type as Controller
      init: AddToCartVM(), // intialize with the Controller
      builder: (value) => Scaffold(
        body: SafeArea(
          child: Container(
            height: screenSize.height,
            width: double.infinity,
            child: ListView.builder(
              itemCount: value.lst.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direction) {
                    value.delete(index);
                  },
                  child: CartItem(
                    image: value.lst[index].image,
                    itemName: value.lst[index].name,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({Key? key, this.image, this.itemName, this.del})
      : super(key: key);

  final String? image, itemName;
  final Function? del;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(10),
      height: screenSize.height * 0.15,
      width: screenSize.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.blue[200]!.withOpacity(0.3),
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 3)
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            height: screenSize.height * 0.13,
            width: screenSize.width * 0.3,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            imageUrl: image ?? 'https://picsum.photos/250?image=9',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            itemName ?? "Item",
            style: TextStyle(fontSize: 22),
          ),
        ),
      ]),
    );
  }
}
