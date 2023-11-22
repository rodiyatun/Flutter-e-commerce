
import 'package:e_commerce/common/components/space_width.dart';
import 'package:e_commerce/common/constant/colors.dart';
import 'package:e_commerce/common/constant/variables.dart';
import 'package:e_commerce/data/moldels/responses/products_response_model.dart';
import 'package:e_commerce/presentation/cart/bloc/cart/cart_bloc.dart';
import 'package:e_commerce/presentation/cart/cart_page.dart';
import 'package:e_commerce/presentation/cart/widgets/cart_model.dart';
import 'package:e_commerce/presentation/home/widget/image_slider.dart';
import 'package:e_commerce/presentation/home/widget/product_model.dart';
import 'package:e_commerce/presentation/product_detail/widgets/product_info_widget.dart';
import 'package:e_commerce/presentation/product_detail/widgets/products_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/constant/images.dart'as localimages;
import '../../common/components/button.dart';
import '../../common/components/space_height.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key,
  required this.product,
  }) : super(key: key);
  final Product product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  EdgeInsets paddingHorizontal = const EdgeInsets.symmetric(horizontal: 20.0);
  final List<String> images = [
    localimages.Images.product3,
    localimages.Images.product3,
    localimages.Images.product3,
    localimages.Images.product3,
  ];
  @override
  Widget build(BuildContext context) {
    // print(widget.product);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),
      body: ListView(
        children: [
          ImageSlider(
            items: ['${Variables.baseUrl}${widget.product.attributes!.images!.data!.first.attributes!.url}'],
            isAssets: false,
            
            ),
          const SpaceHeight(16.0),
          ProductInfoWidget(
            padding: paddingHorizontal,
            product: ProductModel(
              images: images,
              name: widget.product.attributes!.name!,
              
              price: int.parse(widget.product.attributes!.price!),
            ),
            onWishlistTap: (isWishlist) {
              // TODO: on wishlist tap
            },
          ),
          const SpaceHeight(11.0),
          ProductDescriptionWidget(
            padding: paddingHorizontal,
            description: widget.product.attributes!.description!,
               
          ),
          const SpaceHeight(11.0),
          Padding(
            padding: paddingHorizontal,
            child: Divider(
              color: ColorName.grey.withOpacity(0.18),
            ),
          ),
          const SpaceHeight(11.0),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.withOpacity(0.18)),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Button.filled(
                onPressed: () {
                  context
                  .read<CartBloc>()
                  .add(CartEvent.add(CartModel(product: widget.product, quantity: 1)));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>   const CartPage()),
                  );
                },
                label: "Add to Cart",
              ),
            ),
            const SpaceWidth(15.0),
            Flexible(
              child: Button.outlined(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const PaymentPage()),
                  // );
                },
                label: "Buy Now",
                color: ColorName.light,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
