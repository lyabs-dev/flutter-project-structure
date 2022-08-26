import 'package:flutter_structure/data/models/response_code_item.dart';
import 'package:flutter_structure/utils/my_material.dart';

enum SimpleResponseCode {Error, Success}

class SimpleResponse extends ResponseCodeItem {

  @override
  MessageType messageType;

  SimpleResponseCode code;

  SimpleResponse({required this.code, this.messageType: MessageType.Toast});

  @override
  String message(BuildContext context) {
    switch (code) {
      case SimpleResponseCode.Error:
        return AppLocalizations.of(context)!.error;
      case SimpleResponseCode.Success:
        return AppLocalizations.of(context)!.success;
    }
  }

  @override
  DialogType get type {
    switch (code) {
      case SimpleResponseCode.Error:
        return DialogType.Error;
      case SimpleResponseCode.Success:
        return DialogType.Success;
    }
  }

}