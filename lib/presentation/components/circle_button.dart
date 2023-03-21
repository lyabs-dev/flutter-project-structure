
import 'package:lyabs_dev/utils/my_material.dart';

class CircleButton extends StatefulWidget {

  final Function onPressed;
  final FontWeight? textFontWeight;
  final IconData? icon;
  final double size, height;
  final Color primaryColor, iconColor;

  const CircleButton(this.icon, this.onPressed,
      {Key? key,
        this.primaryColor = colorPrimary,
        this.iconColor = colorWhite,
        this.size = textSizeNormal,
        this.height = 50,
        this.textFontWeight
      })
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
          color: _reaction ? colorPrimary : widget.primaryColor,
          shape: BoxShape.circle
        ),
        height: widget.height,
        width: widget.height,
        child: Icon(widget.icon, color: _reaction ? colorWhite : widget.iconColor,size:widget.size , ),
      ),
    );
  }
}
//color: