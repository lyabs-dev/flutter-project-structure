import 'package:structure/presentation/components/app_edit_text.dart';
import 'package:structure/utils/my_material.dart';

class CustomDialog extends StatelessWidget {

  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'lorem ipsum ' * 5,
        ),
        const SizedBox(height: 10),
        AppEditText(
          'Field',
          backgroundColor: colorPrimary.withOpacity(0.5),
          borderRadius: 10,
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ],
    );
  }

}