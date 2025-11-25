import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/note_controller.dart';
import 'screens/note_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  Get.lazyPut<NoteController>(() => NoteController());
  runApp(ProviderScope(child: NotesApp()));
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My notes',
      home: NoteScreen(),
    );
  }
}
