part of '../drawer.dart';

class _Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeWidth(context, 1),
      height: sizeHeight(context, 2.8),
      //padding: kPadding1(0, 20),
      decoration: BoxDecoration(
        color: kBlueClr,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 15),
          CircleAvatar(
            child: Image.asset('assets/images/monitor.png'),
            radius: 40,
          ),
          Text(
            'Circle Management',
            style: style2,
          )
        ],
      ),
    );
  }
}
