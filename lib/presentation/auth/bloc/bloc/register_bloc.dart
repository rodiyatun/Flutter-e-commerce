// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/dataSources/auth_remote_datasource.dart';
import 'package:e_commerce/data/moldels/requests/register_request_model.dart';
import 'package:e_commerce/data/moldels/responses/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const _Initial()) {
    on<_Register>((event, emit) async{
      emit(const _Loading());
      final response = await AuthRemoteDataSource().register(event.data!);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
      
    });
  }
}
