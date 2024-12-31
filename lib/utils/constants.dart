class AppConstants {
  // Animation durations
  static const animationDuration = Duration(milliseconds: 300);
  static const pageTransitionDuration = Duration(milliseconds: 500);
  
  // Validation patterns
  static const emailPattern = r'^[a-zA-Z0-9._%+-]+@(gmail|hotmail|yahoo)\.com$';
  static const namePattern = r'^[a-zA-Z ]+$';
  static const phonePattern = r'^\+?880[0-9]{10}$';
  
  // Routes
  static const homeRoute = '/home';
  static const signupRoute = '/signup';
  static const courseRoute = '/course';
  static const classRoute = '/class';
  static const presenceRoute = '/presence';
}