// user_services.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
import 'package:trajekita/requests/models/user_models.dart';


class UserService {
  final String apiUrl;

  UserService(this.apiUrl);

  // Services Inscription
  Future<User> registerUser(String firstName, String lastName, String email, String phoneNumber, String password, {String? profilePhoto}) async {
    final newUser = User(
      id: 0,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      profilePhoto: profilePhoto,
    );

    final response = await http.post(
      Uri.parse('$apiUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(newUser.toJson()),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      print('Erreur lors de l\'inscription: ${response.statusCode}');
      throw Exception('Echec lors de l\'inscription');
    }    
  }

  // Services Connexion
  Future<User> loginUser(String identifier, String password) async {
    try {

      Map<String, dynamic> data = {
          'email': identifier,
          'password': password,
        };

        print(data);
        print(apiUrl);

      final response = await http.post(
        Uri.parse('$apiUrl/login'),
        body: jsonEncode(data),
        headers:{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        
      );

      print("response.body");

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      // return User.fromJson({"message": "response.body"});
      } else {
        throw Exception('Échec de la connexion');
      }
    } catch (error) {
      throw Exception('Erreur lors de la connexion: $error');
    }
  }
}
