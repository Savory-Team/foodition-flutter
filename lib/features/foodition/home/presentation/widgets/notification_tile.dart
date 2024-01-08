import 'package:flutter/material.dart';

import '../../../../../components/components.dart';
import '../../domain/models/models.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel data;
  const NotificationTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: data.type.icon,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomText.h7(data.type.value),
              const Spacer(),
              CustomText.h7(data.dateFormat),
            ],
          ),
          CustomText.h5(data.label),
          CustomText.h7(data.message),
        ],
      ),
    );
  }
}
