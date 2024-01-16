import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/product_model.dart';
import '../../../domain/repositories/product_repository.dart';

part 'product_bloc.freezed.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repository;
  ProductBloc(
    this._repository,
  ) : super(const _Initial()) {
    on<_GetData>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.getProducts();
      result.match(
        (error) => emit(_Error(message: error)),
        (data) {
          if (data.isEmpty) {
            emit(const _Empty());
          } else {
            emit(_Success(
              products: data,
              favourites: data.where((element) => element.isFavourite).toList(),
            ));
          }
        },
      );
    });
  }
}
