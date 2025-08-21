import 'package:chat_app_example/models/massege.dart';
import 'package:chat_app_example/utils/bot_responses.dart';
import 'package:chat_app_example/widegets/massage_input.dart';
import 'package:chat_app_example/widegets/message_bubble.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.title});

  final String title;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> _messages = [];

  void _sendMessage(String text) {
    setState(() {
      _messages.add(Message(text: text, isUser: true));
    });

    // Botの返信（ランダム）
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _messages.add(Message(text: getRandomBotResponse(), isUser: false));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (ctx, i) => MessageBubble(message: _messages[i]),
            ),
          ),
          MessageInput(onSend: _sendMessage),
        ],
      ),
    );
  }
}
