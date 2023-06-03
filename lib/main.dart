import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisyadmin/firebase_options.dart';
import 'package:pisyadmin/view/routes/routes.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  log("Handling a background Message: ${message.messageId}");
}

RemoteMessage msg = RemoteMessage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.subscribeToTopic("admin");
  // await FirebaseMessaging.instance.unsubscribeFromTopic ("admin");

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) {
      msg = message;
      log("Got a Message while in foreground");
      log(message.toString());
      if (message.notification != null) {
        log("Message also contained a notificaiton : ${message.notification!.title}");
      }

      // Get.snackbar("${message. }", message)
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          ),
      getPages: routes,
      initialRoute: "/",
    );
  }
}
