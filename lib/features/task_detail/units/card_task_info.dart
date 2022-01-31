part of '../view.dart';

class _CardTaskInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: kPadding,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _UserData(),
            divider,
            _TaskDateData(),
            divider,
            _StateUnit(),
            SizedBox(height: 15),
            _AddCommentUnit(),
            _CommentUnit()
          ],
        ),
      ),
    );
  }
}
