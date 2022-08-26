import 'package:flutter_structure/utils/my_material.dart';

abstract class ResponseCodeItem {

  MessageType messageType;

  ResponseCodeItem({this.messageType = MessageType.toast});

  String message(BuildContext context);

  String title(BuildContext context) {
    String title = AppLocalizations.of(context)!.success;

    if (type == DialogType.error) {
      title = AppLocalizations.of(context)!.error;
    }
    if (type == DialogType.info) {
      title = AppLocalizations.of(context)!.info_;
    }
    if (type == DialogType.warning) {
      title = AppLocalizations.of(context)!.warning;
    }

    return title;
  }

  DialogType get type;

}