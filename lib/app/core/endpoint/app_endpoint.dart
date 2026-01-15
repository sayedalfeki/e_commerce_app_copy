abstract class AppEndPoint {
  static const String baseUrl = "https://flower.elevateegy.com/api/v1";
  // Authentication Endpoints
  static const String changePassword = '/auth/changePassword';
  static const String login = "/auth/signin";
  static const String signUp = '/auth/signup';
  // Occasion Endpoints
  static const String occasions = '/occasions';
  static String occasionById(String id) => '/occasions/$id';
  // Product Endpoints
  static const String products = '/products';
  static String productsByOccasion(String occasionId) =>
      '/products?occasion=$occasionId';
}
