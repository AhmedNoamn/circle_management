part of '../view.dart';

class _SearchField extends StatelessWidget {
  const _SearchField({Key? key, required this.onChanged}) : super(key: key);
  final Function(String)? onChanged;

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
        onChanged: onChanged,
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
