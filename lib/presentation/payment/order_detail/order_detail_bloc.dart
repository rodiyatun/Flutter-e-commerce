import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/dataSources/order_remote_datasource.dart';
import 'package:e_commerce/data/moldels/responses/order_response_detail_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_detail_event.dart';
part 'order_detail_state.dart';
part 'order_detail_bloc.freezed.dart';

class OrderDetailBloc extends Bloc<OrderDetailEvent, OrderDetailState> {
  OrderDetailBloc() : super(const _Initial()) {
    on<_GetOrderDetail>((event, emit) async{
      emit(const _Loading(),);
      final response = await OrderRemoteDatasource().getOrderById(event.orderId);
      response.fold(
        (l) => emit(_Error(l)), 
        (r) => emit(_Success(r)),
        );
    });
  }
}
