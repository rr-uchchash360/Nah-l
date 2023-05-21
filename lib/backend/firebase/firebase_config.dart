import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA7u83G28fHgOlI75M8FOayRA-tFRwwmgo",
            authDomain: "nahl-39f64.firebaseapp.com",
            projectId: "nahl-39f64",
            storageBucket: "nahl-39f64.appspot.com",
            messagingSenderId: "1050688744090",
            appId: "1:1050688744090:web:77890a67da1594399d8d23",
            measurementId: "G-8MQ4N247RP"));
  } else {
    await Firebase.initializeApp();
  }
}
