
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repo/auth_repo.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());

  final AuthRepository authRepo;

  GlobalKey<FormState> sendCodeKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void sendCode() async {
    emit(SendCodeLoading());
    final result = await authRepo.sendCode(emailController.text);
    result.fold((l) => emit(SendCodeError(l)), (r) => emit(SendCodeSuccess(r)));
  }




  //reset password (create new password) Logic
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();


  //* new password text form field
  TextEditingController newPasswordController = TextEditingController();
  bool isNewPasswordShowing = true;
  IconData newPasswordSuffixIcon = Icons.visibility;
  void changeNewPasswordSuffixIcon() {
    isNewPasswordShowing = !isNewPasswordShowing;
    newPasswordSuffixIcon =
    isNewPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeNewPasswordSuffixIcon());
  }

  //!!!confirm password text form field
  TextEditingController confirmPasswordController = TextEditingController();
  bool isConfirmPasswordShowing = true;
  IconData confirmPasswordSuffixIcon = Icons.visibility;
  void changeConfirmPasswordSuffixIcon() {
    isConfirmPasswordShowing = !isConfirmPasswordShowing;
    confirmPasswordSuffixIcon =
    isConfirmPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeConfirmPasswordSuffixIcon());
  }

//!!! verify Code
  TextEditingController codeController = TextEditingController();

  //!!!! method change password & send & recives & confirm code,email
  void resetPassword() async {
    emit(ResetPasswordLoadingState());
    final result = await authRepo.resetPassword(
        email: emailController.text,
        password: newPasswordController.text,
        confirmPassword: confirmPasswordController.text,
        code: codeController.text);
    result.fold((l) => emit(ResetPasswordErrorState(l)),
            (r) => emit(ResetPasswordSuccessState(r)));
  }


}
