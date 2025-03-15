import 'package:get/get.dart';
import 'package:task_manager_app/data/services/network_caller.dart';
import 'package:task_manager_app/data/utilities/urls.dart';

import '../../data/models/network_response.dart';

class SignupController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> userSignup(String email, String fName, String lName,
      String mobile, String password) async {
    _isLoading = true;
    update();

    Map<String, dynamic> requestBody = {
      "email": email,
      "firstName": fName,
      "lastName": lName,
      "mobile": mobile,
      "password": password,
      "photo": ""
    };
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.signupUrl, requestBody);

    _isLoading = false;
    update();

    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}
