
import 'package:dartz/dartz.dart';
import 'package:e_commerce/common/constant/variables.dart';
import 'package:e_commerce/data/dataSources/auth_local_datasource.dart';
import 'package:e_commerce/data/moldels/requests/order_request_model.dart';
import 'package:e_commerce/data/moldels/responses/order_response_detail_model.dart';
import 'package:e_commerce/data/moldels/responses/order_response_model.dart';

import 'package:http/http.dart' as http;

class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> order(
      OrderRequestModel request) async {
    final token = await AuthLocalDatasource().getToken();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/orders'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: request.toJson(),
    );

    if (response.statusCode == 200) {
      return right(OrderResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }
  Future<Either<String, OrderResponseDetailModel>>getOrderById(String id)async{
    final token = await AuthLocalDatasource().getToken();
    final response= await http.get(
      Uri.parse('${Variables.baseUrl}/api/orders/$id'),
       headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
     
    );
     if (response.statusCode == 200) {
      return right(OrderResponseDetailModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }
}
// import 'package:dartz/dartz.dart';
// import 'package:e_commerce/common/constant/variables.dart';
// import 'package:e_commerce/data/dataSources/auth_local_datasource.dart';
// import 'package:e_commerce/data/moldels/requests/order_request_model.dart';
// import 'package:e_commerce/data/moldels/responses/order_response_model.dart';
// import 'package:http/http.dart' as http;
// class OrderRemoteDatasource{
//   Future<Either<String, OrderResponseModel>>order(OrderRequestModel request)async{
      
//     final token= await AuthLocalDatasource().getToken();
//      Map<String, dynamic> body =  {"data":{"items":[{"id":1,"productName":"Nama Produk","price":0,"qty":2},{"id":2,"productName":"Nama Produk","price":0,"qty":1}],"totalPrice":80000,"deliveryAddress":"Majenang, Cilacap","courierName":"JNE","courierPrice":0,"status":"waiting-payment"}};
   
//     final response = await http.post(Uri.parse('${Variables.baseUrl}/api/orders'),
//     body: body,
//     headers: <String, String>{
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $token',

//     },
    
//     );
//     print(request.toJson());
//      print(response.body.runtimeType);
//    print('response: ${response.body}');
//     if (response.statusCode==200){
//       return Right(OrderResponseModel.fromJson(response.body));
           
//       }else{
//       return left('Server Error');
//     }
    
//   }

// }