import 'package:flutter_structure/data/models/response_code_item.dart';
import 'package:flutter_structure/utils/my_material.dart';

enum SimpleResponseCode {error, success}

class SimpleResponse extends ResponseCodeItem {

  SimpleResponseCode code;

  SimpleResponse({required this.code, super.messageType = MessageType.toast});

  @override
  String message(BuildContext context) {
    switch (code) {
      case SimpleResponseCode.error:
        return AppLocalizations.of(context)!.error;
      case SimpleResponseCode.success:
        return AppLocalizations.of(context)!.success;
    }
  }

  @override
  DialogType get type {
    switch (code) {
      case SimpleResponseCode.error:
        return DialogType.error;
      case SimpleResponseCode.success:
        return DialogType.success;
    }
  }

}