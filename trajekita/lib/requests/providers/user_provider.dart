// user_providers.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajekita/requests/models/user_models.dart';
import 'package:trajekita/requests/services/auth_services.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:http/http.dart' as http;


class UserProvider {
  UserService userService = UserService("http:192.168.1.23:3000/api/users");

  // UserProvider(this.userService);

  // Providers Register
  Future<User> registerUser(
    String firstName, 
    String lastName, 
    String email, 
    String phoneNumber, 
    String password, 
    {
      String? profilePhoto
    }

  )
  async {
    return userService.registerUser(firstName, lastName, email, phoneNumber, password, profilePhoto: profilePhoto);
  }

  // Providers Login
   Future<User> loginUser(String identifier, String password) async {
    
    try {
      return userService.loginUser(identifier, password);
    } catch (error) {
      Get.snackbar(
        'Erreur de connexion',
        'Échec de la connexion: $error',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(30),
        backgroundColor: TColors.error,
        icon: const Icon(Icons.error, color: Colors.white),
        shouldIconPulse: false,
        duration: const Duration(seconds: 5),
        isDismissible: true,
        leftBarIndicatorColor: Colors.white,
        forwardAnimationCurve: Curves.easeOutBack,
        reverseAnimationCurve: Curves.easeIn,
      );
      throw Exception('Échec de la connexion: $error');
    }
  }

  // Provider Delete User

  Future<void> deleteUser(int userId) async {
    try {
      final response = await http.delete(
        Uri.parse('${userService.apiUrl}/delete/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        // Utilisateur supprimé avec succès
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String successMessage = responseData['success'];
        // Affichage d'un SnackBar de succès
        Get.snackbar(
          "Suppression réussie",
          // "L'utilisateur a été supprimé avec succès.",
          successMessage,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(30),
          backgroundColor: TColors.primary,
          icon: const Icon(Icons.check, color: Colors.white),
          shouldIconPulse: false,
          duration: const Duration(seconds: 3),
        );
      } else {
        // Gérez les erreurs de suppression
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String errorMessage = responseData['error'];
        // Affichage d'un SnackBar d'erreur
        Get.snackbar(
          "Erreur de suppression",
          errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(30),
          backgroundColor: Colors.red,
          icon: const Icon(Icons.error, color: Colors.white),
          shouldIconPulse: false,
          duration: const Duration(seconds: 5),
        );
      }
    } catch (e) {
      // Gérez les erreurs inattendues
      print('Erreur inattendue lors de la suppression de l\'utilisateur: $e');
    }
  }
}
