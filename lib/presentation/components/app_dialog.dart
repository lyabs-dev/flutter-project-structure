import 'package:flutter_structure/presentation/components/app_button.dart';
import 'package:flutter_structure/presentation/components/my_text.dart';
import 'package:flutter_structure/utils/my_material.dart';

class AppDialog extends StatelessWidget {

  final String description;
  final DialogType type;
  final Function()? onButtonPressed;

  late BuildContext context;

  AppDialog({required this.description, required this.type, this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: COLOR_WHITE,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            iconPath,
            height: getProportionateScreenWidth(120),
            color: COLOR_PRIMARY,
          ),
          MyText(
            title,
            style: TextStyle(
                color: COLOR_PRIMARY,
                fontSize: TEXT_SIZE_LARGE_MEDIUM,
                fontWeight: FontWeight.w900),
          ),
          MyText(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: COLOR_PRIMARY,
              fontSize: TEXT_SIZE_LARGE_MEDIUM,
            ),
          ),
          AppButton(
            textOnButton,
            () {
              if (onButtonPressed != null) {
                onButtonPressed!();
              }
              Navigator.of(context).pop();
            },
            paddingHorizontal: 30,
          ),
        ],
      ),
    );
  }

  String get iconPath {
    switch (type) {
      case DialogType.Error:
        return PathIcons.error;
      case DialogType.Success:
        return PathIcons.success;
      case DialogType.Info:
        return PathIcons.info;
      case DialogType.Confirm:
        return PathIcons.info;
      case DialogType.Warning:
        return PathIcons.warning;
    }
  }

  String get title {
    switch (type) {
      case DialogType.Error:
        return AppLocalizations.of(context)!.error;
      case DialogType.Success:
        return AppLocalizations.of(context)!.success;
      case DialogType.Info:
        return AppLocalizations.of(context)!.info_;
      case DialogType.Confirm:
        return AppLocalizations.of(context)!.confirm;
      case DialogType.Warning:
        return AppLocalizations.of(context)!.warning;
    }
  }

  String get textOnButton {
    switch (type) {
      case DialogType.Error:
        return AppLocalizations.of(context)!.tryAgain;
      case DialogType.Success:
        return AppLocalizations.of(context)!.done;
      case DialogType.Info:
      case DialogType.Confirm:
      case DialogType.Warning:
        return AppLocalizations.of(context)!.ok;
    }
  }

}