import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/dataSources/raja_ongkir_remote_datasorce.dart';
import 'package:e_commerce/data/moldels/responses/city_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_event.dart';
part 'city_state.dart';
part 'city_bloc.freezed.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(const _Initial()) {
    on<_GetAllByProvinceId>((event, emit) async{
     emit (const _Loading());
     final response=await RajaOngkirRemoteDatasource().getCities(event.province);
     response.fold(
      (l) => emit(_Error(l)), 
      (r) => emit(_Loaded(r.rajaongkir.results)),
      );
    });
  }
}
