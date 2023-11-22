import 'package:e_commerce/data/dataSources/auth_local_datasource.dart';
import 'package:e_commerce/presentation/auth/bloc/login/login_bloc.dart';
import 'package:e_commerce/presentation/auth/bloc/register/register_bloc.dart';
import 'package:e_commerce/presentation/auth/login_page.dart';
import 'package:e_commerce/presentation/cart/bloc/cart/cart_bloc.dart';
import 'package:e_commerce/presentation/cart/bloc/order/order_bloc.dart';
import 'package:e_commerce/presentation/home/bloc/products/products_bloc.dart';
import 'package:e_commerce/presentation/home/widget/dashboard_page.dart';
import 'package:e_commerce/presentation/payment/order_detail/order_detail_bloc.dart';

import 'package:e_commerce/presentation/shiping_address/bloc/city/city_bloc.dart';

import 'package:e_commerce/presentation/shiping_address/bloc/subdistrict/subdistrict_bloc.dart';




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/cart/bloc/get_cost/get_cost_bloc.dart';
import 'presentation/shiping_address/bloc/add_address/add_address_bloc.dart';
import 'presentation/shiping_address/bloc/get_address/get_address_bloc.dart';
import 'presentation/shiping_address/bloc/province/province_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => ProductsBloc()..add(const ProductsEvent.getAll()),
        ),
         BlocProvider(
          create: (context) => CartBloc(),
        ),
         BlocProvider(
          create: (context) => OrderBloc(),
        ),
        BlocProvider(
          create: (context) => OrderDetailBloc(),
        ),
         BlocProvider(
          create: (context) => ProvinceBloc(),
        ),
        BlocProvider(
          create: (context) => CityBloc(),
        ),
         BlocProvider(
          create: (context) => SubdistrictBloc(),
        ),
         BlocProvider(
          create: (context) => AddAddressBloc(),
        ),
          BlocProvider(
          create: (context) => GetAddressBloc(),
        ),
         BlocProvider(
          create: (context) => GetCostBloc(),
        ),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder<bool>(
          future: AuthLocalDatasource().isLogin(),
          builder: (context, snapshot){
            if (snapshot.data!= null && snapshot.data!){
              return const DashboardPage();
            } else{
              return const LoginPage();
            }
          }
        ),
      ),
    );
  }
}
