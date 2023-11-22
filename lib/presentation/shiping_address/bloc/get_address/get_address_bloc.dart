import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/dataSources/order_remote_datasource.dart';
import 'package:e_commerce/data/moldels/responses/get_address_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_address_event.dart';
part 'get_address_state.dart';
part 'get_address_bloc.freezed.dart';

class GetAddressBloc extends Bloc<GetAddressEvent, GetAddressState> {
  GetAddressBloc() : super(const _Initial()) {
    on<_GetAddress>((event, emit) async {
      emit(const _Loading());
      final response = await OrderRemoteDatasource().getAddressByUserId();

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}