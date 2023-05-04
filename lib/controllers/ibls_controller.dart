import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class iBLSController extends GetxController{
  final supabase = Supabase.instance.client;
  var userID = "".obs;
  var userName = "".obs;
  var userEmail = "".obs;
  var userAge = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    // Calling Function for fetching data
    // var imageCache = Hive.openBox("imageCache").then((value){
    //   _imageCache.clear();
    // });
    final currentUser = supabase.auth.currentUser;
    if (currentUser != null){
      getUserData(currentUser.id);
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
}