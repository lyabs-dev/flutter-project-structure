import 'package:flutter_structure/utils/my_material.dart';

abstract class ResponseCodeItem {

  MessageType messageType;

  ResponseCodeItem({this.messageType: MessageType.Toast});

  String message(BuildContext context);

  String title(BuildContext context) {
    String title = AppLocalizations.of(context)!.success;

    if (this.type == DialogType.Error) {
      title = AppLocalizations.of(context)!.error;
    }
    if (this.type == DialogType.Info) {
      title = AppLocalizations.of(context)!.info_;
    }
    if (this.type == DialogType.Warning) {
      title = AppLocalizations.of(context)!.warning;
    }

    return title;
  }

  DialogType get type;

}