import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/dataSources/raja_ongkir_remote_datasorce.dart';
import 'package:e_commerce/data/moldels/responses/subdistric_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subdistrict_event.dart';
part 'subdistrict_state.dart';
part 'subdistrict_bloc.freezed.dart';

class SubdistrictBloc extends Bloc<SubdistrictEvent, SubdistrictState> {
  SubdistrictBloc() : super(const _Initial()) {
    on<_GetAllByCityId>((event, emit) async{
     emit (const _Loading());
     final response=await RajaOngkirRemoteDatasource().getSubDistrict(event.city);
     response.fold(
      (l) => emit(_Error(l)), 
      (r) => emit(_Loaded(r.rajaongkir.results)),
      );
    });
  }
}
