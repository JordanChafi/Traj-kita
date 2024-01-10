import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<String> notifications = [
    'Notification 1',
    'Notification 2',
    'Notification 3',
    'Notification 4',
    'Notification 5',
    'Notification 6',
    'Notification 7',
    'Notification 8',
    'Notification 9',
    'Notification 10',
  ];

  final List<String> notificationContents = [
    'Contenu de la notification 1',
    'Contenu de la notification 2',
    'Contenu de la notification 3',
    'Contenu de la notification 4',
    'Contenu de la notification 5',
    'Contenu de la notification 6',
    'Contenu de la notification 7',
    'Contenu de la notification 8',
    'Contenu de la notification 9',
    'Contenu de la notification 10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final now = DateTime.now();
          final notificationDate = now.subtract(Duration(days: index));

          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  notifications[index],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  notificationDate.isAfter(now.subtract(Duration(days: 1)))
                      ? DateFormat.Hm().format(notificationDate)
                      : notificationDate
                              .isAtSameMomentAs(now.subtract(Duration(days: 1)))
                          ? 'Hier'
                          : DateFormat('dd/MM/yyyy').format(notificationDate),
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            subtitle: Text(
              notificationContents[index],
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              // Ajoutez l'action à effectuer lorsqu'une notification est cliquée
            },
          );
        },
      ),
    );
  }
}
