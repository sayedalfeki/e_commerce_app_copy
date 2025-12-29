abstract class AppEndPoint {
  static const String baseUrl = "https://flower.elevateegy.com/api/v1/";
  // Authentication Endpoints
  static const String changePassword = 'auth/changePassword';
  static const String login = "auth/signin";
  static const String signUp = 'auth/signup';
  static const String forgetPassword = 'auth/forgotPassword';
  static const String verifyOtp = 'auth/verifyResetCode';
  static const String resetPassword = 'auth/resetPassword';
}