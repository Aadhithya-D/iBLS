import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ibls/components/fonts.dart';
import 'package:ibls/controllers/ibls_controller.dart';
import 'package:ibls/variables.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterNewVehicleScreen extends StatelessWidget {
  RegisterNewVehicleScreen({super.key});
  final vehicleNumberController = TextEditingController();
  final regExVhNum = RegExp(r'^[A-Z]{2}[ ][0-9]{1,2}[ ][A-Z]{1,2}[ ][0-9]{4}$');
  final supabase = Supabase.instance.client;
  final iBLSController iblsController = Get.put(iBLSController());
  @override
  Widget build(BuildContext context) {
    void wrongInfo(String error) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "iBLS",
                style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
              ),
              content: Text(
                error,
                style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
              titlePadding: const EdgeInsets.all(20),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary)))
              ],
            );
          });
    }

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      smallGap(),
                      Text(
                        "Register New Vehicle",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      largeGap(),
                      largeGap(),
                      Image.asset(
                        "lib/Images/resume.png",
                        height: 140,
                      ),
                      largeGap(),
                      largeGap(),
                      TextField(
                        cursorColor: Colors.white,
                        controller: vehicleNumberController,
                        textCapitalization: TextCapitalization.characters,
                        style: const TextStyle(
                          color: white,
                          fontSize: 20,
                        ),
                        // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^[A-Z]{2}[ ][0-9]{1,2}[ ][A-Z]{1,2}[ ][0-9]{4}$')),],
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.primary,
                            hintText: "TN XX 11 1234",
                            hintStyle: const TextStyle(
                              color: Colors.white30,
                              fontSize: 20,
                            ),
                            labelText: "Vehicle Number",
                            labelStyle: const TextStyle(
                              color: white,
                            )),
                      ),
                      largeGap(),
                      largeGap(),
                      GestureDetector(
                        onTap: (() async {
                          //code to register new vehicle
                          var vhNum = vehicleNumberController.text;
                          if (regExVhNum.hasMatch(vhNum)) {
                            await supabase.from("VehicleData").insert({
                              "vehicle_number": vhNum,
                              "owner_uid": iblsController.userID.value,
                              "owner_name": iblsController.userName.value,
                              "user_uid": iblsController.userID.value,
                              "user_name": iblsController.userName.value,
                              "validity": null
                            });
                            await supabase.from("SearchData").insert({
                              "vehicle_number": vhNum,
                              "owner_uid": iblsController.userID.value,
                              "owner_name": iblsController.userName.value
                            });
                            vehicleNumberController.clear();
                            wrongInfo("Vehicle Added Successfully");
                          } else {
                            wrongInfo("Enter Vehicle Number is not Valid");
                          }
                        }),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          child: Center(
                            child: Text(
                              "Register Vehicle",
                              style: cardFontWhite(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }
}
