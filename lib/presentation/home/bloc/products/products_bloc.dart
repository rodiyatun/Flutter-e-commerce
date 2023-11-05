// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/dataSources/product_remote_datasource.dart';
import 'package:e_commerce/data/moldels/responses/products_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const _Initial()) {
    on<_GetAll>((event, emit) async{
      emit (const _Loading());
     final response= await ProductRemoteDataSource().getAllProduct();
     response.fold(
      (l) => emit(_Error(l)),
      (r) => emit(_Loaded(r)),
      );

    });
  }
}
