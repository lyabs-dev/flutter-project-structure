import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_structure/data/models/response_code_item.dart';
import 'package:flutter_structure/utils/my_material.dart';

class ResponseCodeWidget {

  ResponseCodeItem item;
  BuildContext context;
  Function()? onDialogOkClick;

  ResponseCodeWidget({required this.context, required this.item, this.onDialogOkClick});

  show() {

    if (item.type == MessageType.Dialog) {
      return AwesomeDialog(
        context: context,
        headerAnimationLoop: false,
        dialogType: this.item.code.type,
        width: 400,
        title: title,
        desc: message,
        btnOkOnPress: onDialogOkClick?? () {},
        btnOkColor: COLOR_PRIMARY,
      ).show();
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: COLOR_PRIMARY,
        ),
      );
    }

  }

  String get title {
    String title = AppLocalizations.of(context)!.success;

    if (this.item.code.type == DialogType.ERROR) {
      title = AppLocalizations.of(context)!.error;
    }
    if (this.item.code.type == DialogType.INFO) {
      title = AppLocalizations.of(context)!.info_;
    }
    if (this.item.code.type == DialogType.WARNING) {
      title = AppLocalizations.of(context)!.warning;
    }

    return title;
  }

  String get message {
    switch (this.item.code) {
      case ResponseCode.Error:
        return AppLocalizations.of(context)!.somethingWentWrong;
      case ResponseCode.Warning:
        return AppLocalizations.of(context)!.warning;
      case ResponseCode.InFo:
        return AppLocalizations.of(context)!.info_;
      case ResponseCode.Success:
        return AppLocalizations.of(context)!.success;
    }
  }

}