import 'package:flutter/material.dart';
// import 'package:expensetracker/pages/reusable_widget.dart';
import 'package:expensetracker/Signup/reusable_widget.dart';
import 'package:expensetracker/login-page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _userNameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _emailTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailinputTextController;
    return Form(
      key: _formKey,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Sign up",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login-image.jpg'),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(children: [
              //  Image.asset('asset/Login_illus.jpg'),s
              SizedBox(
                height: 25,
              ),
              reusableTextField("Enter UserName", Icons.person_outline, false,
                  _userNameTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Email Id", Icons.person_outline, false,
                  _emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.lock_outlined, true,
                  _passwordTextController),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              SignInUpButton(context, false, () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              })
            ]),
          )),
        ),
      ),
    );
  }
}
