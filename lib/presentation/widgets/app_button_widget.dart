import 'package:structure/utils/my_material.dart';

class AppButtonWidget extends StatelessWidget {

  final String text;
  final IconData? icon;
  final Function onPressed;
  final FontWeight? textFontWeight;
  final double? fontSize;
  final double paddingHorizontal, paddingVertical, borderRadius, borderWidth;
  final Color primaryColor, foregroundColor, borderColor, highlightColor;
  final bool isLoading, showBorder, enabled;
  final BuildContext context;

  const AppButtonWidget(
      {super.key,
        required this.context,
        required this.text,
        required this.onPressed,
        this.primaryColor = colorPrimary,
        this.highlightColor = const Color(0x20FFFFFF),
        this.foregroundColor = colorWhite,
        this.fontSize,
        this.borderRadius = 12,
        this.textFontWeight,
        this.icon,
        this.paddingHorizontal = paddingSmall,
        this.paddingVertical = 0,
        this.borderWidth = 0,
        this.borderColor = colorPrimary,
        this.showBorder = false,
        this.isLoading = false,
        this.enabled = true,
      });

  @override
  Widget build(BuildContext context) {

    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: onClick,
        icon: Icon(icon, color: foregroundColor),
        label: child,
        style: style,
      );
    }

    return ElevatedButton(
      onPressed: onClick,
      style: style,
      child: child,
    );
  }

  ButtonStyle get style {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
      overlayColor: WidgetStateProperty.all<Color>(highlightColor),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(
          horizontal: paddingHorizontal,
          vertical:  paddingVertical,
        ),
      ),
      elevation: WidgetStateProperty.all<double>(0),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: showBorder? BorderSide(color: borderColor, width: borderWidth): BorderSide.none,
        ),
      ),
    );
  }

  void Function()? onClick() {

    if (isLoading || ! enabled) {
      return null;
    }

    return onPressed();
  }

  Widget get child {
    return Text(
      buttonText,
      style: TextStyle(
        fontSize: fontSize,
        color: foregroundColor,
        fontWeight: textFontWeight,
      ),
    );
  }

  Color get backgroundColor {

    if (! enabled) {
      return Colors.grey.withOpacity(0.5);
    }

    if (isLoading) {
      return primaryColor.withOpacity(0.5);
    }

    return primaryColor;
  }

  String get buttonText {

    if (isLoading) {
      return '${AppLocalizations.of(context)!.loading}...';
    }

    return text;
  }
}
