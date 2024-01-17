part of 'product_me_bloc.dart';

@freezed
class ProductMeEvent with _$ProductMeEvent {
  const factory ProductMeEvent.getData() = _GetData;
  const factory ProductMeEvent.addProduct(ProductRequest request) = _AddProduct;
}
