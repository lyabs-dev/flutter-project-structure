
import 'package:flutter_structure/presentation/components/my_text.dart';
import 'package:flutter_structure/utils/my_material.dart';

class AppButton extends StatefulWidget {

  final String? text, icon, iconWhite;
  final Function onPressed;
  final FontWeight? textFontWeight;
  final double fontSize, borderRadius, paddingHorizontal, paddingVertical;
  final Color primaryColor, textColor;
  final bool whitIcons;

  const AppButton(this.text, this.onPressed,
      {Key? key,
      this.primaryColor = colorPrimary,
      this.textColor = colorWhite,
      this.fontSize = textSizeSMedium,
      this.borderRadius = 15,
      this.textFontWeight,
      this.icon,
      this.iconWhite,
      this.paddingHorizontal = 15.0,
      this.paddingVertical = 8.0,
      this.whitIcons = false})
      : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _reaction = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onTap: () => widget.onPressed(),
      onTapDown: (tDown) {
        setState(() {
          _reaction = true;
        });
      },
      onTapUp: (tUp) {
        setState(() {
          _reaction = false;
        });
      },
      highlightColor: _reaction
          ? colorPrimary.withOpacity(0.30)
          : colorWhite.withOpacity(0.30),
      hoverColor: colorWhite,
      child: Container(
        decoration: BoxDecoration(
          color: _reaction ? colorPrimary : widget.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: widget.paddingHorizontal,
            vertical: widget.paddingVertical),
        child: widget.whitIcons
            ? Row(
                children: [
                  Image(
                    image: AssetImage(
                        _reaction ? widget.iconWhite! : widget.icon!),
                    filterQuality: FilterQuality.high,
                    height: 25,
                  ),
                  SizedBox(
                    width: getShortSize(5),
                  ),
                  Expanded(
                    child: MyText(
                      widget.text!,
                      style: TextStyle(
                        fontSize: widget.fontSize,
                        color: _reaction ? colorWhite : widget.textColor,
                        fontWeight: widget.textFontWeight ?? FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              )
            : MyText(
                widget.text!,
                style: TextStyle(
                  fontSize:widget.fontSize,
                  color: _reaction ? colorWhite : widget.textColor,
                  fontWeight: widget.textFontWeight ?? FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
