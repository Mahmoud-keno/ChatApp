import 'package:chat/pages/chatpage.dart';
import 'package:chat/pages/registration.dart';
import 'package:chat/widgts/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


// ignore: must_be_immutable
class Loginpage extends StatefulWidget {
const Loginpage({super.key});
static String id = 'login page';

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String? email;
  String? password;
  bool isloading = false;
GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover)),
          child: Container(
            height: 500,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login-04.jpg'),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 320),
              child: Form(
              key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 30, right: 30),
                      child: Textfield(
                        
                        onchanged: (data) {
                          email = data;
                        },
                        text_hint: 'Email',
                        icon: Icons.mail_rounded,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 30, right: 30, bottom: 40),
                      child: Textfield(
                        onchanged: (data) {
                          
                          password = data;
                        },
                        text_hint: 'Password',
                        icon: Icons.password_rounded,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: ElevatedButton(
                        onPressed: () => _handleLogin(context),
                        child: Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xff6D63FF)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const Registration();
                            }));
                          },
                          child: const Text('Register'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleLogin(BuildContext context) async {
    setState(() => isloading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      // Login successful, navigate to next screen or show success message
      // ignore: use_build_context_synchronously
      _showSnackBar(context, 'Login successful!');
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, Chatpage.id);
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'User not found';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = e.message!;
      }
      // ignore: use_build_context_synchronously
      _showSnackBar(context, message);
    } catch (e) {
      // ignore: use_build_context_synchronously
      _showSnackBar(context, e.toString());
    } finally {
      setState(() => isloading = false);
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xff703EFF),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
