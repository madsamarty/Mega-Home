import 'package:get/get.dart';
import 'package:mega_home/core/view_model/auth_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthViewModel());
  }
}
