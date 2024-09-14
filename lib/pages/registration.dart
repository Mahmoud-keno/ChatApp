import 'package:chat/widgts/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class Registration extends StatefulWidget {
  const Registration({super.key});
  static String id = 'registration';
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String? email;

  String? password;

  String? phonenumber;
  bool isloading = false;
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
                    padding:
                        const EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: Textfield(
                      onchanged: (data) {
                        password = data;
                      },
                      text_hint: 'Password',
                      icon: Icons.password_rounded,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 30, right: 30, bottom: 40),
                    child: Textfield(
                      text_hint: 'Mobile Number',
                      icon: Icons.phone_android_rounded,
                      onchanged: (data) {
                        phonenumber = data;
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              isloading = true;
                              setState(() {});
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: email!,
                                password: password!,
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'The password provided is too weak.'),
                                        backgroundColor: Color(0xff703EFF)));
                              } else if (e.code == 'email-already-in-use') {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'The account already exists for that email.'),
                                    backgroundColor: Color(0xff703EFF),
                                  ),
                                );
                              }
                            } catch (e) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(e.toString()),
                                      backgroundColor:
                                          const Color(0xff703EFF)));
                            }
                            isloading = false;
                            setState(() {});
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(),
                              child: Container(
                                height: 50,
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Color(0xff703EFF),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have a account '),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Login')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
