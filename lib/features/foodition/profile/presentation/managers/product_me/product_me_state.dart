part of 'product_me_bloc.dart';

@freezed
class ProductMeState with _$ProductMeState {
  const factory ProductMeState.initial() = _Initial;
  const factory ProductMeState.loading() = _Loading;
  const factory ProductMeState.empty() = _Empty;
  const factory ProductMeState.success({
    required List<ProductModel> products,
  }) = _Success;
  const factory ProductMeState.error({
    required String message,
  }) = _Error;
}
