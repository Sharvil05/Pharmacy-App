// // Store data signup data in local storage that is in sharedf prefrence

// import 'package:shared_preferences/shared_preferences.dart';

// class ShaedPrefrenceHelper{
//   static String userIdKey = "USERIDKEY";
//   static String userNameKey = "USERNAMEKEY";
//   static String userEmailKey= "USEREMAILKEY";


//   Future<bool>saveUserId(String getUserId)async{
    
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.setString(userIdKey, getUserId);
//   }

//   Future<bool>saveUserName(String getUserName)async{
    
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.setString(userIdKey, getUserName);
//   }

//   Future<bool>saveUserEmail(String getUserEmail)async{
    
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.setString(userIdKey, getUserEmail);
//   }

//   // Now we have save all

//   // Then write the get Functions

//   Future<String?> getUserId()async{  //? Used Sometime it comes Null
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     return prefs.getString(userIdKey);  // here data can get 
//   }

  
//   Future<String?> getUserName()async{  //? Used Sometime it comes Null
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     return prefs.getString(userNameKey);  // here data can get 
//   }

  
//   Future<String?> getUserEmail()async{  //? Used Sometime it comes Null
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     return prefs.getString(userEmailKey);  // here data can get 
//   }



// }

import 'package:shared_preferences/shared_preferences.dart';

class ShaedPrefrenceHelper {

  static String userIdKey = "USERIDKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";

  // -------- SAVE METHODS --------

  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdKey, getUserId);
  }

  Future<bool> saveUserName(String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ✅ FIX: userNameKey
    return prefs.setString(userNameKey, getUserName);
  }

  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ✅ FIX: userEmailKey
    return prefs.setString(userEmailKey, getUserEmail);
  }

  // -------- GET METHODS --------

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }

  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }

  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }
}
