import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/dataSources/raja_ongkir_remote_datasorce.dart';
import 'package:e_commerce/data/moldels/responses/way_bill_success_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/moldels/responses/way_bill_failed_response_model.dart';

part 'cek_resi_event.dart';
part 'cek_resi_state.dart';
part 'cek_resi_bloc.freezed.dart';

class CekResiBloc extends Bloc<CekResiEvent, CekResiState> {
  CekResiBloc() : super(const _Initial()) {
    on<_GetCekResi>((event, emit) async{
     emit(const _Loading());
     final response =await RajaOngkirRemoteDatasource()
     .getWayBill(event.resi, event.courier);
     response.fold(
      (l) => emit(_Error(l)), 
      (r) => emit (_Loaded(r)),
      );

    });
  }
}
