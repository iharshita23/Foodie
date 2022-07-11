import 'package:flutter/material.dart';
import 'package:food_app/config/color.dart';
import 'package:food_app/providers/check_out_providers.dart';
import 'package:food_app/screens/check_out/google_map.dart';
import 'package:food_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class AddDeliverAddress extends StatefulWidget {
  @override
  _AddDeliverAddressState createState() => _AddDeliverAddressState();
}

enum AddressTypes {
  Home,
  Work,
  Other,
}

class _AddDeliverAddressState extends State<AddDeliverAddress> {
  var myType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    var keyboardTypeProvider; //you created this
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Delivery Address",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: checkoutProvider.isloading == false
            ? MaterialButton(
                onPressed: () {
                  checkoutProvider.validator(context, myType);
                },
                child: Text(
                  "Add Address",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                color: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CustomTextField(
              labText: "First name",
              controller: checkoutProvider.firstName,
              keyboardType: keyboardTypeProvider.keyboardType,
            ),
            CustomTextField(
              labText: "Last name",
              controller: checkoutProvider.lastName,
              keyboardType: keyboardTypeProvider.keyboardType,
            ),
            CustomTextField(
              labText: "Mobile No",
              controller: checkoutProvider.mobileNo,
              keyboardType: keyboardTypeProvider.keyboardType,
            ),
            CustomTextField(
              labText: "Alternate Mobile No",
              controller: checkoutProvider.alternateMobileNo,
              keyboardType: keyboardTypeProvider.keyboardType,
            ),
            CustomTextField(
              labText: "Society",
              controller: checkoutProvider.society,
              keyboardType: keyboardTypeProvider.keyboardType,
            ),
            CustomTextField(
              labText: "Street",
              controller: checkoutProvider.street,
              keyboardType: keyboardTypeProvider.keyboardType,
            ),
            CustomTextField(
              labText: "Landmark",
              controller: checkoutProvider.landmark,
              keyboardType: keyboardTypeProvider.keyboardType,
            ),
            CustomTextField(
              labText: "City",
              controller: checkoutProvider.city,
              keyboardType: keyboardTypeProvider.keyboardType,
            ),
            CustomTextField(
              labText: "Area",
              controller: checkoutProvider.area,
              keyboardType: keyboardTypeProvider.keyboardType,
            ),
            CustomTextField(
              labText: "Pincode",
              controller: checkoutProvider.pincode,
              keyboardType: keyboardTypeProvider.keyboardType,
            ),
            InkWell(
              onTap: () {
               Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CustomGoogleMap(),
                  ),
                );
              },
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    checkoutProvider.setLocation == null? Text("Set Location"):
                    Text("Done!"),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Address Type"),
            ),
            RadioListTile(
              value: AddressTypes.Home,
              groupValue: myType,
              title: Text("Home"),
              onChanged: (AddressTypes? value) {
                setState(() {
                 myType = value!;
                });
              },
              secondary: Icon(
                Icons.home,
                color: primaryColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Work,
              groupValue: myType,
              title: Text("Work"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.work,
                color: primaryColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Other,
              groupValue: myType,
              title: Text("Other"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.devices_other,
                color: primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}