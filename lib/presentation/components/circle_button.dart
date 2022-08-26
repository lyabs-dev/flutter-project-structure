
import 'package:flutter_structure/utils/my_material.dart';

class CircleButton extends StatefulWidget {

  Function onPressed;
  FontWeight? textFontWeight;
  IconData? icon;
  double size, height;
  Color primaryColor, iconColor;

  CircleButton(this.icon, this.onPressed,
      {Key? key,
        this.primaryColor = COLOR_PRIMARY,
        this.iconColor = COLOR_WHITE,
        this.size = TEXT_SIZE_NORMAL,
        this.height = 50})
      : super(key: key);

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  bool _reaction = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
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
      child: Container(

        decoration: BoxDecoration(
          color: _reaction ? COLOR_PRIMARY : widget.primaryColor,
          shape: BoxShape.circle
        ),
        height: widget.height,
        width: widget.height,
        child: Icon(widget.icon, color: _reaction ? COLOR_WHITE : widget.iconColor,size:widget.size , ),
      ),
    );
  }
}
//color: