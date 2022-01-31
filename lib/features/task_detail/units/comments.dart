part of '../view.dart';

class _CommentUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ListTileUnit(
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            'assets/images/man.png',
          ),
        ),
        title: Text('commenter name'),
        subTitle: Text('comment content'),
      ),
      separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            height: 8,
            thickness: 2,
            color: kGreyClr,
          )),
      itemCount: 10,
    );
  }
}
