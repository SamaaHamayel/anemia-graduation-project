class EndPoint {
  static const String baseUrl = 'https://graduation-project-an7d.onrender.com/';

  static const String userLogin = 'auth/login';
  static const String userSignUp = 'auth/register';
  static const String forgetPassword = 'auth/forgetPassword';
  static const String resetPassword = 'auth/resetPassword';
  static const String confirmEmail = 'auth/confirmEmail';
  static const String anemiaModel = 'https://graduation-project-an7d.onrender.com/model';


  // static const String chefChangePassword = 'chef/change-password';
  // static const String chefDelete = 'chef/delete';
   static const String userGet = 'auth//';
   static const String sendCode = 'auth/resetPassword';
  // static const String changeForgottenPassword =
  //     'chef/change-forgotten-password';
  // static const String updateChef = 'chef/update';
  // static const String logout = 'chef/logout';
  // static const String addMeal = 'meal/add-to-menu';
  // static const String updateMeal = 'chef/update-meal/';
  // static const String deleteMeal = 'meal/delete-meal';
  // static const String getAllMeal = 'meal/get-meals';

  static String getUserDataEndPoint(id) {
    return '$userGet$id';
  }

  // static String getUpdateMealEndPoint(id) {
  //   return '$updateMeal$id';
  // }

  // static String getDeleteMealEndPoint(id) {
  //   return '$deleteMeal$id';
  //
  // }

//   static String getAllChefMeals(id) {
//     return 'chef/get-chef/$id/meals';
//   }


 }

class ApiKeys {
  static const String id = 'id';
  static const String email = 'email';
  static const String password = 'password';
  static const String oldPass = 'oldPass';
  static const String confirmPassword = 'confirmPassword';
  static const String newPass = 'newPass';
  static const String forgetCode = 'code';
  static const String message = 'message';
  static const String token = 'token';
  static const String userName = 'userName';
  //static const String category = 'category';
  static const String phone = 'phone';
  //static const String location = 'location';
  static const String profilePic = 'profilePic';

}
