

import 'package:e_commerce/common/extensions/string_ext.dart';
import 'package:e_commerce/data/moldels/responses/products_response_model.dart';

class CartModel {
 final Product product;
 int quantity;

  CartModel({
    required this.product,
    this.quantity = 0,
  });

  String get priceFormat => product.attributes!.price!.currencyFormatRp;

 
}