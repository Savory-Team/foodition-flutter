import 'package:flutter/material.dart';

import '../../../home/domain/enums/notification_type.dart';
import '../../../home/domain/models/notification_model.dart';
import '../../../home/presentation/widgets/notification_tile.dart';

class NotificationRestaurantPage extends StatelessWidget {
  const NotificationRestaurantPage({super.key});

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
        title: const Text('Notifikasi Restoran'),
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
