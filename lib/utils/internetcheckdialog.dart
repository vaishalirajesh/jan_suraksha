import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jan_suraksha/utils/showcustomesnackbar.dart';

import 'net_util.dart';

void showSnackBarForintenetConnection(BuildContext context, Future<void> Function() apicall) async {
  // set up the button
  Widget okButton = TextButton(
    child: Text("Retry"),
    onPressed: () async {
      if (await NetUtils.isInternetAvailable()) {
        showSnackBar(context, "You are online now");
        Navigator.of(context).pop(false);
        apicall();
      } else {
        showSnackBar(context, "You are offline");
      }
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Connectivity"),
    content: Text("You are Offline.Please Turn on internet"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
          child: alert,
          onWillPop: () async {
            return false;
          });
    },
  );
}
