part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.getData() = _GetData;
  const factory ProductEvent.doFavourite(bool value) = _DoFavourite;
}
