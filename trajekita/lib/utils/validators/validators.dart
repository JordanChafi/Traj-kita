class TValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "mail est obligatoire.";
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Adresse email invalide.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mot de Passe obligatoire.';
    }

    if (value.length < 6) {
      return 'Mot de Passe doit contenir au moins 6 caractères.';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Mot de passe doit contenir au moins une lettre majuscule.';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Mot de passe doit contenir au moins un chiffre';
    }

    if (!value.contains(RegExp(r'[!@#$%^&+(),.?":|<>\/]'))) {
      return 'Mot de passe doit contenir au moins un caractère spécial';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Numéro de Téléphone est obligatoire.';
    }

    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Format N°Tel invalide.';
    }

    return null;
  }
}
