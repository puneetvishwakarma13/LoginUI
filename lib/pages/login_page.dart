
// ignore_for_file: prefer_const_literals_to_create_immutables, duplicate_ignore, prefer_const_constructors

// import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
final VoidCallback showRegisterPage;
const LoginPage({Key? key, required this.showRegisterPage }) : super(key: key);

@override
State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//Text Controllers
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

Future signIn() async {
await FirebaseAuth.instance.signInWithEmailAndPassword(
email: _emailController.text.trim(),
password: _passwordController.text.trim(),
);
}
@override
void dispose() {
// TODO: implement dispose
_emailController.dispose();
_passwordController.dispose();
super.dispose();
}



@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.white,
body: SafeArea(
child: Center(
child: SingleChildScrollView(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.android,
size: 40,
),
//Text
// SizedBox(height: 25,),
Text(
'Welcome',
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 50,
),
),
SizedBox(
height: 10,
),
Text(
'You Are Amazing',
style: TextStyle(
fontSize: 20,
),
),
SizedBox(
height: 30,
),
//email
Padding(
padding: const EdgeInsets.symmetric(horizontal: 25.0),
child: Container(
decoration: BoxDecoration(
color: Colors.grey[200],
border: Border.all(color: Colors.white),
borderRadius: BorderRadius.circular(12),
),
child: Padding(
padding: const EdgeInsets.only(left: 20.0),
child: TextField(
controller: _emailController,
decoration: InputDecoration(
border: InputBorder.none,
hintText: 'someone@xyz.com',
),
),
),
),
),


//password
SizedBox(
height: 15,
),
Padding(
padding: const EdgeInsets.symmetric(horizontal: 25.0),
child: Container(
decoration: BoxDecoration(
color: Colors.grey[200],
border: Border.all(color: Colors.white),
borderRadius: BorderRadius.circular(12),
),
child: Padding(
padding: const EdgeInsets.only(left: 20.0),
child: TextField(
controller: _passwordController,
obscureText: true,
decoration: InputDecoration(
border: InputBorder.none,
hintText: 'password',
),
),
),
),
),


//sign in
SizedBox(
height: 25,
),
Padding(
padding: const EdgeInsets.symmetric(horizontal: 25.0),
child: GestureDetector(
onTap: signIn,
child: Container(
padding: EdgeInsets.all(18),
decoration: BoxDecoration(
color: Colors.deepPurpleAccent,
borderRadius: BorderRadius.circular(12)),
child: Center(
child: Text(
'Sign In',
style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
fontSize: 18,
),
),
),
),
),
),
//not a member! Register Now
SizedBox(
height: 25,
),
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
'Not a Member?  ',
style: TextStyle(
fontWeight: FontWeight.bold,
),
),
GestureDetector(
onTap: widget.showRegisterPage,
child: Text(
'Register Now',
style: TextStyle(
color: Colors.blue,
fontWeight: FontWeight.bold,
),
),
)
],
),
],
),
),
),
),
);
}
}