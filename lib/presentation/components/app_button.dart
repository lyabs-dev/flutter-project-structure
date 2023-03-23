import 'package:lyabs_dev/utils/my_material.dart';

class AppButton extends StatelessWidget {

  final String text;
  final Widget? icon;
  final Function onPressed;
  final FontWeight? textFontWeight;
  final double? fontSize, borderRadius, paddingHorizontal, paddingVertical;
  final Color primaryColor, textColor, highlightColor;
  final bool whitIcons, isLoading;
  final BuildContext context;

  const AppButton(
      {Key? key,
        required this.text,
        required this.onPressed,
        required this.context,
        this.primaryColor = colorPrimary,
        this.textColor = colorWhite,
        this.fontSize = textSizeSMedium,
        this.borderRadius = 12,
        this.textFontWeight,
        this.highlightColor = colorPrimary,
        this.icon,
        this.paddingHorizontal = paddingMedium,
        this.paddingVertical = paddingMedium,
        this.isLoading = false,
        this.whitIcons = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!)),
        onTap: () {
          if (! isLoading) {
            onPressed();
          }
        },
        highlightColor: colorWhite.withOpacity(0.2),
        hoverColor: colorPrimary,
        child: Ink(
          //  width: getProportionateScreenWidth(width!, context),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(borderRadius!.r))),
          padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal!.r,
              vertical:  paddingVertical!.r
          ),
          child: whitIcons
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon!,
              SizedBox(
                width: getShortSize(5, context),
              ),
              Expanded(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize:
                    fontSize!.sp,
                    color: textColor,
                    fontWeight: textFontWeight ?? FontWeight.w600,
                  ),
                ),
              ),
            ],
          )
              : Text(
            buttonText  ,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize!.sp,
              color: textColor,
              fontWeight: textFontWeight ?? FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Color? get backgroundColor {

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
