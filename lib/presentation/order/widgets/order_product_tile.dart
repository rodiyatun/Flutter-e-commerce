import 'package:e_commerce/common/extensions/int_ext.dart';
import 'package:e_commerce/data/moldels/responses/buyer_order_response_model.dart';
import 'package:flutter/material.dart';

import '../../../common/components/space_height.dart';
import '../../../common/components/space_width.dart';
import '../../../common/constant/colors.dart';


class OrderProductTile extends StatelessWidget {
  final Item data;
  const OrderProductTile({super.key, required this.data});

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
          // ClipRRect(
          //   borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          //   child: Image.asset(
          //     data.imagePath,
          //     width: 72.0,
          //     height: 72.0,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          const SpaceWidth(12.0),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data.productName} x (${data.qty} item)',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SpaceHeight(20.0),
                Text(
                  '${data.price.currencyFormatRp} x ${data.qty} item = ${(data.price * data.qty).currencyFormatRp}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: ColorName.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}