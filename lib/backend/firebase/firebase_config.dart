import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB2XzSpZMlheTdR5VC--o-NS96mIAA3q_M",
            authDomain: "sipletechcliente.firebaseapp.com",
            projectId: "sipletechcliente",
            storageBucket: "sipletechcliente.appspot.com",
            messagingSenderId: "869866578550",
            appId: "1:869866578550:web:65ae7f3e401219bd697557",
            measurementId: "G-GT4R9XZ19X"));
  } else {
    await Firebase.initializeApp();
  }
}
