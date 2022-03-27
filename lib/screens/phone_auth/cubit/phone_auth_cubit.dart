import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money_tracker/screens/phone_auth/repo/phone_auth_repo.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthRepo phoneAuthRepo = PhoneAuthRepo();
  PhoneAuthCubit() : super(PhoneAuthInitial());

  sendOtp(String mobileNo, onOtpSent) {
    emit(PhoneAuthSendOtp());
    try {
      phoneAuthRepo.sendOtp(mobileNo, onOtpSent).then((val) {
        emit(PhoneAuthSendOtpSuccess());
      });
    } catch (e) {
      emit(PhoneAuthSendOtpFailure());
    }
  }

  verifyOtp(String verificationId, String otp) {
    emit(PhoneAuthSendOtp());
    try {
      phoneAuthRepo.verifyOtp(verificationId, otp);
      emit(PhoneAuthOtpVerifySuccess());
    } catch (e) {
      emit(PhoneAuthOtpVerifyFailure());
    }
  }

  logout() {
    emit(PhoneAuthLogout());
    try {
      phoneAuthRepo.logOut().then((value) => emit(PhoneAuthLogoutSuccess()));
    } catch (e) {
      emit(PhoneAuthLogoutFailure());
    }
  }
}
