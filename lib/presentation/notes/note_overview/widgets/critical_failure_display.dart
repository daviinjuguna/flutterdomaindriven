import 'package:enotes/app_localization.dart';
import 'package:enotes/domain/notes/note_failure.dart';
import 'package:flutter/material.dart';

class CriticalFailureDisplay extends StatelessWidget {
  final NoteFailure failure;

  const CriticalFailureDisplay({
    Key? key,
    required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            '😱',
            style: TextStyle(fontSize: 100),
          ),
          Text(
            failure.maybeMap(
              insufficientPermission: (_) =>
                  '${AppLocalizations.of(context)!.translate("permission")} ❌',
              orElse: () =>
                  '${AppLocalizations.of(context)!.translate("unexpected_error")}. \n${AppLocalizations.of(context)!.translate("contact_support")}.',
            ),
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () {
              print('Sending email!');
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.mail),
                SizedBox(width: 4),
                Text(AppLocalizations.of(context)!.translate("elp")!),
              ],
            ),
          )
        ],
      ),
    );
  }
}
