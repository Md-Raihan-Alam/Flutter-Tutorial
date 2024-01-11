import 'package:flutter/material.dart';
import 'package:flutterapp/services/auth/auth_service.dart';
import 'package:flutterapp/services/crud/notes_service.dart';
import 'package:flutterapp/utilities/generics/get_arguments.dart';
import 'package:flutterapp/services/cloud/cloud_note.dart';
import 'package:flutterapp/services/cloud/cloud_storage_constants.dart';
import 'package:flutterapp/services/cloud/firebase_cloud_storage.dart';

class CreateUpdateNoteView extends StatefulWidget {
  const CreateUpdateNoteView({super.key});

  @override
  State<CreateUpdateNoteView> createState() => _CreateUpdateNoteViewState();
}

class _CreateUpdateNoteViewState extends State<CreateUpdateNoteView> {
  // DatabaseNote? _note;
  CloudNote? _note;
  // late final NotesService _notesService;
  late final FirebaseCloudStorage _notesService;
  late final TextEditingController _textController;

  @override
  void initState() {
    // _notesService = NotesService();
    _notesService = FirebaseCloudStorage();
    _textController = TextEditingController();
    super.initState();
  }

  // void _textContollerListener() async {
  //   final note = _note;
  //   if (note == null) {
  //     return;
  //   }
  //   final text = _textController.text;
  //   await _notesService.updateNote(note: note, text: text);
  // }
  void _textContollerListener() async {
    final note = _note;
    if (note == null) {
      return;
    }
    final text = _textController.text;
    await _notesService.updateNote(documentId: note.documentId, text: text);
  }

  void _setupTextContollerListener() {
    _textController.removeListener(_textContollerListener);
    _textController.addListener(_textContollerListener);
  }

  Future<CloudNote> createOrGetExistingNote(BuildContext context) async {
    // Future<DatabaseNote> createOrGetExistingNote(BuildContext context) async {

    // final widgetNote = context.getArgument<DatabaseNote>();
    final widgetNote = context.getArgument<CloudNote>();
    if (widgetNote != null) {
      _note = widgetNote;
      _textController.text = widgetNote.text;
      return widgetNote;
    }
    final existingNote = _note;
    if (existingNote != null) {
      return existingNote;
    }
    final currentUser = AuthService.firebase().currentUser!;
    // final email = currentUser.email;
    final userId = currentUser.id;
    final newNote = await _notesService.createNewNote(ownerUserId: userId);
    // final owner = await _notesService.getUser(email: email);
    // final newNote = await _notesService.createNote(owner: owner);
    _note = newNote;
    return newNote;
  }

  // void _deleteNoteIfTextIsEmpty() {
  //   final note = _note;
  //   if (_textController.text.isEmpty && note != null) {
  //     _notesService.deleteNote(id: note.id);
  //   }
  // }
  void _deleteNoteIfTextIsEmpty() {
    final note = _note;
    if (_textController.text.isEmpty && note != null) {
      _notesService.deleteNote(documentId: note.documentId);
    }
  }

  // void _saveNoteIfTextNotEmpty() async {
  //   final note = _note;
  //   final text = _textController.text;
  //   if (note != null && text.isNotEmpty) {
  //     await _notesService.updateNote(note: note, text: text);
  //   }
  // }
  void _saveNoteIfTextNotEmpty() async {
    final note = _note;
    final text = _textController.text;
    if (note != null && text.isNotEmpty) {
      await _notesService.updateNote(
        documentId: note.documentId,
        text: text,
      );
    }
  }

  @override
  void dispose() {
    _deleteNoteIfTextIsEmpty();
    _saveNoteIfTextNotEmpty();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Note")),
      body: FutureBuilder(
          future: createOrGetExistingNote(context),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                _setupTextContollerListener();
                return TextField(
                  controller: _textController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Start typing your note...',
                  ),
                );
              default:
                return const CircularProgressIndicator();
            }
          }),
    );
  }
}
