import 'package:flutter/material.dart';
import 'package:frenzy/chat_messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _textEditingController = new TextEditingController();
  final List<ChatMessages> _messages = [];

  void _handleSubmitted(String text) {
    _textEditingController.clear();
    ChatMessages message = ChatMessages(text: text);
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textComposer() {
    return IconTheme(
      data: IconThemeData(color: Colors.green),
      child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textEditingController,
              onSubmitted: _handleSubmitted,
              decoration: const InputDecoration.collapsed(
                hintText: "send a message",
              ),
            ),
          ),
      
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              onPressed: () {
                _handleSubmitted(_textEditingController.text);
              },
              icon: const Icon(Icons.send)),
          )
        ],
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (context, index) {
            return _messages[index];
          },
          itemCount: _messages.length,
          ),
        ),
        const Divider(height: 1.0,),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor
          ),
          child: _textComposer(),
        )
      ],
    );
  }
}