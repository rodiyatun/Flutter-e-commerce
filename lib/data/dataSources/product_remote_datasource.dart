import 'package:dartz/dartz.dart';
import 'package:e_commerce/common/constant/variables.dart';
import 'package:e_commerce/data/moldels/responses/products_response_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDataSource{
  Future<Either<String, ProductsResponseModel>>getAllProduct() async{
    
    final response =await http.get(Uri.parse('${Variables.baseUrl}/api/products?populate=*'));
    if (response.statusCode == 200){
     
      return Right(ProductsResponseModel.fromJson(response.body));
    } else{
      return const Left('Server Error');
    }
  }

}