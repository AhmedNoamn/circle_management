import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.title,
    required this.imageUrl,
    required this.onTap,
    required this.description,
    required this.trailling,
    this.onLongPress,
  });

  final String title;
  final Widget imageUrl;
  final Function() onTap;
  final Function()? onLongPress;
  final String description;
  final Widget trailling;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: kBlueClr,
      elevation: 3,
      margin: kPadding2,
      child: ListTile(
          onTap: onTap,
          onLongPress: onLongPress,
          contentPadding: kPadding1(5, 5),
          leading: Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: kGreyClr, width: 3),
              ),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                child: imageUrl,
                borderRadius: BorderRadius.circular(45),
              ),
              radius: 45,
            ),
          ),
          title: Text(
            title,
            style: style3,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(
              FontAwesomeIcons.ellipsisH,
              color: kBlueClr.withOpacity(0.8),
            ),
            Text(
              description,
              style: style4.copyWith(color: kDarkClr.withOpacity(0.6)),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ]),
          trailing: trailling),
    );
  }
}
