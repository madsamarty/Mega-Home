
import 'package:get/get.dart';
import 'package:mega_home_graduation_project/core/view_model/ProfileViewModel.dart';
import 'package:mega_home_graduation_project/core/view_model/Sensors/door_switch_view_model.dart';
import 'package:mega_home_graduation_project/core/view_model/Sensors/fire_sensor_view_model.dart';
import 'package:mega_home_graduation_project/core/view_model/Sensors/gas_sensor_view_model.dart';
import 'package:mega_home_graduation_project/core/view_model/Sensors/water_Sensor_view_model.dart';
import 'package:mega_home_graduation_project/core/view_model/auth_view_model.dart';
import 'package:mega_home_graduation_project/core/view_model/home_view_model.dart';
import 'package:mega_home_graduation_project/core/view_model/messages_view_model.dart';
import 'package:mega_home_graduation_project/helper/local_storage_data.dart';



class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => FireSensorViewModel(), fenix: true);
    Get.lazyPut(() => GasSensorViewModel(), fenix: true);
    Get.lazyPut(() => WaterSensorViewModel(), fenix: true);
    Get.lazyPut(() => DoorSwitchViewModel(), fenix: true);
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => MessagesViewModel());
    Get.lazyPut(() => LocalStorageData());
  }
}