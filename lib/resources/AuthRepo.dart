// ignore: file_names
// ignore_for_file: file_names
import '../mocks/login.dart';
import '../utils/api.dart';
import '../utils/env.dart';
import 'dart:async';
import 'dart:core';

class AuthRepo {
  final Api _api = new Api(BASE_URL);

  //routes for login
  Future<Map<String, dynamic>> login({
    required String mobile_number,
    required String password,
  }) async {
    Map<String, dynamic> formdata = {
      "mobile_number": mobile_number,
      "password": password
    };
    try {
      // final Map<String, dynamic> response =
      //     await _api.post('/login.php', formdata);
      return login_mock;
    } catch (e) {
      return {"Status": -1, "Message": "Request failed... ${e}"};
    }
  }

//  routes for registering user
  Future<Map<String, dynamic>> register(
      {required String fullname,
      required String mobile_number,
      required String email,
      required String password,
      required String latitude,
      required String longitude}) async {
    Map<String, dynamic> formdata = {
      "fullname": fullname,
      "mobile_number": mobile_number,
      "email": email,
      "password": password,
      "latitude": latitude,
      "longitude": longitude,
    };
    try {
      // final Map<String, dynamic> response =
      //     await _api.post('/register.php', formdata);
      return register_mock;
    } catch (e) {
      return {
        "Status": -1,
        "Message": "Request failed... ${e}",
        "e": e,
      };
    }
  }

//  routes to verify otp
//  this when successful returns user details as it is for the login
  Future<Map<String, dynamic>> verifyOtp({
    required String mobile_number,
  }) async {
    Map<String, dynamic> formdata = {
      "mobile_number": mobile_number,
    };
    try {
      final Map<String, dynamic> response =
          await _api.post('/verify_client.php', formdata);
      return response;
    } catch (e) {
      return {
        "Status": -1,
        "Message": "Request failed... ${e}",
        "e": e,
      };
    }
  }

//  route to set password
  Future<Map<String, dynamic>> setPassword({
    required String password,
    required String password_confirmation,
  }) async {
    Map<String, dynamic> formdata = {
      "password": password,
      "password_confirmation": password_confirmation,
    };
    try {
      final Map<String, dynamic> response =
          await _api.post('/auth/password', formdata);
      if (response["status"] != null && response["status"] == true) {
        return {"status": 1};
      } else {
        return {"status": 0};
      }
    } catch (e) {
      return {
        "status": -1,
        "message": "Request failed... ${e}",
        "e": e,
      };
    }
  }

//  validatetoken
  Future<Map<String, dynamic>> checkTokenIfValid() async {
    try {
      final Map<String, dynamic> response = await _api.get('/user');
      if (response["status"] != null && response["status"] == true) {
        return {"status": 1, "data": response["data"]};
      } else {
        return {"status": 0};
      }
    } catch (e) {
      return {
        "status": -1,
        "message": "Request failed... ${e}",
        "e": e,
      };
    }
  }

//  route to resend token
  Future<Map<String, dynamic>> resendToken(String otptoken) async {
    try {
      final Map<String, dynamic> response =
          await _api.post('/resend_otp.php', {"otptoken": otptoken});
      return response;
    } catch (e) {
      return {
        "Status": -1,
        "Message": "Request failed... ${e}",
        "e": e,
      };
    }
  }

//  route to retrive payment history
  Future<Map<String, dynamic>> paymentHistory() async {
    try {
      final List response = await _api.get('/account/transactionHistory');
      return {"status": 1, "data": response};
    } catch (e) {
      return {"status": -1, "message": "Request failed... ${e}", "e": e};
    }
  }

// route to get account info
  Future<Map<String, dynamic>> getAccountInfo() async {
    try {
      final Map response = await _api.get('/account/info');
      if (response["status"] != null && response["status"] == true) {
        return {"status": 1, "data": response["data"]};
      }
      return {"status": 0, "message": "Invalid request"};
      // ignore: non_constant_identifier_names
    } catch (e) {
      return {
        "status": -1,
        "message": "Request failed... ${e}",
        "e": e,
      };
    }
  }

//  route for updating profile
  Future<Map<String, dynamic>> updateProfile(
      Map<String, dynamic> userdata) async {
    print(userdata);
    try {
      final Map response = await _api.put('/user', userdata);
      if (response["status"] != null && response["status"] == true) {
        return {
          "status": 1,
          "data": response["data"],
          "message": "Update successful"
        };
      }
      return {"status": 0, "message": "Invalid request"};
    } catch (e) {
      return {"status": -1, "message": "Request failed... ${e}", "e": e};
    }
  }
}
