abstract class Validator {
  static String? required(String? value) {
    return value != null && value.trim().isEmpty
        ? 'Value cannot be empty'
        : null;
  }

  static String? email(String? value) {
    return required(value) ??
        (value != null &&
                RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                    .hasMatch(value)
            ? null
            : 'Invalid email format');
  }

  static String? strongPassword(String? value) {
    return required(value) ??
        (value != null &&
                value.length >= 8 &&
                value.contains(RegExp(r'[a-zA-Z]')) &&
                value.contains(RegExp(r'[0-9]')) &&
                value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))
            ? null
            : 'Password should be at least 8 characters long and contain letters, numbers, and special characters');
  }

  static String? sameAs(String? textValue, String compareValue, String error) {
    return required(textValue) ??
        (textValue != null && textValue == compareValue ? null : error);
  }
}
