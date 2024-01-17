import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../home/domain/models/product_model.dart';
import '../../../data/models/request/product_request.dart';
import '../../../domain/repositories/product_me_repository.dart';

part 'product_me_bloc.freezed.dart';
part 'product_me_event.dart';
part 'product_me_state.dart';

class ProductMeBloc extends Bloc<ProductMeEvent, ProductMeState> {
  final ProductMeRepository _repository;
  ProductMeBloc(
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
            emit(_Success(products: data));
          }
        },
      );
    });

    on<_AddProduct>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.addProduct(event.request);
      result.match(
        (error) {
          emit(_Error(message: error));
          add(const _GetData());
        },
        (data) => add(const _GetData()),
      );
    });
  }
}
