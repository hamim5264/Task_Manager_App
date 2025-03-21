import 'dart:convert';

import 'package:get/get.dart';
import 'package:task_manager_app/data/models/network_response.dart';
import 'package:task_manager_app/data/services/network_caller.dart';
import 'package:task_manager_app/data/utilities/urls.dart';

class EmailVerificationController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> sendPinToEmail(String email) async {
    _isLoading = true;
    update();

    final String responseUrl = Urls.recoveryEmailUrl(email);
    final NetworkResponse response =
        await NetworkCaller().getRequest(responseUrl);

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
