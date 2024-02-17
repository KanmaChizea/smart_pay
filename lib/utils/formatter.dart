class Formatter {
  static hashEmail(String email, [int count = 0]) {
    // find the index of the "@" symbol
    final atIndex = email.indexOf('@') - count;

    // If "@" is not found or it's the first character, return the original string
    if (atIndex <= 0) {
      return email;
    }
    // Replace the characters before "@" with "#"
    final maskedText =
        email.substring(0, count) + '*' * atIndex + email.substring(atIndex);

    return maskedText;
  }
}
