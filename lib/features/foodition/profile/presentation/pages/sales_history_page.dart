import 'package:flutter/material.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../../../home/domain/enums/enums.dart';
import '../../../home/domain/models/history_model.dart';
import '../../../home/presentation/widgets/history_tile.dart';

class SalesHistoryPage extends StatelessWidget {
  const SalesHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final histories = [
      HistoryModel(
        id: 'FDTN0123456789',
        name: 'Pizza Margherita',
        price: 56000,
        storeName: 'Pizza Palace',
        storeAddress: '123 Pizza Street',
        imageUrl:
            'https://assets-pergikuliner.com/uploads/bootsy/image/18948/Nasi_Padang__pergikuliner.com_.jpeg',
        date: DateTime(2023, 12, 31),
        status: HistoryStatus.done,
        rate: 4.5,
      ),
      HistoryModel(
        id: 'FDTN0123456790',
        name: 'Spaghetti Carbonara',
        price: 48000,
        storeName: 'Pasta House',
        storeAddress: '456 Pasta Lane',
        imageUrl:
            'https://assets-pergikuliner.com/uploads/bootsy/image/18948/Nasi_Padang__pergikuliner.com_.jpeg',
        date: DateTime(2023, 11, 15),
        status: HistoryStatus.deliver,
        rate: 4.8,
      ),
      HistoryModel(
        id: 'FDTN0123456791',
        name: 'Chicken Rice',
        price: 32000,
        storeName: 'Rice Delight',
        storeAddress: '789 Rice Avenue',
        imageUrl:
            'https://assets-pergikuliner.com/uploads/bootsy/image/18948/Nasi_Padang__pergikuliner.com_.jpeg',
        date: DateTime(2023, 10, 20),
        status: HistoryStatus.done,
      ),
      HistoryModel(
        id: 'FDTN0123456792',
        name: 'Burger Deluxe',
        price: 41000,
        storeName: 'Burger Junction',
        storeAddress: '101 Burger Blvd',
        imageUrl:
            'https://assets-pergikuliner.com/uploads/bootsy/image/18948/Nasi_Padang__pergikuliner.com_.jpeg',
        date: DateTime(2023, 9, 5),
        status: HistoryStatus.canceled,
      ),
      HistoryModel(
        id: 'FDTN0123456793',
        name: 'Salad Mix',
        price: 35000,
        storeName: 'Green Eats',
        storeAddress: '202 Salad Square',
        imageUrl:
            'https://assets-pergikuliner.com/uploads/bootsy/image/18948/Nasi_Padang__pergikuliner.com_.jpeg',
        date: DateTime(2023, 8, 12),
        status: HistoryStatus.pending,
      ),
      HistoryModel(
        id: 'FDTN0123456794',
        name: 'Sushi Platter',
        price: 57000,
        storeName: 'Sushi Haven',
        storeAddress: '303 Sushi Street',
        imageUrl:
            'https://assets-pergikuliner.com/uploads/bootsy/image/18948/Nasi_Padang__pergikuliner.com_.jpeg',
        date: DateTime(2023, 7, 17),
        status: HistoryStatus.deliver,
        rate: 4.9,
      ),
      HistoryModel(
        id: 'FDTN0123456795',
        name: 'Steak Dinner',
        price: 76000,
        storeName: 'Grill Masters',
        storeAddress: '404 Steak Avenue',
        imageUrl:
            'https://assets-pergikuliner.com/uploads/bootsy/image/18948/Nasi_Padang__pergikuliner.com_.jpeg',
        date: DateTime(2023, 6, 22),
        status: HistoryStatus.done,
        rate: 4.7,
      ),
      HistoryModel(
        id: 'FDTN0123456796',
        name: 'Pancake Breakfast',
        price: 21000,
        storeName: 'Morning Delights',
        storeAddress: '505 Pancake Place',
        imageUrl:
            'https://assets-pergikuliner.com/uploads/bootsy/image/18948/Nasi_Padang__pergikuliner.com_.jpeg',
        date: DateTime(2023, 5, 1),
        status: HistoryStatus.deliver,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('History Pembelian'),
      ),
      body: ListView.separated(
        itemCount: histories.length,
        separatorBuilder: (context, index) =>
            const SpaceHeight(AppDimens.spacing8pt),
        itemBuilder: (context, index) => HistoryTile(
          data: histories[index],
        ),
      ),
    );
  }
}
