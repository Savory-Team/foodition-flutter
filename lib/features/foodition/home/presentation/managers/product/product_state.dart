part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.empty() = _Empty;
  const factory ProductState.success({
    required List<ProductModel> products,
    required List<ProductModel> favourites,
  }) = _Success;
  const factory ProductState.error({
    required String message,
  }) = _Error;
}
