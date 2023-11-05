import 'package:e_commerce/common/components/space_height.dart';
import 'package:e_commerce/common/constant/colors.dart';
import 'package:e_commerce/common/extensions/int_ext.dart';
import 'package:flutter/material.dart';
import '../../../common/constant/variables.dart';
import '../../../data/moldels/responses/products_response_model.dart';
import '../../../common/constant/images.dart' as assets;



class ProductCard extends StatelessWidget {
  final Product data;
  const ProductCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const ProductDetailPage()),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
          boxShadow: [
            BoxShadow(
              color: ColorName.black.withOpacity(0.05),
              blurRadius: 7.0,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (data.attributes!.images!.data!.isEmpty) ?
            Image.asset(assets.Images.product1,width: 170.0,
              height: 112.0,fit: BoxFit.cover):
            Image.network(
             Variables.baseUrl + data.attributes!.images!.data!.first.attributes!.url!,
              width: 170.0,
              height: 112.0,
              fit: BoxFit.cover,
              // errorBuilder: (context, error, stackTrace) {
              // //   return const SizedBox(
              // //      width: 170.0,
              // // height: 112.0,
              // // child: Placeholder(),
              // //   );
              // // },
            ),
            const SpaceHeight(14.0),
            Flexible(
              child: Text(
                data.attributes!.name!,
                // data.attributes!.images!.data.toString(),
                
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SpaceHeight(4.0),
            Text(
              int.parse(data.attributes!.price!).currencyFormatRp,
             
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
