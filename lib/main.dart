import 'package:chat/pages/chatpage.dart';
import 'package:chat/pages/getstarted.dart';
import 'package:chat/pages/loginpage.dart';
import 'package:chat/pages/registration.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Getstarted.id: (context) => const Getstarted(),
        Loginpage.id: (context) =>  const Loginpage(),
        Registration.id: (context) => const Registration(),
        Chatpage.id : (context) => Chatpage(message: '',)
      },
      initialRoute: Getstarted.id,
    );
  }
}
