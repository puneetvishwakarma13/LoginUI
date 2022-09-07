// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
final VoidCallback showLoginPage;
const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

@override
State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


//Text Controllers
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

@override
void dispose() {
// TODO: implement dispose
_emailController.dispose();
_passwordController.dispose();
super.dispose();
}
Future signUp() async {
await FirebaseAuth.instance.createUserWithEmailAndPassword(
email: _emailController.text.trim(),
password: _passwordController.text.trim(),
);
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
'Register Below',
style: TextStyle(
fontSize: 20,
),
),
SizedBox(
height: 30,
),

//Name
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
hintText: 'Your Full Name',
),
),
),
),
),

SizedBox(
height: 15,
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
onTap: signUp,
child: Container(
padding: EdgeInsets.all(18),
decoration: BoxDecoration(
color: Colors.deepPurpleAccent,
borderRadius: BorderRadius.circular(12)),
child: Center(
child: Text(
'Sign Up',
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
'I am a member  ',
style: TextStyle(
fontWeight: FontWeight.bold,
),
),
GestureDetector(
onTap: widget.showLoginPage,
child: Text(
'Login Now',
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