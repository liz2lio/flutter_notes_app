import 'package:get/get.dart';
import '../models/note.dart';

class NoteController {
  var notes = <Note>[].obs;

  void addNote(String content) {
    notes.add(
      Note(id: DateTime.now().toString(), content: content),
    );
  }

  void deleteNoteById(String id) {
    notes.removeWhere((note) => note.id == id);
  }
}
