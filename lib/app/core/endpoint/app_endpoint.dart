abstract class AppEndPoint {
  static const String baseUrl = "https://flower.elevateegy.com/api/v1";
  // Authentication Endpoints
  static const String changePassword = '/auth/change-password';
  static const String login = "/auth/signin";
  static const String signUp = '/auth/signup';
  //tabs end points
  static const String home='/home';
  static const String forgetPassword='/auth/forgotPassword';
  static const String verifyOtp='/auth/verifyResetCode';
  static const String resetPassword='/auth/resetPassword';
  static const String products = "/products/{productId}";
}
