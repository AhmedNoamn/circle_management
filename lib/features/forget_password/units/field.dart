part of '../view.dart';

class _FieldUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomInputField(
          hint: 'start searching',
          obscureText: false,
          inputAction: TextInputAction.search,
        ),
        SizedBox(height: sizeHeight(context, 10)),
      ],
    );
  }
}
