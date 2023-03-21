import 'package:lyabs_dev/data/models/response_code_item.dart';
import 'package:lyabs_dev/presentation/components/app_dialog.dart';
import 'package:lyabs_dev/presentation/components/box_dialog.dart';
import 'package:lyabs_dev/utils/my_material.dart';

class ResponseCodeWidget {

  ResponseCodeItem item;
  BuildContext context;
  Function()? onDialogOkClick;

  ResponseCodeWidget({required this.context, required this.item, this.onDialogOkClick});

  Future show() async {

    if (item.messageType == MessageType.dialog) {
      await _showDialog(context,);
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

    Widget page = AppDialog(title: title, description: message, type: item.type, onButtonPressed: onDialogOkClick, context: context,);


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