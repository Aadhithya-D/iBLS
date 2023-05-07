// List of vehicles of the user

class UserVehicleModel {
  String vehicleNumber;
  String ownerUID;
  String ownerName;
  String userUID;
  String userName;
  DateTime? validity;
  String rowID;

  UserVehicleModel(
      {required this.vehicleNumber,
      required this.ownerUID,
      required this.ownerName,
      required this.userUID,
      required this.userName,
      required this.validity,
      required this.rowID});

  static UserVehicleModel fromMapToObj(Map<String, dynamic> data) {
    UserVehicleModel obj = UserVehicleModel(
        vehicleNumber: data["vehicle_number"],
        ownerUID: data["owner_uid"],
        ownerName: data["owner_name"],
        userUID: data["user_uid"],
        userName: data["user_name"],
        validity: data["validity"],
      rowID: data["row_id"]
    );
    return obj;
  }

}
