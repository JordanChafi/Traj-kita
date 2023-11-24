import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trajekita/utils/constants/colors.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discussion'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: MessageScreen(),
    );
  }
}

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final List<Map<String, dynamic>> messages = [
    {'text': 'Bonjour, comment ça va ?', 'time': DateTime.now()},
    {
      'text': 'Ça va bien, merci ! Et vous ?',
      'time': DateTime.now().subtract(Duration(days: 1)),
    },
    {
      'text': 'Je vais bien aussi, merci !',
      'time': DateTime.now().subtract(Duration(days: 7)),
    },
  ];

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index]['text'];
              final time = messages[index]['time'];
              final isMe = index % 2 == 0;
              final now = DateTime.now();
              final yesterday = now.subtract(Duration(days: 1));
              final lastWeek = now.subtract(Duration(days: 7));

              String formattedTime;

              if (time.day == now.day &&
                  time.month == now.month &&
                  time.year == now.year) {
                formattedTime = DateFormat.Hm().format(time);
              } else if (time.day == yesterday.day &&
                  time.month == yesterday.month &&
                  time.year == yesterday.year) {
                formattedTime = 'Hier';
              } else if (time.isAfter(lastWeek)) {
                formattedTime = DateFormat('dd/MM/yyyy').format(time);
              } else {
                formattedTime = '';
              }

              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: isMe ? TColors.primary : TColors.darkGrey,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        message,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      formattedTime,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: 'Entrez votre message...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  // Ajoutez ici la logique d'envoi du message
                  print('Message envoyé: ${messageController.text}');
                  messageController.clear();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
