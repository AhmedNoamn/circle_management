part of '../view.dart';

class ImageUnits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = SignUpCubit.of(context);
    return Stack(
      children: [
        BlocBuilder(
            bloc: cubit,
            builder: (context, states) {
              return Container(
                width: 100,
                height: 100,
                margin: kPadding1(5, 5),
                decoration: BoxDecoration(
                  borderRadius: radius25,
                  color: Colors.transparent,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: cubit.imageFile == null
                      ? Image.asset(
                          'assets/images/man.png',
                          fit: BoxFit.fill,
                        )
                      : Image.file(
                          cubit.imageFile!,
                          fit: BoxFit.fill,
                        ),
                ),
              );
            }),
        BlocBuilder(
            bloc: cubit,
            builder: (context, states) {
              return Positioned(
                top: 8,
                right: 0,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: kGreyClr,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () => _showSelectImageDialog(context),
                    icon: Icon(
                      cubit.imageFile == null
                          ? FontAwesomeIcons.image
                          : FontAwesomeIcons.pen,
                      color: kBlueClr,
                      size: 19,
                    ),
                  ),
                ),
              );
            })
      ],
    );
  }
}
