import 'package:flutter/material.dart';

import '../../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';
import '../../domain/models/menu_model.dart';
import '../widgets/widgets.dart';

class MenuListPage extends StatelessWidget {
  const MenuListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final menuList = [
      MenuModel(
        active: true,
        status: 'Aktif',
        price: 25000,
        name: 'Nasi Goreng',
        stock: 10,
        category: 'Makanan',
        type: 'Berbayar',
        imageUrl:
            'https://asset.kompas.com/crops/B_DV5V6k-8yyl8Z9daS3hb6E3_M=/0x0:739x493/750x500/data/photo/2020/07/28/5f1fdcdacafc4.jpg',
      ),
      MenuModel(
        active: true,
        status: 'Aktif',
        price: 15000,
        name: 'Es Teh',
        stock: 20,
        category: 'Minuman',
        type: 'Gratis',
        imageUrl:
            'https://asset.kompas.com/crops/B_DV5V6k-8yyl8Z9daS3hb6E3_M=/0x0:739x493/750x500/data/photo/2020/07/28/5f1fdcdacafc4.jpg',
      ),
      MenuModel(
        active: false,
        status: 'TidakAktif',
        price: 30000,
        name: 'Ayam Goreng',
        stock: 15,
        category: 'Makanan',
        type: 'Berbayar',
        imageUrl:
            'https://asset.kompas.com/crops/B_DV5V6k-8yyl8Z9daS3hb6E3_M=/0x0:739x493/750x500/data/photo/2020/07/28/5f1fdcdacafc4.jpg',
      ),
      MenuModel(
        active: false,
        status: 'TidakAktif',
        price: 10000,
        name: 'Air Putih',
        stock: 30,
        category: 'Minuman',
        type: 'Gratis',
        imageUrl:
            'https://asset.kompas.com/crops/B_DV5V6k-8yyl8Z9daS3hb6E3_M=/0x0:739x493/750x500/data/photo/2020/07/28/5f1fdcdacafc4.jpg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Menu'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.separated(
        padding: PaddingAll.spacing20pt,
        separatorBuilder: (context, index) =>
            const SpaceHeight(AppDimens.spacing16pt),
        itemCount: menuList.length,
        itemBuilder: (context, index) => MenuTile(
          data: menuList[index],
        ),
      ),
    );
  }
}
