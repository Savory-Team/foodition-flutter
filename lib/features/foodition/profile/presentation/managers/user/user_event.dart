part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.getData() = _GetData;
  const factory UserEvent.editAddress(AddressRequest request) = _EditAddress;
  const factory UserEvent.editPhotoProfile(File image) = _EditPhotoProfile;
  const factory UserEvent.editPassword(PasswordRequest request) = _EditPassword;
  const factory UserEvent.editUsername(String username) = _EditUsername;
  const factory UserEvent.editName(String name) = _EditName;
  const factory UserEvent.editBio(String bio) = _EditBio;
  const factory UserEvent.editPhoneNumber(String phoneNumber) =
      _EditPhoneNumber;
  const factory UserEvent.editGender(String gender) = _EditGender;
  const factory UserEvent.editBirthdate(DateTime birthdate) = _EditBirthdate;
}
