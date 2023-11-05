import 'package:e_commerce/common/components/search_input.dart';
import 'package:e_commerce/common/components/space_height.dart';
import 'package:e_commerce/common/components/space_width.dart';
import 'package:e_commerce/common/constant/colors.dart';
import 'package:e_commerce/common/constant/images.dart';
import 'package:e_commerce/presentation/home/bloc/products/products_bloc.dart';
import 'package:e_commerce/presentation/home/widget/category_button.dart';
import 'package:e_commerce/presentation/home/widget/image_slider.dart';
import 'package:e_commerce/presentation/home/widget/product_card.dart';
import 'package:e_commerce/presentation/home/widget/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;
  final List<ProductModel> products = [
    ProductModel(
      images: [Images.product1],
      name: 'Sepatu',
      price: 200000,
    ),
    ProductModel(
      images: [Images.product2],
      name: 'iMac',
      price: 26000000,
    ),
    ProductModel(
      images: [Images.product3],
      name: 'iWatch',
      price: 6000000,
    ),
    ProductModel(
      images: [Images.product4],
      name: 'Tas',
      price: 200000,
    ),
  ];

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      Images.recomendedProductBanner,
      Images.recomendedProductBanner,
      Images.recomendedProductBanner,
    ];

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SpaceHeight(20.0),
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alamat Pengiriman",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: ColorName.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Sleman, DI Yogyakarta",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorName.primary,
                        ),
                      ),
                      SpaceWidth(5.0),
                      Icon(
                        Icons.expand_more,
                        size: 18.0,
                        color: ColorName.primary,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SizedBox()),
                        );
                      },
                      icon: Image.asset(
                        Images.iconBuy,
                        height: 24.0,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SizedBox()),
                        );
                      },
                      icon: Image.asset(
                        Images.iconNotificationHome,
                        height: 24.0,
                      )),
                ],
              ),
            ],
          ),
          const SpaceHeight(16.0),
          SearchInput(
            controller: searchController,
            onChanged: (value) {},
          ),
          const SpaceHeight(16.0),
          ImageSlider(items: images),
          const SpaceHeight(12.0),
          const Text(
            "Kategori",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: ColorName.primary,
            ),
          ),
          const SpaceHeight(16.0),
          Row(
            children: [
              Flexible(
                child: CategoryButton(
                  imagePath: Images.fashion1,
                  label: 'Pakaian',
                  onPressed: () {},
                ),
              ),
              Flexible(
                child: CategoryButton(
                  imagePath: Images.iconbag,
                  label: 'Accesoris',
                  onPressed: () {},
                ),
              ),
              Flexible(
                child: CategoryButton(
                  imagePath: Images.electronic,
                  label: 'Electronic',
                  onPressed: () {},
                ),
              ),
              Flexible(
                child: CategoryButton(
                  imagePath: Images.more,
                  label: 'Pakaian',
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SpaceHeight(16.0),
          const Text(
            "Produk",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: ColorName.primary,
            ),
          ),
          const SpaceHeight(9.0),
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: (){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (model){
                      return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 55.0,
                  childAspectRatio: 3/4,
                ),
                itemCount: model.data!.length,
                itemBuilder: (context, index) => ProductCard(
                  data: model.data![index],
                ),
              );

                }
                );
          
            },
          ),
        ],
      ),
    );
  }
}
