import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: 'Password Reset',
    content:
        'we have now sent you a password reset link.Please check your email for more information.',
    optionsbuilder: () => {
      'OK': null,
    },
  );
}
