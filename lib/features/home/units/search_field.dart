part of '../view.dart';

// ignore: must_be_immutable
class _SearchField extends StatelessWidget {
  _SearchField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kPadding1(10, 5),
      padding: kPadding1(10, 2),
      decoration: BoxDecoration(
        borderRadius: radius25,
        border: Border.all(color: kBlueClr),
      ),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        controller: controller,
        // onChanged: onChanged,
        style: style3.copyWith(fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          hintText: 'search by category...',
          hintStyle: style3.copyWith(fontWeight: FontWeight.w300),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.transparent,
          )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.transparent,
          )),
          suffixIcon: Icon(
            FontAwesomeIcons.search,
            color: kBlueClr.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
