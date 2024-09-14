import 'package:chat/models/messagemodel.dart';
import 'package:chat/widgts/chatbubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class Chatpage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Chatpage({super.key, required this.message});
  static String id = 'Chatpage';
  // ignore: non_constant_identifier_names
  CollectionReference Messages =
      FirebaseFirestore.instance.collection('Messages');
  final String message;
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Messages.orderBy('time' , descending: true).snapshots(),
        builder: (context, snapshot) {
          List<Messagemodel> messagelist = [];
          if (snapshot.hasData) {
            for (var i = 0; i < snapshot.data!.docs.length; i++) {
              messagelist.add(Messagemodel.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              backgroundColor: const Color.fromARGB(193, 250, 250, 250),
              body: Column(
                children: [
                  Container(
                      height: 65,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          color: const Color(0xffFFFFFF),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ])),
                  Expanded(
                    child: ListView.builder(
                      controller: _controller,
                      reverse: true,
                      itemCount: messagelist.length,
                      itemBuilder: (context, index) {
                        return Chatbubble(message: messagelist[index]);
                      },
                    ),
                  ),
                  Container(
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        color: const Color(0xffFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xffD4D4D4)),
                        child: TextField(
                          onSubmitted: (data) {
                            Messages.add(
                                {'Text': data, 'time': DateTime.now()});
                            TextEditingController().clear();
                            _controller.animateTo(
                              0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeIn,
                            );
                          },
                          decoration: const InputDecoration(
                              suffixIcon: Icon(
                                Icons.send_rounded,
                                color: Color(0xff703EFF),
                              ),
                              hintText: 'Type here...',
                              hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff703EFF),
                                  fontWeight: FontWeight.w500),
                              contentPadding:
                                  EdgeInsets.only(left: 10, bottom: 20),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffFAFAFA),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
