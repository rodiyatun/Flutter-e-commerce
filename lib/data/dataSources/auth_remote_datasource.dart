import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/moldels/requests/login_request_model.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce/common/constant/variables.dart';
import 'package:e_commerce/data/moldels/requests/register_request_model.dart';
import 'package:e_commerce/data/moldels/responses/auth_response_model.dart';
class AuthRemoteDataSource {
   Future<Either<String, AuthResponseModel>> register(
    RegisterRequestModel data) async{
      final headers={'Content-Type':'application/json'};
      final response= await http.post(
        Uri.parse('${Variables.baseUrl}/api/auth/local/register'),
        body: data.toJson(),
        headers:headers,
        );
        if(response.statusCode == 200){
          return right(AuthResponseModel.fromJson(response.body));
        }
        else{
          return left('Server Error');
        }
    }
    Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel data)async{
        final headers={'Content-Type':'application/json'};
        final response = await http.post(
          Uri.parse('${Variables.baseUrl}/api/auth/local'),
          body: data.toJson(),
          headers: headers,
        );
        // print(response.body);
        if (response.statusCode == 200){
          return right((AuthResponseModel.fromJson(response.body)));
        }
        else{
          return left('Server Error');
        }
      }

 
}