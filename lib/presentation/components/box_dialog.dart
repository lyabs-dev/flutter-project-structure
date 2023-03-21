import 'dart:ui';
import 'package:lyabs_dev/utils/my_material.dart';

class BoxDialog extends StatelessWidget {
  final Widget child;
  final double? height, width;

  const BoxDialog({Key? key, required this.child, this.height = 400, this.width = double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Dialog(
        elevation: 0,
        alignment: Alignment.center,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return Material(
        type: MaterialType.transparency,
        elevation: 0,
        child: Container(
            height: height,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: child));
  }
}