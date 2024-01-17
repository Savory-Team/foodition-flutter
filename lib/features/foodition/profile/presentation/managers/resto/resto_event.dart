part of 'resto_bloc.dart';

@freezed
class RestoEvent with _$RestoEvent {
  const factory RestoEvent.getData() = _GetData;
  const factory RestoEvent.editResto(RestoRequest request) = _EditResto;
  const factory RestoEvent.editAddress(AddressRequest request) = _EditAddress;
  const factory RestoEvent.editPhotoResto(File image) = _EditPhotoResto;
}
