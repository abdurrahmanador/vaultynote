import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/view/home_view.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BackButton(
                color: Colors.white,
                onPressed: () {
                  Get.off(() => HomeView());
                },
              ),
            ),
            SizedBox(height: 20),

            // Settings Items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Title
                  Text("Settings", style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),

                  SizedBox(height: 30),

                  // Change PIN
                  ListTile(
                    onTap: () {
                      print("Change PIN tapped");
                      // Navigate to Change PIN Screen (future)
                    },
                    leading: Icon(Icons.lock, color: Colors.white),
                    title: Text("Change App PIN", style: TextStyle(color: Colors.white)),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
                  ),
                  Divider(color: Colors.white24),

                  // Emergency Destroyer
                  ListTile(
                    onTap: () {
                      print("Emergency Destroyer tapped");
                      // Call your emergency destroy function
                    },
                    leading: Icon(Icons.warning_amber_rounded, color: Colors.redAccent),
                    title: Text("Emergency Destroyer", style: TextStyle(color: Colors.redAccent)),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
                  ),
                  Divider(color: Colors.white24),

                  // About App
                  ListTile(
                    onTap: () {
                      print("About tapped");
                      // Navigate to About Page (future)
                    },
                    leading: Icon(Icons.info_outline, color: Colors.white),
                    title: Text("About SecureNote+", style: TextStyle(color: Colors.white)),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
                  ),
                  Divider(color: Colors.white24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
