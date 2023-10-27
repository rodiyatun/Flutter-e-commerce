// {"name":"Huda",
// "password":"Huda123",
// "email":"Huda39@gmail.com",
// "username":"Huda"}
import 'dart:convert';

class RegisterRequestModel{
  final String name;
  final String password;
  final String email;
  final String username;

  RegisterRequestModel({
    required this.name,
    required this.password,
    required this.email,
    required this.username});
    Map<String, dynamic> toMap(){
      return{
        'name':name,
        'password':password,
        'email':email,
        'username':username,
      };
    }
    String toJson() => json.encode(toMap());
}