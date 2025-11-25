import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/note_controller.dart';
import 'screens/note_screen.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final snapshot = await _firestore.collection('notes').get();
  snapshot.docs.forEach((doc) => print('${doc.id}: ${doc.data()}'));

  Get.lazyPut<NoteController>(
    () => NoteController(),
  );
  runApp(
    GetMaterialApp(
      title: 'My notes',
      home: NotesApp(),
    ),
  );
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoteScreen();
  }
}
