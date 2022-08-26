import 'package:flutter_structure/presentation/components/app_button.dart';
import 'package:flutter_structure/presentation/components/my_text.dart';
import 'package:flutter_structure/utils/my_material.dart';

class AppDialog extends StatelessWidget {

  final String description;
  final DialogType type;
  final Function()? onButtonPressed;

  final BuildContext context;

  const AppDialog({Key? key, required this.description, required this.type, this.onButtonPressed,
    required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colorWhite,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            iconPath,
            height: getProportionateScreenWidth(120),
            color: colorPrimary,
          ),
          MyText(
            title,
            style: const TextStyle(
                color: colorPrimary,
                fontSize: textSizeLargeMedium,
                fontWeight: FontWeight.w900),
          ),
          MyText(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: colorPrimary,
              fontSize: textSizeLargeMedium,
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
      case DialogType.error:
        return PathIcons.error;
      case DialogType.success:
        return PathIcons.success;
      case DialogType.info:
        return PathIcons.info;
      case DialogType.confirm:
        return PathIcons.info;
      case DialogType.warning:
        return PathIcons.warning;
    }
  }

  String get title {
    switch (type) {
      case DialogType.error:
        return AppLocalizations.of(context)!.error;
      case DialogType.success:
        return AppLocalizations.of(context)!.success;
      case DialogType.info:
        return AppLocalizations.of(context)!.info_;
      case DialogType.confirm:
        return AppLocalizations.of(context)!.confirm;
      case DialogType.warning:
        return AppLocalizations.of(context)!.warning;
    }
  }

  String get textOnButton {
    switch (type) {
      case DialogType.error:
        return AppLocalizations.of(context)!.tryAgain;
      case DialogType.success:
        return AppLocalizations.of(context)!.done;
      case DialogType.info:
      case DialogType.confirm:
      case DialogType.warning:
        return AppLocalizations.of(context)!.ok;
    }
  }

}