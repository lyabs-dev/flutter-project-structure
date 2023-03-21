import 'package:lyabs_dev/utils/my_material.dart';

abstract class ResponseCodeItem {

  MessageType messageType;

  ResponseCodeItem({this.messageType = MessageType.toast});

  String message(BuildContext context);

  String title(BuildContext context) {

    switch (type) {
      case DialogType.error:
        return AppLocalizations.of(context)!.error;
      case DialogType.info:
        return AppLocalizations.of(context)!.info_;
      case DialogType.warning:
        return AppLocalizations.of(context)!.warning;
      default:
        return AppLocalizations.of(context)!.success;
    }

  }

  DialogType get type;

}