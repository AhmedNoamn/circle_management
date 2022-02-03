import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    required this.titleDialoge,
    required this.listLength,
    required this.itemBuilder,
    this.actionList,
  });
  final String titleDialoge;
  final int listLength;
  final Widget Function(BuildContext, int) itemBuilder;
  final List<Widget>? actionList;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: kPadding3,
      title: Container(
        padding: kPadding,
        color: kBlueClr,
        child: Text(
          titleDialoge,
          style: style2,
        ),
      ),
      content: SizedBox(
        width: sizeWidth(context, 1),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: listLength,
          itemBuilder: itemBuilder,
        ),
      ),
      actions: actionList!,
    );
  }
}

/*
(context, index) => GestureDetector(
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.checkSquare),
                        Text(
                          listItem[index],
                          style: style3,
                        )
                      ],
                    ),
                  ),
                )
*/

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    required this.itemValue,
    required this.onChanged,
    required this.generateItems,
    this.actionList,
  });
  final String itemValue;
  final Function(String?)? onChanged;
  final List<Widget>? actionList;
  final List<DropdownMenuItem<String>>? generateItems;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: kPadding1(15, 0),
        margin: kPadding2,
        decoration: BoxDecoration(
          border: Border.all(color: kDarkClr),
          borderRadius: radius15,
          color: kGreyClr.withOpacity(0.5),
        ),
        child: DropdownButton<String>(
          style: style2.copyWith(color: kDarkClr),
          value: itemValue,
          underline: Container(width: 0),
          icon: Icon(
            FontAwesomeIcons.angleDown,
            color: kBlueClr.withOpacity(0.6),
            size: 30,
          ),
          dropdownColor: kWhiteClr,
          borderRadius: radius15,
          onChanged: onChanged,
          items: generateItems,
        ));
  }
}
