import 'package:enotes/app_localization.dart';
import 'package:enotes/application/auth/auth_bloc.dart';
import 'package:enotes/application/notes/note_actor/note_actor_bloc.dart';
import 'package:enotes/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:enotes/injection.dart';
import 'package:enotes/presentation/routes/arguments_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';

import 'widgets/notes_overview_body.dart';
import 'widgets/uncompleted_switch.dart';

class NoteOverviewPage extends StatelessWidget {
  const NoteOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteWatcherBloc>(
          create: (context) => getIt.get<NoteWatcherBloc>()
            ..add(const NoteWatcherEvent.watchAllStarted()),
        ),
        BlocProvider<NoteActorBloc>(
          create: (context) => getIt.get<NoteActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                unauthenticated: (_) =>
                    Navigator.of(context).pushReplacementNamed('/login'),
                orElse: () {},
              );
            },
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (context, state) {
              state.maybeMap(
                deleteFailure: (state) {
                  showSimpleNotification(
                    Text(
                      "ERROR",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      state.noteFailure.map(
                        unexpected: (_) => AppLocalizations.of(context)!
                            .translate("delete_error")!,
                        insufficientPermission: (_) =>
                            '${AppLocalizations.of(context)!.translate("permission")} ❌',
                        unableToUpdate: (_) => AppLocalizations.of(context)!
                            .translate("impossible")!,
                      ),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    position: NotificationPosition.bottom,
                    background: Colors.red[400],
                    autoDismiss: true,
                    duration: const Duration(seconds: 5),
                  );
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            leading: IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                context.read<AuthBloc>().add(const AuthEvent.signedOut());
              },
            ),
            actions: <Widget>[
              UncompletedSwitch(),
            ],
          ),
          body: NotesOverviewBody(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                "/note_form",
                arguments: NoteFormArguments(editedNote: null),
              );
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
