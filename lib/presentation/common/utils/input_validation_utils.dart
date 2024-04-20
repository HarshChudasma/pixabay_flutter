import 'package:application/presentation/common/constants/string_constants.dart';

/// Input validation utils

class InputValidationUtil {
  static const _passwordMinLen8WithNumbers =
      r'^((?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+).{7,20})$';

  static const String _emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const _numberPattern = r'^[0-9]*$';

  static bool _isEmailValid(String email) {
    final regexEmail = RegExp(_emailPattern);
    return regexEmail.hasMatch(email);
  }

  static bool _isNumberValid(String number) {
    final regexPhone = RegExp(_numberPattern);
    return regexPhone.hasMatch(number);
  }

  static bool _isPasswordValid(String password, String pattern) {
    final regexPassword = RegExp(pattern);
    return regexPassword.hasMatch(password);
  }

  static String? validateEmail(
      String email, {
        String? errorMessage,
        String? fieldName,
      }) {
    if (email.isEmpty) {
      return StringConstants.errorThisFieldCantBeEmpty;
    } else if (_isEmailValid(email)) {
      return null;
    } else {
      return errorMessage ?? StringConstants.errorInvalidEmail;
    }
  }

  static String? validatePassword(String password,
      {String? errorMessage, String? fieldName}) {
    if (password.isEmpty) {
      return '${StringConstants.errorPleaseEnterYour} $fieldName';
    } else if (_isPasswordValid(password, _passwordMinLen8WithNumbers)) {
      return null;
    } else {
      return errorMessage ?? StringConstants.errorPleaseEnterYour;
    }
  }

  static String? validatePhone(String number,
      {String? errorMessage, String? fieldName}) {
    if (number.isEmpty) {
      return '${StringConstants.errorPleaseEnterYour} $fieldName';
    } else if (_isNumberValid(number) == true && number.length == 10) {
      return null;
    } else {
      return errorMessage ?? StringConstants.errorInvalidPhone;
    }
  }

  static String? validateEmptyFiled(
      String controller, {
        String? errorMessage,
        bool customErrorMessage = false,
        bool check45CharLength = false,
        bool check11CharLength = false,
        String? shouldStartsWith,
      }) {
    if (controller.isEmpty) {
      if (!customErrorMessage) {
        return '${StringConstants.errorPleaseEnterYour} $errorMessage';
      } else {
        return '$errorMessage ';
      }
    }
    /*if (shouldStartsWith != null) {
      if (!controller.startsWith(shouldStartsWith)) {
        return '${StringConstantss.phoneNumberShouldStartsWith}: \'$shouldStartsWith\'';
      }
    }*/
    if (controller.length > 45 && check45CharLength) {
      return StringConstants.errorPleaseEnterValueLessThanFortyChar;
    }
    if (controller.length != 11 && check11CharLength) {
      return StringConstants.errorPhoneNumMustContainElevenNumbers;
    }
    if (controller.isNotEmpty) {
      return null;
    } else {
      return errorMessage ?? StringConstants.errorPleaseEnterYour;
    }
  }

  static String? validateConfirmPassword(
      {String? password,
        String? confirmPass,
        String? errorMessage,
        String? confirmPasswordMessage}) {
    if (password!.isEmpty) {
      return '${StringConstants.errorPleaseEnterYour} $errorMessage';
    } else if (confirmPass != password) {
      return confirmPasswordMessage!;
    } else {
      return null;
    }
  }
}
