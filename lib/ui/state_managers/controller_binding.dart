import 'package:get/get.dart';
import 'package:task_manager_app/ui/state_managers/create_task_controller.dart';
import 'package:task_manager_app/ui/state_managers/email_verification_controller.dart';
import 'package:task_manager_app/ui/state_managers/pin_verification_controller.dart';
import 'package:task_manager_app/ui/state_managers/profile_controller.dart';
import 'package:task_manager_app/ui/state_managers/set_password_controller.dart';
import 'package:task_manager_app/ui/state_managers/sign_up_controller.dart';
import 'package:task_manager_app/ui/state_managers/task_controller.dart';
import 'package:task_manager_app/ui/state_managers/task_summary_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignupController());
    Get.put(TaskSummaryController());
    Get.put(TaskController());
    Get.put(EmailVerificationController());
    Get.put(PinVerificationController());
    Get.put(SetPasswordController());
    Get.put(ProfileController());
    Get.put(CreateTaskController());
  }
}
