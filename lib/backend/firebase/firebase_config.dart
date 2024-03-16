import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD0p33vNsP_YuPZJyQcRJ5bH3G34xJ590o",
            authDomain: "lembrare-69b76.firebaseapp.com",
            projectId: "lembrare-69b76",
            storageBucket: "lembrare-69b76.appspot.com",
            messagingSenderId: "861738353258",
            appId: "1:861738353258:web:f397c2d77ce6b6467c0013"));
  } else {
    await Firebase.initializeApp();
  }
}
