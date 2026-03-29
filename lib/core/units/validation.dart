import 'package:hungry_resturant/core/network/api_error.dart';

class AuthValidator {

  static void validateLogin(String email, String password) {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw ApiError(message: "Please fill all fields");
    }

    if (!email.contains("@")) {
      throw ApiError(message: "Enter a valid email");
    }

    if (password.length < 6) {
      throw ApiError(message: "Password must be at least 6 characters");
    }
  }

  static void validateSignup(
    String name,
    String email,
    String password,
  ) {
    if (name.trim().isEmpty ||
        email.trim().isEmpty ||
        password.trim().isEmpty) {
      throw ApiError(message:
       "Please fill all fields");
    }

    if (name.length < 2) {
      throw ApiError(message: "Name is too short");
    }

    if (!email.contains("@")) {
      throw ApiError(message: "Enter a valid email");
    }

    if (password.length < 6) {
      throw ApiError(message: "Password must be at least 6 characters");
    }
  }
}
