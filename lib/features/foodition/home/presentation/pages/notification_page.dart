import 'package:flutter/material.dart';

import '../../../../../components/state/empty_state.dart';
import '../../../../../core/core.dart';
import '../widgets/notification_tile.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
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
