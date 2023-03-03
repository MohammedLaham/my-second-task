import 'package:flutter/material.dart';
import 'package:second_task/Design/animation_list.dart';
import 'package:second_task/Design/clipper/custom_clipper.dart';
import 'package:second_task/screens/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  bool _isSecurePassword = true;
  final _formfield = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final name=TextEditingController();
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
                          'Register',
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
                          // key: name,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                              return 'Enter the correct name';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            hintText: 'Enter the Full Name ',
                            label: const Text('Full Name'),
                            prefixIcon: const Icon(
                              Icons.person_2_outlined,
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
                            horizontal: 8, vertical: 2),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                    .hasMatch(value)) {
                              return 'Enter the correct number';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            prefixText: '+970',
                            filled: true,
                            fillColor: Colors.white54,
                            hintText: 'Enter phone number ',
                            label: const Text('phone '),
                            prefixIcon: const Icon(
                              Icons.phone,
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
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                      width: 1, color: Colors.purple),
                                  backgroundColor: Colors.white,
                                  fixedSize: const Size(280, 40),
                                ),
                                onPressed: () {
                                  navTo(context,const LoginPage());
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
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
