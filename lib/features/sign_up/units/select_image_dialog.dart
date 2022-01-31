part of '../view.dart';

_showSelectImageDialog(BuildContext context) {
  final cubit = SignUpCubit.of(context);
  return showDialog(
    context: context,
    builder: (context) => ImageSelectWay(cubit),
  );
}

class ImageSelectWay extends StatelessWidget {
  const ImageSelectWay(this.cubit);
  final SignUpCubit cubit;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: radius15,
      ),
      titlePadding: EdgeInsets.all(0),
      contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            color: kBlueClr,
          ),
          padding: kPadding,
          child: Text(
            'Please Selecet ',
            style: style2,
          )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PickWay(
              onTap: () {
                cubit.getCameraImage();
                MagicRoute.pop();
              },
              icon: FontAwesomeIcons.camera,
              text: 'Camera'),
          _PickWay(
              onTap: () {
                cubit.getGalleryImage();
                MagicRoute.pop();
              },
              icon: FontAwesomeIcons.images,
              text: 'Gallery')
        ],
      ),
    );
  }
}

class _PickWay extends StatelessWidget {
  const _PickWay({
    required this.onTap,
    required this.icon,
    required this.text,
  });
  final Function() onTap;
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          children: [
            Icon(
              icon,
              color: kBlueClr,
            ),
            SizedBox(width: 15),
            Text(
              text,
              style: style3,
            ),
          ],
        ),
      ),
    );
  }
}
