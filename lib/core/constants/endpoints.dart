// ignore_for_file: prefer_interpolation_to_compose_strings

abstract class Endpoints {
  static const _auth = 'auth/';
  static const getEmailToken = _auth + 'email';
  static const verifyEmailToken = _auth + 'email/verify';
  static const register = _auth + 'register';
  static const login = _auth + 'login';
  static const logout = _auth + 'logout';
}
