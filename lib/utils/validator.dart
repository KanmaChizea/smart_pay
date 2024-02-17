/// Contains multiple validation functions for TextFormFields

abstract class Validator {
  /// Validates that field is required
  ///
  static String? required(String? value) {
    return value != null && value.trim().isEmpty
        ? 'Value cannot be empty'
        : null;
  }

  /// Validates email to be required and of valid format
  ///
  static String? email(String? value) {
    return required(value) ??
        (value != null &&
                RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                    .hasMatch(value)
            ? null
            : 'Invalid email format');
  }

  /// Validates password to be required and meet the following standard
  /// - Minimum of 8 characters
  /// - At least One letter
  /// - At least one digit
  /// - At least one special character
  ///
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

  /// Validates field is required and equal to another field
  /// Commonly used for confirm password
  /// [textValue]-the field value i.e the confirm password field
  /// [compareValue]- the value of the field you're comparing to eg password
  /// [error]- error message to be displayed when invalid
  ///
  static String? sameAs(String? textValue, String compareValue, String error) {
    return required(textValue) ??
        (textValue != null && textValue == compareValue ? null : error);
  }
}
