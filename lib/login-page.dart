import 'package:expensetracker/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Google-Sheets-API.dart';
import 'package:get_storage/get_storage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  Future signIn() async {
    // getName('yash');
    // Loading Circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim());

    // Turning Loading off after Sign in
    Navigator.of(context).pop();
  }

  // void dispose() {
  //   _emailcontroller.dispose();
  //   _passwordcontroller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final wname = GetStorage();
    if (FirebaseAuth.instance.currentUser?.email! == 'yashasviwadhwa924@gmail.com') {
      wname.write('workname', 'yash');
      if (wname.read('workname') != null) {
        wname.remove('workname');
        wname.write('workname', 'yash');
      }
    } else if (FirebaseAuth.instance.currentUser?.email! == 'tarunk@icloud.com') {
      if (wname.read('workname') != null) {
        wname.remove('workname');
        wname.write('workname', 'tarun');
      }
    }

    // else {
    //   wname.remove('workname');
    //   wname.write('workname', 'tarun');
    // }

    // print(_emailcontroller.text);
    print(wname.read('workname'));
    // print(FirebaseAuth.instance.currentUser?.email!);

    return Scaffold(
      // backgroundColor: Colors.grey[300],
      // backgroundColor: Colors.deepPurpleAccent[100],
      appBar: AppBar(
          title: Center(
            child: Text(
              'LOGIN',
              style: GoogleFonts.sourceSansPro(
                  color: Colors.black, fontWeight: FontWeight.w800),
            ),
          ),
          // centerTitle: ,
          elevation: 0,
          backgroundColor: Colors.transparent),
      body: Container(
        //child: Center(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login-image.jpg'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              //Welcome Message
              // Text(
              //   'Login',
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              SizedBox(
                height: 50,
              ),
              // Text(
              //   'Welcome Again',
              //   style: TextStyle(fontSize: 20),
              // ),

              //Email Textfeild
              SizedBox(
                height: 5,
              ),

              Image.asset(
                'assets/images/Login_illus.jpg',
                // fit: BoxFit.none,
                height: 200,
                width: 250,
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Email'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              //Pasword Textfeild
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Password'),
                      ),
                    )),
              ),
              SizedBox(
                height: 25,
              ),
              //Sign in button

              GestureDetector(
                onTap: signIn,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              //Register User
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member? '),
                  Text(
                    ' Register Now',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 400,
              ),
            ],
          ),
        ),
        //),
      ),
    );
  }
}
