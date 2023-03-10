import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final double? padding;
  final double? horizontalMargin;
  final double? verticalMargin;
  final Function()? onTap;
  final bool clicked;
  const ButtonWidget({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
    this.padding = 0.0,
    this.horizontalMargin = 0.0,
    this.verticalMargin = 0.0,
    this.clicked = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: clicked ? SystemMouseCursors.wait : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: clicked ? null : onTap,
        child: Container(
          padding: EdgeInsets.all(padding!),
          margin: EdgeInsets.symmetric(
              horizontal: horizontalMargin!, vertical: verticalMargin!),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: textColor,
                    fontSize: 16.0,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
