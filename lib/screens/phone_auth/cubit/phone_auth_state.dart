part of 'phone_auth_cubit.dart';

@immutable
abstract class PhoneAuthState {}

class PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthSendOtp extends PhoneAuthState {}

class PhoneAuthSendOtpSuccess extends PhoneAuthState {}

class PhoneAuthSendOtpFailure extends PhoneAuthState {}

class PhoneAuthOtpVerify extends PhoneAuthState {}

class PhoneAuthOtpVerifySuccess extends PhoneAuthState {}

class PhoneAuthOtpVerifyFailure extends PhoneAuthState {}

class PhoneAuthLogout extends PhoneAuthState {}

class PhoneAuthLogoutSuccess extends PhoneAuthState {}

class PhoneAuthLogoutFailure extends PhoneAuthState {}
