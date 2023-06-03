import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisyadmin/util/util.dart';
import 'package:pisyadmin/view/layout_builder.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  var selected = "0".obs;
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktopBody: Scaffold(),
      mobileBody: Scaffold(
        appBar: AppBar(
          title: Text(
            "Notifications",
          ),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Mark all as Read",
              ),
              style: ElevatedButton.styleFrom(elevation: 0),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SegmentedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
                      (Set<MaterialState> states) {
                        return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        );
                      },
                    ),
                  ),
                  segments: const <ButtonSegment<String>>[
                    ButtonSegment(
                      value: "0",
                      label: Text("Unread"),
                    ),
                    ButtonSegment(
                      value: "1",
                      label: Text("Read"),
                    ),
                    ButtonSegment(
                      value: "2",
                      label: Text("Checkin"),
                    ),
                  ],
                  onSelectionChanged: (p0) {
                    setState(() {
                      selected.value = p0.first;
                    });
                  },
                  selected: <String>{selected.value.toString()},
                ),
              ),
            ),
            Expanded(child: Obx(() => noti()))
          ],
        ),
      ),
    );
  }

  noti() {
    switch (selected.value) {
      case "0":
        return ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text("M"),
                  ),
                  title: Text("Mandar Sonavne updated Fanbuku"),
                  subtitle: Text("4h ago"),
                ),
                Divider(),
              ],
            );
          },
        );

      case "1":
        return ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text("M"),
                  ),
                  title: Text("Siddhant Vedpathak Completed taskname task"),
                  subtitle: Text("4h ago"),
                ),
                Divider(),
              ],
            );
          },
        );

      case "2":
        return ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text("M"),
                  ),
                  title: Text("Sorav Solanki Checked In"),
                  subtitle: Text("4h ago"),
                ),
                Divider(),
              ],
            );
          },
        );
      default:
        return SizedBox(
          child: Text("Error while Fetching Notifications"),
        );
    }
  }
}
