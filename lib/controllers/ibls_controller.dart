import 'package:get/get.dart';
import 'package:ibls/models/user_vehicle_model.dart';
import 'package:ibls/models/vehicle_user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class iBLSController extends GetxController{
  final supabase = Supabase.instance.client;
  var userID = "".obs;
  var userName = "".obs;
  var userEmail = "".obs;
  var userAge = 0.obs;
  var userVehicleList = <UserVehicleModel>[].obs;
  var vehicleUserList = {}.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    // Calling Function for fetching data
    final currentUser = supabase.auth.currentUser;
    if (currentUser != null){
      getUserData(currentUser.id);
      getUserVehicleData(currentUser.id);
    }
    super.onInit();
  }

  Future<void> getUserData(String uid) async {
    print(uid);
    var data = await supabase.from("UserData").select().eq("user_id", uid).then((value){
      print(value);
    userID.value = value[0]["user_id"];
    userName.value = value[0]["name"];
    userEmail.value = value[0]["email"];
    userAge.value = value[0]["age"];
    });
  }

  Future<void> getUserVehicleData(String uid) async {
    var data = await supabase.from("VehicleData").select().eq("user_uid", uid).then((value) async {
      // List<Map<String, dynamic>> temp = value;
      print(value);
      for(int i = 0; i < value.length; i++){
        UserVehicleModel t = UserVehicleModel.fromMapToObj(value[i]);
        userVehicleList.add(t);
      }
      for(int i = 0; i < userVehicleList.length; i++){
        var data1 = await supabase.from("VehicleData").select().eq("vehicle_number", userVehicleList[i].vehicleNumber);
        List<VehicleUserModel> tempList = [];
        for (int j = 0; j < data1.length; j++){
          VehicleUserModel t1 = VehicleUserModel.fromMapToObj(data1[j]);
          tempList.add(t1);
        }
        vehicleUserList[userVehicleList[i].vehicleNumber] = tempList;

      }
      print(vehicleUserList);
    });
  }
}