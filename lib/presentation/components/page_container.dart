import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/logic/cubits/app_cubit.dart';
import 'package:flutter_structure/logic/states/app_state.dart';
import 'package:flutter_structure/presentation/components/response_code_widget.dart';
import 'package:flutter_structure/utils/my_material.dart';

class PageContainer extends StatelessWidget {

  final Widget child;

  const PageContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listener: listener,
      child: child,
    );
  }

  listener(BuildContext context, AppState state) {

    if (state.response != null) {

      ResponseCodeWidget(context: context, item: state.response!).show();
      state.response = null;
    }

  }

  openPage(BuildContext context, String page, Map<String, dynamic> arguments) {

  }

}