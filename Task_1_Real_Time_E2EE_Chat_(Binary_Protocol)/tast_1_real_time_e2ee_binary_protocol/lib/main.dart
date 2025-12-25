import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Time E2EE Chat App',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Chat'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _messages_Test {
  final String text;
  final bool isMe;
  _messages_Test({required this.text, required this.isMe});
}


class _MyHomePageState extends State<MyHomePage> {

  final List<_messages_Test> message = [
    _messages_Test(text: "Hello", isMe: false),
    _messages_Test(text: "Hi! How are you?", isMe: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1B202D
        ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B202D
        ),
        title: Text(widget.title,style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            reverse: true,
            padding: const EdgeInsets.all(8),
            itemCount: message.length,
              itemBuilder: (context, index){
              final msg = message[index];
              return Align(
                alignment: msg.isMe ? Alignment.centerLeft : Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.all(12),
                  constraints: const BoxConstraints(maxWidth: 280),
                  decoration: BoxDecoration(
                    color: msg.isMe ? Color(0x353B4AFF) : Color(0xFF747691),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Text(msg.text,
                  style: TextStyle(
                    color: msg.isMe ? Colors.white : Colors.black
                  ),),
                ),

              );

              }))


        ],
      )
    );
  }
}
