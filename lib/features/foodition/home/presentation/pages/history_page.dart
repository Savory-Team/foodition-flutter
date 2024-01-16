import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../managers/transaction/transaction_bloc.dart';
import '../widgets/history_tile.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TransactionBloc>().add(const TransactionEvent.getData());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('History Pembelian'),
      ),
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) => state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loading: () => const CustomShimmerList(length: 3),
          empty: () => const EmptyState(),
          error: (message) => ErrorState(
            message: message,
            onRefresh: () => context
                .read<TransactionBloc>()
                .add(const TransactionEvent.getData()),
          ),
          success: (histories) => ListView.separated(
            itemCount: histories.length,
            separatorBuilder: (context, index) =>
                const SpaceHeight(AppDimens.spacing8pt),
            itemBuilder: (context, index) => HistoryTile(
              data: histories[index],
            ),
          ),
        ),
      ),
    );
  }
}
