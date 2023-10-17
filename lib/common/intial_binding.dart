import 'package:get/get.dart';
import 'package:noduster/controller/dependency/shared_pref_controller/shared_pref_ctrl.dart';
import 'package:noduster/controller/logincontroller.dart';

class IntialBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(SharedPref())
      ..put(
        LoginController(),
      );
  }
}
