part of '../view.dart';

class _AddCommentUnit extends StatefulWidget {
  @override
  State<_AddCommentUnit> createState() => _AddCommentUnitState();
}

class _AddCommentUnitState extends State<_AddCommentUnit> {
  bool _isCommenting = false;

  void _showCommentButtton() {
    setState(() {
      _isCommenting = !_isCommenting;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 200),
      child: _isCommenting
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TaskInputField(
                    maxLines: 4,
                    hint: '',
                    onTap: () {},
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomButton(
                      onTap: () => _showCommentButtton(),
                      child: Text(
                        'Post',
                        style: style2.copyWith(fontSize: 17),
                      ),
                      margin: kPadding1(5, 5),
                    ),
                    CustomTextButton(
                        ontap: () => _showCommentButtton(),
                        child: Text(
                          'Cancel',
                          style: style3,
                        ))
                  ],
                )
              ],
            )
          : Center(
              child: CustomButton(
                  width: sizeWidth(context, 1.5),
                  onTap: () => _showCommentButtton(),
                  child: Text(
                    'Add a Comment',
                    style: style2,
                  )),
            ),
    );
  }
}
