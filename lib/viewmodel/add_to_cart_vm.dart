import 'package:belajar_getx_cart/model/products.dart';
import 'package:get/get.dart';

class AddToCartVM extends GetxController {
  List<Products> lst = [];
  //

  add(String image, String name) {
    lst.add(Products(
      image: image,
      name: name,
    ));
    update();
  }

  delete(int index) {
    lst.removeAt(index);
    update();
  }
}
