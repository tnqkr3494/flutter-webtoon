import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var _newMessage = "";
  final _controller = TextEditingController();

  void sendMessage() {
    FocusScope.of(context).unfocus();
    FirebaseFirestore.instance.collection("chat").add({"text": _newMessage});
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
                _newMessage = value;
              },
            ),
          ),
          IconButton(
            onPressed: _newMessage.trim().isEmpty ? null : sendMessage,
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
