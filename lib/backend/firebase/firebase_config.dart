import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDTFd4y_LVRFyOiNEgrUapShcEBNKVisb0",
            authDomain: "repositoriolibros-b72a1.firebaseapp.com",
            projectId: "repositoriolibros-b72a1",
            storageBucket: "repositoriolibros-b72a1.appspot.com",
            messagingSenderId: "305344350954",
            appId: "1:305344350954:web:502c4313765b0644c62593",
            measurementId: "G-HXL8NY7B9V"));
  } else {
    await Firebase.initializeApp();
  }
}
