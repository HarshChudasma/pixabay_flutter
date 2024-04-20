import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Common text components for the project
///

class TextComponent extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final TextStyle? style;
  final TextOverflow? overFlow;
  final int? maxLines;
  final bool? softWrap;
  final double textScaleFactor;
  final List<String> listOfText;
  final List<TextStyle> listOfTextStyle;
  final List<Function()?> listOfOnPressedFunction;
  final bool removeSpace;

  const TextComponent(
      this.text, {
        Key? key,
        this.textAlign = TextAlign.left,
        this.style,
        this.overFlow = TextOverflow.ellipsis,
        this.maxLines,
        this.softWrap,
        this.textScaleFactor = 1.0,
        this.listOfText = const [],
        this.listOfTextStyle = const [],
        this.listOfOnPressedFunction = const [],
        this.removeSpace = false,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (listOfText.isEmpty) {
      return Text(
        text,
        maxLines: maxLines,
        softWrap: softWrap,
        overflow: overFlow,
        textAlign: textAlign,
        style: style,
      );
    } else {
      if (listOfTextStyle.length > listOfText.length) {
        throw ArgumentError(
          'Length of list of TextStyles cannot be greater than the List of text',
        );
      }
      else if (listOfOnPressedFunction.length > listOfText.length) {
        throw ArgumentError(
          'Length of list of Pressed Functions cannot be greater than the List of text',
        );
      }
      {
        final listOfTextSpans = <TextSpan>[];
        for (var t = 0; t < listOfText.length; t++) {
          listOfTextSpans.add(
            TextSpan(
              text: '${listOfText[t]}${removeSpace ? '' : ' '}',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (t < listOfOnPressedFunction.length) {
                    listOfOnPressedFunction[t]!();
                  }
                },
              style: (t + 1) > listOfTextStyle.length
                  ? const TextStyle(
                color: Colors.black,
              )
                  : listOfTextStyle[t],
            ),
          );
        }
        return RichText(
          text: TextSpan(children: listOfTextSpans),
        );
      }
    }
  }
}