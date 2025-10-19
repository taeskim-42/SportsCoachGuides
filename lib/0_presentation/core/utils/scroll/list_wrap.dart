import 'package:flutter/material.dart';

class KeyBoardScrollUpWrap extends StatefulWidget {
  /// only scroll
  final Widget child;

  /// this controller must be attached child list
  final ScrollController scrollController;

  const KeyBoardScrollUpWrap({
    Key? key,
    required this.child,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<KeyBoardScrollUpWrap> createState() => _KeyBoardScrollUpWrapState();
}

class _KeyBoardScrollUpWrapState extends State<KeyBoardScrollUpWrap> {
  double prevKeyboardHeight = 0.0;

  BuildContext? ctx;

  void scrollUpAfterBuild(double keyboardHeight) {
    final diff = keyboardHeight - prevKeyboardHeight;
    prevKeyboardHeight = keyboardHeight;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        double to = widget.scrollController.offset + diff;
        if (to <= widget.scrollController.position.maxScrollExtent &&
            to >= widget.scrollController.position.minScrollExtent) {
          widget.scrollController.jumpTo(to);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    scrollUpAfterBuild(MediaQuery.of(context).viewInsets.bottom);
    return widget.child;
  }
}
