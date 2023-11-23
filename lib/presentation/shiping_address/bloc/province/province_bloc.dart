import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/dataSources/raja_ongkir_remote_datasorce.dart';
import 'package:e_commerce/data/moldels/responses/province_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'province_event.dart';
part 'province_state.dart';
part 'province_bloc.freezed.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  ProvinceBloc() : super(const _Initial()) {
    on<ProvinceEvent>((event, emit) async{
      emit(const _Loading());
      final result =await RajaOngkirRemoteDatasource().getProvinces();
      result.fold(
        (l) => emit(_Error(l)), 
        (r) => emit (_Loaded(r.rajaongkir.results)),
        );
      
    });
  }
}
