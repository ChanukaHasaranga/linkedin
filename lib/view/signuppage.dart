import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin/view/loginpage.dart';
import 'package:linkedin/viewmodel/auth_view_model.dart';
import 'package:linkedin/widget/custome_appbar.dart';
import 'package:provider/provider.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _emailError;
  String? _passwordError;
  bool _obscurePassword = true;


 String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomeAppbar(
        home: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sign up",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 45,
                      fontWeight: FontWeight.w900),
                ),
                const Text(
                  'Stay updated on your professional world',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.black),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 84, 84, 84))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 84, 84, 84))),
                    labelText: 'Email or Phone',
                    errorText: _emailError,
                  ),
                  validator: _validateEmail,
                  onChanged: (value) {
                    setState(() {
                      _emailError = _validateEmail(value);
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                                        labelStyle: const TextStyle(color: Colors.black),

                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 84, 84, 84))),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 84, 84, 84))),
                      labelText: 'Password (6 characters minimum)',
                      errorText: _passwordError,
                      suffixIcon: TextButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          child: Text(
                            _obscurePassword ? "Show" : "Hide",
                            style: const TextStyle(
                                color: Color(0xFF0073B1), fontSize: 12),
                          ))),
                  obscureText: _obscurePassword,
                  validator: _validatePassword,
                  onChanged: (value) {
                    setState(() {
                      _passwordError = _validatePassword(value);
                    });
                  },
                ),
const SizedBox(height: 20,),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(fontSize: 12, color: Color.fromARGB(144, 0, 0, 0)),
                    children: [
                      const TextSpan(text: 'By clicking Accept and register, you agree to the '),
                      TextSpan(
                        text: 'Terms of Use',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            debugPrint('Tapped Terms of Use');
                          },
                      ),
                      const TextSpan(text: ', the '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            debugPrint('Tapped Privacy Policy');
                          },
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Cookies Policy',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            debugPrint('Tapped Cookies Policy');
                          },
                      ),
                      const TextSpan(text: '.'),
                    ],
                  ),
                                ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6,top: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
                          backgroundColor: const Color(0xFF0073B1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          authViewModel.signup(
                            _emailController.text,
                            _passwordController.text,
                            context,
                          );
                        }
                      },
                      child: const Text(
                        'Accept and register',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        indent: 0,
                        endIndent: 10,
                        height: 20,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      "or",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        indent: 10,
                        endIndent: 0,
                        height: 20,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.apple,
                          color: Colors.black,
                          size: 25,
                        ),
                        Text(
                          " Sign up with Apple",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.black,
                          size: 20,
                        ),
                        Text(
                          " Sign up with Google",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )
                      ],
                    )),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const LoginPage()));
                    },
                    child: const Text(
                      'Have a Account ? Log now',
                      style: TextStyle(color: Color(0xFF0073B1), fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
