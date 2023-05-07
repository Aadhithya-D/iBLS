// List of users of that vehicle

class VehicleUserModel {
  String vehicleNumber;
  String ownerUID;
  String ownerName;
  String userUID;
  String userName;
  DateTime? validity;
  String rowID;

  VehicleUserModel(
      {required this.vehicleNumber,
        required this.ownerUID,
        required this.ownerName,
        required this.userUID,
        required this.userName,
        required this.validity,
        required this.rowID});

  static VehicleUserModel fromMapToObj(Map<String, dynamic> data) {
    VehicleUserModel obj = VehicleUserModel(
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
