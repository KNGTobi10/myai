import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC8l4wk6Hf1MCtkw7sJjDlRk5q2QJ68zo0",
            authDomain: "united-base-405519.firebaseapp.com",
            projectId: "united-base-405519",
            storageBucket: "united-base-405519.appspot.com",
            messagingSenderId: "300379450770",
            appId: "1:300379450770:web:39c4d47910efbcaa9de54b"));
  } else {
    await Firebase.initializeApp();
  }
}
