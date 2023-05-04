class UserVehicleModel {
  String vehicleNumber;
  String ownerUID;
  String ownerName;
  String userUID;
  String userName;
  DateTime validity;

  UserVehicleModel(
      {required this.vehicleNumber,
      required this.ownerUID,
      required this.ownerName,
      required this.userUID,
      required this.userName,
      required this.validity});

  static UserVehicleModel fromMapToObj(Map<String, dynamic> data) {
    UserVehicleModel obj = UserVehicleModel(
        vehicleNumber: data["vehicle_number"],
        ownerUID: data["owner_uid"],
        ownerName: data["owner_name"],
        userUID: data["user_uid"],
        userName: data["user_name"],
        validity: data["validity"]);
    return obj;
  }

}
