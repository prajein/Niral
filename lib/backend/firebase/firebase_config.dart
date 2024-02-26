import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDVBimIlcYx3spv4GSDqMaHstW6hsszDMs",
            authDomain: "gdsc-bxkqqg.firebaseapp.com",
            projectId: "gdsc-bxkqqg",
            storageBucket: "gdsc-bxkqqg.appspot.com",
            messagingSenderId: "662184595842",
            appId: "1:662184595842:web:3fcbfbcb08e3989445ff9b"));
  } else {
    await Firebase.initializeApp();
  }
}
