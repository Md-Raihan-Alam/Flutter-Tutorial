import 'package:flutter/cupertino.dart';
import 'package:flutterapp/utilities/dialogs/generic_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: "Delete",
    content: "Are you sure you want to delete this item?",
    optionBuilder: () => {
      "Cancel": false,
      "Yes": true,
    },
  ).then(
    (value) => value ?? false,
  );
}