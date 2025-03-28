import 'dart:convert';

import 'package:get/get.dart';
import 'package:task_manager_app/data/models/network_response.dart';
import 'package:task_manager_app/data/services/network_caller.dart';
import 'package:task_manager_app/data/utilities/urls.dart';

class SetPasswordController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> postNewPassword(
      String email, String otp, String password) async {
    _isLoading = true;
    update();

    Map<String, dynamic> requestBody = {
      "email": email,
      "OTP": otp,
      "password": password
    };
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.setPasswordUrl, requestBody);
    Map<String, dynamic> decodedResponse =
        jsonDecode(jsonEncode(response.body));

    _isLoading = false;
    update();

    if (response.isSuccess) {
      if (decodedResponse['status'] == 'success') {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
