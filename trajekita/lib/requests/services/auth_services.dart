// user_services.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
import 'package:trajekita/requests/models/user_models.dart';

class UserService {
  final String apiUrl;

  UserService(this.apiUrl);

  // Services Inscription
  Future<User> registerUser(String firstName, String lastName, String email,
      String phoneNumber, String password,
      {String? profilePhoto}) async {
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
  Future<Map<String, dynamic>> loginUser(
      String identifier, String password) async {
    try {
      Map<String, dynamic> data = {
        'identifier': identifier,
        'password': password,
      };

      final url = Uri.parse('http://192.168.1.23:4000/api/users/login');

      print(data);
      print(apiUrl);

      final response = await http.post(
        url,
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print(response.statusCode);
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } catch (error) {
      return {"status": false, "message": "Erreur lors de la requete"};
    }
  }
}
