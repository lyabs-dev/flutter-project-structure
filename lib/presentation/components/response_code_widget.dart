import 'package:flutter_structure/data/models/response_code_item.dart';
import 'package:flutter_structure/presentation/components/app_dialog.dart';
import 'package:flutter_structure/presentation/components/box_dialog.dart';
import 'package:flutter_structure/presentation/components/dialog_confirm.dart';
import 'package:flutter_structure/utils/my_material.dart';

class ResponseCodeWidget {

  ResponseCodeItem item;
  BuildContext context;
  Function()? onDialogOkClick;

  ResponseCodeWidget({required this.context, required this.item, this.onDialogOkClick});

  show() {

    if (item.messageType == MessageType.Dialog) {
      _showDialog(context,);
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
    return item.title(context);
  }

  String get message {
    return item.message(context);
  }

  _showDialog(BuildContext context) {

    Widget page;

    switch (item.type) {
      case DialogType.Warning:
      case DialogType.Info:
      case DialogType.Error:
      case DialogType.Success:
        page = AppDialog(description: message, type: item.type, onButtonPressed: onDialogOkClick,);
        break;
      case DialogType.Confirm:
        page = DialogConfirm(title: message,);
        break;
    }

    return showDialog(
        context: context,
        barrierColor: COLOR_BLACK.withOpacity(0.7),
        barrierDismissible: false,
        builder: (BuildContext context) {
          return BoxDialog(
              height: 300,
              child: page
          );
        }
    );
  }

}