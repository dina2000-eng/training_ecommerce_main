import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_text_styles.dart';

class MainDialog {
  final BuildContext context;
  final String title;
  final String content;
  final List<Map<String, void Function()?>>? actions;

  MainDialog({
    required this.context,
    required this.title,
    required this.content,
    this.actions,
  });

  showAlertDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            title,
            style: AppTextStyles.font24BlackWeight400,
          ),
          content: Text(
            content,
            style: AppTextStyles.font16BlackWeight400,
          ),
          actions: (actions != null)
              ? actions!
              .map((action) => TextButton(
            onPressed: action.values.first,
            child:  Text(action.keys.first),
          ))
              .toList()
              : [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ));
  }
}