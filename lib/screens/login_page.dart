import 'package:flutter/material.dart';
import 'package:second_task/Design/animation_list.dart';
import 'package:second_task/Design/clipper/custom_clipper.dart';
import 'package:second_task/screens/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _isSecurePassword = true;
  final _formfield = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final name = TextEditingController();
  bool passToggl = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          key: scaffoldkey,
          body: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Form(
              key: _formfield,
              child: Column(
                children: [
                  ClipPath(
                    clipper: AppCustomClipper(),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 135),
                      color: Colors.purple,
                      height: 350,
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                    .hasMatch(value)) {
                              return 'Enter the correct gmail';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            hintText: 'Enter the gmail',
                            label: const Text('Email'),
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Colors.purple,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _isSecurePassword,
                          validator: (value) {
                            //0:No password
                            //1/4:week
                            //2/4:Medium
                            //3/4:Storage
                            //1:Great
                            if (value!.isEmpty ||
                                !RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\w)')
                                    .hasMatch(value)) {
                              return 'Enter the correct password';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            hintText: 'Enter password ',
                            label: const Text('password'),
                            prefixIcon: const Icon(
                              Icons.lock_open,
                              color: Colors.purple,
                            ),
                            suffixIcon: togglePassword(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 2),
                          child: Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                      width: 1, color: Colors.white),
                                  backgroundColor: Colors.purple,
                                  fixedSize: const Size(280, 40),
                                ),
                                onPressed: () {
                                  if (_formfield.currentState!.validate()) {
                                    _formfield.currentState!.reset();
                                    navTo(context, const AnimationItem());
                                  }
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    navTo(context, const SignUpPage());
                                  },
                                  child: const Text(
                                    'Do you not have an account? ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  )),
                            ],
                          ))
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      icon: _isSecurePassword
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: Colors.purple,
    );
  }

  navTo(context, Widget) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
}
