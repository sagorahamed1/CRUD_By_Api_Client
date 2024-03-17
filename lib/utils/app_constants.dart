class AppConstants{

  static String bearerToken="BearerToken";
  static String userId="UserId";
  static String isLogged="IsLogged";
  static String isOnboard="IsOnboard";
  static String subscription="Subscription";
  static String signInType ="SignInType";




  static RegExp emailValidator = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static RegExp passwordValidator = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
  );

}