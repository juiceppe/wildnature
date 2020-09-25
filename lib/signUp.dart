import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wildnature/homePage.dart';
import 'package:wildnature/services/authService.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  final fullName = TextFormField(
    decoration: InputDecoration(
      suffixIcon: Icon(Icons.person, color: Color.fromRGBO(76, 99, 94, 1)),
      labelText: "Full Name",
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            color: Color.fromRGBO(180, 120, 99, 1), width: 3.0),
        borderRadius: BorderRadius.circular(25.0),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 180),
                    fullName,
                    SizedBox(height: 30),
                    TextFormField(
                      controller: emailController,
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Please something';
                        }
                      },
                      onSaved: (input) => _email,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email,
                            color: Color.fromRGBO(76, 99, 94, 1)),
                        labelText: "Email",
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(180, 120, 99, 1),
                              width: 3.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: passwordController,
                      validator: (input) {
                        if (input.length < 8) {
                          return 'Please insert password';
                        }
                      },
                      onSaved: (input) => _password,
                      obscureText: true,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.vpn_key,
                            color: Color.fromRGBO(76, 99, 94, 1)),
                        labelText: "Password",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(180, 120, 99, 1),
                              width: 3.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                        width: 130,
                        child: FlatButton(
                            child: Text("Sign up",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(76, 99, 94, 1),
                                    letterSpacing: 1.5)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0)),
                            onPressed: () {
                              context.read<AuthenticationService>().signUp(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim());
                              Navigator.push(
                                  //TODO: Is it the right way? Find out to go in the homePage right after singing up!
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            }))
                  ],
                ),
              )),
        ));
  }
}
