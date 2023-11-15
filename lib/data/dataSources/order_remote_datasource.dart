import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/common/constant/variables.dart';
import 'package:e_commerce/data/dataSources/auth_remote_datasource.dart';
import 'package:e_commerce/data/moldels/requests/order_request_model.dart';
import 'package:e_commerce/data/moldels/responses/order_response_model.dart';
import 'package:http/http.dart' as http;
class OrderRemoteDatasource{
  Future<Either<String, OrderResponseModel>> order(OrderRequestModel request)async{
    final token= await AuthRemoteDataSource().getToken();
    final response = await http.post(Uri.parse('${Variables.baseUrl}/api/orders'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
    body: request.toJson(),
    );
    if (response.statusCode==200){
      return Right(OrderResponseModel.fromJson(jsonDecode(response.body)));
      }else{
      return left('Server Error');
    }
    
  }

}