import 'package:flutter/material.dart';

import '../../../../../components/state/empty_state.dart';
import '../../../../../core/core.dart';
import '../../../home/presentation/widgets/notification_tile.dart';

class NotificationRestaurantPage extends StatelessWidget {
  const NotificationRestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi Restoran'),
      ),
      body: notifications.isEmpty
          ? Padding(
              padding: EdgeInsets.only(top: context.deviceHeight / 4),
              child: const EmptyState(),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: notifications.length,
              itemBuilder: (context, index) => NotificationTile(
                data: notifications[index],
              ),
            ),
    );
  }
}
