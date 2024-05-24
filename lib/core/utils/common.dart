import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'appColors/app_colors.dart';


void navigate({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushNamed(
    context,
    route,
    arguments: arg,
  );
}

void navigateReplacement({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushReplacementNamed(
    context,
    route,
    arguments: arg,
  );
}




void showToast({
  required String message,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
    webPosition: "center",
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: getState(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { error, success, warning }

Color getState(ToastStates state) {
  switch (state) {
    case ToastStates.error:
      return AppColors.redColor;
    case ToastStates.success:
      return AppColors.greenColor;
    case ToastStates.warning:
      return AppColors.primaryColor;
  }
}


 Future<XFile?> pickImage(ImageSource source) async{
  XFile? image = await ImagePicker().pickImage(source: source);
  if(image!=null){
    print(image.path);
    return image;
  }else{
    return null;
  }
}




