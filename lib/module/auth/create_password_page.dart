
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/lock_controller.dart';

class CreatePasswordPage extends StatelessWidget {
  final LockController controller = Get.put(LockController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Create a Password', style: TextStyle(color: Colors.white, fontSize: 24)),
                SizedBox(height: 20),
                TextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white10,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.createPassword,
                  child: Text('Save Password'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
