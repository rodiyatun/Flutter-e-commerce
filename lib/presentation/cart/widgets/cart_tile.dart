
import 'package:e_commerce/common/components/space_width.dart';
import 'package:e_commerce/common/constant/colors.dart';
import 'package:e_commerce/common/constant/variables.dart';
import 'package:e_commerce/common/extensions/int_ext.dart';
import 'package:e_commerce/presentation/cart/bloc/cart/cart_bloc.dart';
import 'package:e_commerce/presentation/cart/widgets/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: library_prefixes
import '../../../common/constant/images.dart' as LocalImages;

import '../../../common/components/space_height.dart';


class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  final CartModel data;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(color: ColorName.border),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(
              '${Variables.baseUrl}${widget.data.product.attributes!.images!.data!.first.attributes!.url!}',
              width: 72.0,
              height: 72.0,
              fit: BoxFit.cover,
            ),
          ),
          const SpaceWidth(12.0),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Flexible(
                      child: Text(
                        widget.data.product.attributes!.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        if(widget.data.quantity>0){
                          context
                          .read<CartBloc>()
                          .add(CartEvent.remove(widget.data, true));
                        }
                      },
                      child:  ImageIcon(
                        AssetImage(LocalImages.Images.iconTrash),
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                     int.parse(widget.data.product.attributes!.price!).currencyFormatRp,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: ColorName.primary,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(1.0),
                      decoration: const BoxDecoration(
                        color: ColorName.border,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child:  Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (widget.data.quantity > 0) {
                                  context
                                  .read<CartBloc>()
                                  .add(CartEvent.remove(widget.data, false));
                                }
                              },
                              child: Container(
                                color: ColorName.white,
                                child: const Icon(Icons.remove),
                              ),
                            ),
                            SizedBox(
                              width: 40.0,
                              child: Center(
                                child: Text(widget.data.quantity.toString()),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context
                                .read<CartBloc>()
                                .add(CartEvent.add(widget.data));
                              },
                              child: Container(
                                color: ColorName.white,
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ),
                   
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
