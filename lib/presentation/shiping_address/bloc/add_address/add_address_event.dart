part of 'add_address_bloc.dart';

@freezed
class AddAddressEvent with _$AddAddressEvent {
  const factory AddAddressEvent.started() = _Started;
  const factory AddAddressEvent.addAddress({
    required String name,
    required String address,
    required String phone,
    required String provinceId,
    required String cityId,
    required String subdistricId,
    required String codePos,
    required bool isDefault,
    required String userId,
    required String provinceName,
    required String cityName,
    required String subdistrictName,

  }) = _AddAddress;
}