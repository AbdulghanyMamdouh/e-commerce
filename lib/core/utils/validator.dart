class Validator {
  static bool isName(String? value) {
    RegExp regex = RegExp(r'^[A-Za-z]+$');
    if (value == null) {
      return false;
    } else {
      return regex.hasMatch(value);
    }
  }

  static bool isPassowrd(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value == null) {
      return false;
    } else {
      return regex.hasMatch(value);
    }
  }

  static bool isEmail(String? value) {
    RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null) {
      return false;
    } else {
      return regex.hasMatch(value);
    }
  }

  static bool isPhoneEg(String? value) {
    RegExp regex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');
    if (value == null) {
      return false;
    } else {
      return regex.hasMatch(value);
    }
  }
}
