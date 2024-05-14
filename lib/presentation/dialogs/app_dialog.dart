import 'dart:ui';
import 'package:structure/utils/my_material.dart';

class AppDialog {

  final String title;
  final String description;
  final IconData? icon;
  final Function(BuildContext context)? onButtonNegativePressed, onButtonPositivePressed;
  final String? buttonPositiveText, buttonNegativeText;
  final Widget? customContent;

  final BuildContext context;

  const AppDialog({required this.title, this.description = '', required this.context,
    this.icon, this.buttonPositiveText, this.buttonNegativeText, this.onButtonNegativePressed, this.onButtonPositivePressed,
    this.customContent});

  static Future showConfirmDialog(BuildContext context, String title) {
    return AppDialog(
      title: AppLocalizations.of(context)!.confirm,
      description: title,
      context: context,
      buttonNegativeText: AppLocalizations.of(context)!.no,
      buttonPositiveText: AppLocalizations.of(context)!.yes,
      onButtonNegativePressed: (BuildContext contextDialog) => Navigator.of(contextDialog).pop(false),
      onButtonPositivePressed: (BuildContext context) => Navigator.of(context).pop(true),
    ).show();
  }

  static Future showAboutAppDialog(BuildContext context) {
    return AppDialog(
      icon: Icons.info,
      title: AppLocalizations.of(context)!.about,
      description: AppLocalizations.of(context)!.aboutAppText,
      context: context,
      buttonPositiveText: AppLocalizations.of(context)!.close,
      onButtonPositivePressed: (BuildContext context) => Navigator.of(context).pop(),
    ).show();
  }

  Future show({dismissible = false}) {
    return showDialog(
        context: context,
        barrierDismissible: dismissible,
        builder: (BuildContext contextDialog) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AlertDialog(
              title: Text(title),
              icon: (icon != null)?
              Icon(
                icon,
                color: colorPrimary,
                size: 80,
              ): null,
              content: customContent??
                SingleChildScrollView(
                  child: Text(
                    description,
                  ),
                ),
              actions: [
                Visibility(
                  visible: buttonNegativeText != null,
                  child: TextButton(
                    onPressed: () {
                      if (onButtonNegativePressed != null) {
                        onButtonNegativePressed!(contextDialog);
                      } else {
                        Navigator.of(contextDialog).pop();
                      }
                    },
                    child: Text(buttonNegativeText ?? AppLocalizations.of(context)!.close),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (onButtonPositivePressed != null) {
                      onButtonPositivePressed!(contextDialog);
                    } else {
                      Navigator.of(contextDialog).pop();
                    }
                  },
                  child: Text(buttonPositiveText ?? AppLocalizations.of(context)!.ok),
                ),
              ],

            ),
          );
        }
    );
  }

}