import 'package:get/get.dart';
import 'package:task_manager_app/data/models/log_in_model.dart';
import 'package:task_manager_app/data/models/network_response.dart';
import 'package:task_manager_app/data/services/network_caller.dart';
import 'package:task_manager_app/data/utilities/auth_utility.dart';
import 'package:task_manager_app/data/utilities/urls.dart';

class LoginController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> loginUser(String email, String password) async {
    _isLoading = true;
    update();

    Map<String, dynamic> requestBody = {"email": email, "password": password};
    final NetworkResponse response = await NetworkCaller()
        .postRequest(Urls.loginUrl, requestBody, onLoginScreen: true);

    _isLoading = false;
    update();

    if (response.isSuccess) {
      LoginModel loginModel = LoginModel.fromJson(response.body!);
      await AuthUtility.saveUserInfo(loginModel);

      return true;
    } else {
      return false;
    }
  }
}
