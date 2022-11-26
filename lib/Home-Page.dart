import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return SafeArea(
      child: Center(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Signed In ' + user.email!),
                SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  color: Colors.red,
                  child: Text('Sign Out'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
