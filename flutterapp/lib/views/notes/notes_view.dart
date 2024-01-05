// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/services/auth/auth_service.dart';
import 'package:flutterapp/services/crud/notes_service.dart';
import 'package:flutterapp/views/notes/notes_list_view.dart';

import '../../constants/routes.dart';
import '../../enums/menu_acion.dart';
import '../../utilities/dialogs/logout_dialog.dart';

class NoteView extends StatefulWidget {
  const NoteView({super.key});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  late final NotesService _notesService;
  String get userEmail => AuthService.firebase().currentUser!.email!;
  @override
  void initState() {
    _notesService = NotesService();
    _notesService.open();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Notes'), actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(createOrUpdateNoteRoute);
          },
          icon: const Icon(Icons.add),
        ),
        PopupMenuButton<MenuAction>(
          onSelected: (value) async {
            switch (value) {
              case MenuAction.logout:
                final shouldLogout = await showLogOutDialog(context);
                (shouldLogout.toString());
                if (shouldLogout) {
                  // await FirebaseAuth.instance.signOut();
                  await AuthService.firebase().logOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    loginRoute,
                    (_) => false,
                  );
                }
            }
          },
          itemBuilder: (context) {
            return const [
              PopupMenuItem(
                value: MenuAction.logout,
                child: Text("Log out"),
              ),
            ];
          },
        )
      ]),
      body: FutureBuilder(
        future: _notesService.getOrCreateUser(email: userEmail),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return StreamBuilder(
                  stream: _notesService.allNotes,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.active:
                        if (snapshot.hasData) {
                          final allNotes = snapshot.data as List<DatabaseNote>;
                          return NoteListView(
                            notes: allNotes,
                            onDeleteNote: (note) async {
                              await _notesService.deleteNote(id: note.id);
                            },
                            onTap: (note) async {
                              Navigator.of(context).pushNamed(
                                createOrUpdateNoteRoute,
                                arguments: note,
                              );
                            },
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      default:
                        return const CircularProgressIndicator();
                    }
                  });
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
