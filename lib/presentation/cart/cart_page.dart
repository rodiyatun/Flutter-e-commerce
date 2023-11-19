// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:e_commerce/data/moldels/requests/order_request_model.dart';
import 'package:e_commerce/presentation/cart/bloc/cart/cart_bloc.dart';
import 'package:e_commerce/presentation/cart/bloc/order/order_bloc.dart';
import 'package:e_commerce/presentation/payment/payment_page.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/common/components/button.dart';
import 'package:e_commerce/common/components/row_text.dart';
import 'package:e_commerce/common/components/space_height.dart';
import 'package:e_commerce/common/constant/colors.dart';
import 'package:e_commerce/common/extensions/int_ext.dart';
import 'package:e_commerce/presentation/cart/widgets/cart_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  
  @override
  void initState() {
    super.initState();
  }
List<Item> items=[];
 int localTotalPrice=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
      ),
      body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return state.maybeWhen(orElse: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }, 
                  loaded: (carts) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const SpaceHeight(16.0),
                      itemCount: carts.length,
                      itemBuilder: (context, index) {
                        return CartItemWidget(
                          data: carts[index],
                        );
                      },
                    );
                  });
                },
              ),
              const SpaceHeight(70),
              
              
           
              // show alamat pengiriman
              // if (carts.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(color: ColorName.border),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alamat Pengiriman',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SpaceHeight(16.0),
                    Text(
                      'Nama Lengkap',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorName.grey,
                      ),
                    ),
                    SpaceHeight(8.0),
                    Text(
                      'Alamat Lengkap',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorName.grey,
                      ),
                    ),
                    SpaceHeight(8.0),
                    Text(
                      'Kota, Provinsi, Kode Pos',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorName.grey,
                      ),
                    ),
                    SpaceHeight(8.0),
                    Text(
                      'No Handphone',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorName.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SpaceHeight(16.0),
              //container for dropdown courier
              // // if (carts.isNotEmpty)
               Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(color: ColorName.border),
                ),
                child: Column(
                  children: [
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return RowText(
                              label: 'Total Harga',
                              value: 0.currencyFormatRp,
                            );
                          },
                          loaded: (carts) {
                            int totalPrice = 0;
                            for (var element in carts) {
                              totalPrice += 
                              int.parse(element.product.attributes!.price!) * element.quantity;
                            }
                           localTotalPrice=totalPrice;
                            items=carts
                            .map((e)=>Item(
                                 id: e.product.id!, 
                                productName:"Nama Produk", 
                                price: 0, 
                                qty: e.quantity,
                                ),
                                ) 
                             
                                .toList();
                                
                            return RowText(
                              label: 'Total Harga',
                              value: totalPrice.currencyFormatRp,
                            );
                          },
                        );
                       
                      },
                    ),

                    
                    const SpaceHeight(12.0),
                    const RowText(
                      label: 'Biaya Pengiriman',
                      value: 'Free ongkir', //150000.currencyFormatRp,
                    ),
                    const SpaceHeight(40.0),
                    const Divider(color: ColorName.border),
                    const SpaceHeight(12.0),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return RowText(
                              label: 'Total Harga',
                              value: 0.currencyFormatRp,
                            );
                          },
                          loaded: (carts) {
                            int totalPrice = 0;
                            for (var element in carts) {
                              totalPrice += int.parse(
                                  element.product.attributes!.price!) *
                                  element.quantity;

                            }
                             localTotalPrice = totalPrice;
                              items = carts
                            .map((e) => Item(
                                id: e.product.id!, 
                                productName:"Nama Produk", 
                                price: 0, 
                                qty: e.quantity,
                                ),
                                )
                            .toList();
                            
                            return RowText(
                              label: 'Total Harga',
                              value: totalPrice.currencyFormatRp,
                              valueColor: ColorName.primary,
                              fontWeight: FontWeight.w700,
                            );
                          },
                        );
                      },
                    ),
                    const SpaceHeight(16.0),
                    BlocConsumer<OrderBloc, OrderState>(
                      listener: (context, state) {
                      state.maybeWhen(
                        orElse: (){},
                        success: (response){
                            context.read<CartBloc>().add(const CartEvent.started());
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder:(context){
                            return  PaymentPage(
                              invoiceUrl:response.invoiceUrl,
                              orderId:response.externalId ,
                            );
                          } ),
                          );
                        }
                      );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse:(){
                            return Button.filled(
                          onPressed: () {
                            context.read<OrderBloc>().add(
                              OrderEvent.order(
                                OrderRequestModel(
                                data: Data(
                                items: items,
                                totalPrice: localTotalPrice, 
                                deliveryAddress: 'Majenang, Cilacap', 
                                courierName:'JNE', 
                                courierPrice: 0, 
                                status: 'waiting-payment',
                                ),
                                ),
                                ),
                                );
                          },
                          label: 'Bayar Sekarang',
                        );
                          },
                          loading: (){
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          );
                        
                      },
                    ),
                  ],
                ),
              ),
                  // child: CustomDropdown(
                  //   value: 'JNE',
                  //   items: const ['JNE', 'J&T'],
                  //   label: 'Kurir',
                  //   onChanged: (value) {},
                  // )),
              // if (carts.isNotEmpty)
             
            ],
          ),
       
      );
    
  }
}
