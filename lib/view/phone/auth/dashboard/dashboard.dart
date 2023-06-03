import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisyadmin/main.dart';

import 'package:pisyadmin/view/layout_builder.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileBody: Scaffold(
          appBar: AppBar(backgroundColor: Colors.orange, actions: [
            IconButton(
              onPressed: () {
                Get.toNamed("/Notifications");
              },
              icon: Icon(Icons.notifications_none),
            )
          ]),
          body: SafeArea(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      print(msg);
                    },
                    child: Text("data"))
              ],
            ),
          ),
        ),
        desktopBody: Scaffold());
  }
}
