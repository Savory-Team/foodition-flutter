import 'package:flutter/material.dart';

import '../../domain/enums/enums.dart';
import '../../domain/models/models.dart';
import '../widgets/notification_tile.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      NotificationModel(
        type: NotificationType.transaction,
        label: 'Transaksi 1',
        message: 'Anda telah melakukan transaksi',
        date: DateTime.now().subtract(const Duration(seconds: 30)),
      ),
      NotificationModel(
        type: NotificationType.promotion,
        label: 'Promosi 1',
        message: 'Diskon 50% untuk produk tertentu',
        date: DateTime.now().subtract(const Duration(hours: 2)),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: notifications.length,
        itemBuilder: (context, index) => NotificationTile(
          data: notifications[index],
        ),
      ),
    );
  }
}
