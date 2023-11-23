import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/dataSources/raja_ongkir_remote_datasorce.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/moldels/responses/cost_response_model.dart';

part 'get_cost_event.dart';
part 'get_cost_state.dart';
part 'get_cost_bloc.freezed.dart';

class GetCostBloc extends Bloc<GetCostEvent, GetCostState> {
  GetCostBloc() : super(const _Initial()) {
    on<_GetCost>((event, emit) async{
    emit(const _Loading());
      final response = await RajaOngkirRemoteDatasource().getCost(
        event.origin,
        event.destination,
        event.courier,
      );
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
