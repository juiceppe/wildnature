import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wildnature/services/authService.dart';
import 'package:wildnature/signUp.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final registerButton = SizedBox(
      width: 130,
      child: FlatButton(
          child: Text("Sign up",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(76, 99, 94, 1))),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          onPressed: () {
            print('ciao');
          }));

  final forgotPassword = FlatButton(
      child: Text("Forgot Password?",
          style: TextStyle(
              letterSpacing: 1.5,
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.grey[600])),
      onPressed: () {
        print('ciao');
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:
            false, //Avoid resize image when keyboard pops up
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomLeft)),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 35,
                  right: 35,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.person,
                          color: Color.fromRGBO(76, 99, 94, 1)),
                      labelText: "Email",
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(180, 120, 99, 1), width: 3.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.vpn_key,
                          color: Color.fromRGBO(76, 99, 94, 1)),
                      labelText: "Password",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(180, 120, 99, 1), width: 3.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 130,
                          child: FlatButton(
                              child: Text("Sign in",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(76, 99, 94, 1))),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0)),
                              onPressed: () {
                                context.read<AuthenticationService>().signIn(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim());
                              })),
                      SizedBox(width: 60),
                      SizedBox(
                          width: 130,
                          child: FlatButton(
                              child: Text("Sign up",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(76, 99, 94, 1))),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpPage()));
                              }))
                    ],
                  ),
                  SizedBox(height: 10),
                  forgotPassword,
                  SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ));
  }
}

//TODO:context.read<AuthenticationService>().signOut(); Add this to signOut Button
