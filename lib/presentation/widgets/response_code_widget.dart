import 'package:structure/data/models/response_code_item.dart';
import 'package:structure/utils/my_material.dart';

class ResponseCodeWidget {

  ResponseCodeItem item;
  BuildContext context;

  ResponseCodeWidget({required this.context, required this.item,});

  Future show() async {

    if (item.messageType == MessageType.dialog) {
      await _showDialog();
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

  _showDialog() {

    AppDialog appDialog = AppDialog(title: title, description: message, context: context,
      buttonPositiveText: item.textPositive(context), icon: item.icon,
      onButtonPositivePressed: (BuildContext contextDialog) => Navigator.of(contextDialog).pop(),
    );

    return appDialog.show();
  }

}