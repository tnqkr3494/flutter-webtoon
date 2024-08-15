import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var _newMessage = "";
  final _controller = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  void sendMessage() async {
    FocusScope.of(context).unfocus();
    await FirebaseFirestore.instance.collection("chat").add(
      {
        "text": _newMessage,
        "time": Timestamp.now(),
        "id": user!.uid,
      },
    );
    setState(() {
      _newMessage = "";
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: "Send a message"),
              onChanged: (value) {
                setState(() {
                  _newMessage = value;
                });
              },
            ),
          ),
          IconButton(
            onPressed: _newMessage.trim().isEmpty
                ? () {
                    print(_newMessage
                        .trim()
                        .isEmpty); // onChange에서 setState를 설정안해줘서 업데이트가 한발 느림
                  }
                : sendMessage,
            icon: const Icon(
              Icons.send,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
