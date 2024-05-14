import 'package:structure/utils/my_material.dart';

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

  IconData get icon {
    switch (type) {
      case DialogType.error:
        return Icons.error;
      case DialogType.success:
        return Icons.check_circle;
      case DialogType.info:
        return Icons.info;
      case DialogType.warning:
        return Icons.warning;
    }
  }

  String textPositive(BuildContext context) {
    switch (type) {
      case DialogType.error:
        return AppLocalizations.of(context)!.tryAgain;
      case DialogType.success:
        return AppLocalizations.of(context)!.done;
      case DialogType.info:
      case DialogType.warning:
        return AppLocalizations.of(context)!.ok;
    }
  }

  DialogType get type;

}