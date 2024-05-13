import 'package:structure/data/models/response_code_item.dart';
import 'package:structure/utils/my_material.dart';

enum AppCode {error, success}

class AppResponse extends ResponseCodeItem {

  AppCode code;

  AppResponse({required this.code, super.messageType = MessageType.toast});

  @override
  String message(BuildContext context) {
    switch (code) {
      case AppCode.error:
        return AppLocalizations.of(context)!.error;
      case AppCode.success:
        return AppLocalizations.of(context)!.success;
    }
  }

  @override
  DialogType get type {
    switch (code) {
      case AppCode.error:
        return DialogType.error;
      case AppCode.success:
        return DialogType.success;
    }
  }

}