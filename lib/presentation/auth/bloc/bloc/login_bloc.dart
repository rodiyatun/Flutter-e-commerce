// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/dataSources/auth_remote_datasource.dart';
import 'package:e_commerce/data/moldels/requests/login_request_model.dart';
import 'package:e_commerce/data/moldels/responses/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<_Login>((event, emit) async{
      emit(const _Loading());
      final response= await AuthRemoteDataSource().login(event.data!);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
 
    });
  }
}
