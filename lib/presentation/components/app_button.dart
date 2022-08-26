
import 'package:flutter_structure/presentation/components/my_text.dart';
import 'package:flutter_structure/utils/my_material.dart';

class AppButton extends StatefulWidget {
  String? text, icon, iconWhite;
  Function onPressed;
  FontWeight? textFontWeight;
  double fontSize, borderRadius, paddingHorizontal, paddingVertical;
  Color primaryColor, textColor;
  bool whitIcons;

  AppButton(this.text, this.onPressed,
      {Key? key,
      this.primaryColor = COLOR_PRIMARY,
      this.textColor = COLOR_WHITE,
      this.fontSize = TEXT_SIZE_S_MEDIUM,
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
          ? COLOR_PRIMARY.withOpacity(0.30)
          : COLOR_WHITE.withOpacity(0.30),
      hoverColor: COLOR_WHITE,
      child: Container(
        decoration: BoxDecoration(
          color: _reaction ? COLOR_PRIMARY : widget.primaryColor,
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
                        color: _reaction ? COLOR_WHITE : widget.textColor,
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
                  color: _reaction ? COLOR_WHITE : widget.textColor,
                  fontWeight: widget.textFontWeight ?? FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
