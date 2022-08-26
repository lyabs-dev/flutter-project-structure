import 'package:flutter_structure/data/models/response_code_item.dart';
import 'package:flutter_structure/presentation/components/app_dialog.dart';
import 'package:flutter_structure/presentation/components/box_dialog.dart';
import 'package:flutter_structure/presentation/components/confirm_dialog.dart';
import 'package:flutter_structure/utils/my_material.dart';

class ResponseCodeWidget {

  ResponseCodeItem item;
  BuildContext context;
  Function()? onDialogOkClick;

  ResponseCodeWidget({required this.context, required this.item, this.onDialogOkClick});

  show() {

    if (item.messageType == MessageType.dialog) {
      _showDialog(context,);
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: colorPrimary,
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
      case DialogType.warning:
      case DialogType.info:
      case DialogType.error:
      case DialogType.success:
        page = AppDialog(description: message, type: item.type, onButtonPressed: onDialogOkClick, context: context,);
        break;
      case DialogType.confirm:
        page = ConfirmDialog(title: message,);
        break;
    }

    return showDialog(
        context: context,
        barrierColor: colorBlack.withOpacity(0.7),
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