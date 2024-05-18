import 'package:animeacheck/features/auth/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../core/api/endPoints/end_point.dart';
import '../../../../core/cache_helper/cache_helper.dart';
import '../../../../core/services/service_locator.dart';
import '../../domain/repo/auth_repo.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepository authRepo;


  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isSignUpPasswordShowing = true;
  IconData suffixIcon = Icons.visibility;


  void changeLoginPasswordSuffixIcon() {
    isSignUpPasswordShowing = !isSignUpPasswordShowing;
    suffixIcon =
    isSignUpPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeSignUpPasswordSuffixIcon());
  }


  //___signUp method_____
  SignUpModel? signUpModel;
  void signUp() async {
    emit(SignUpLoadingState());
    final result = await authRepo.signUp(
      email: signUpEmailController.text,
      password: signUpPasswordController.text,
      userName: nameController.text,
      confirmPassword: confirmPasswordController.text,
    );
    result.fold(
          (l) => emit(SignUpErrorState(l)),
          (r) async {
        signUpModel = r;
        Map<String, dynamic> decodedToken = JwtDecoder.decode(r.token);
        await sl<CacheHelper>()
            .saveData(key: ApiKeys.id, value: decodedToken[ApiKeys.id]);
        // {
        //   "id": "65721a55170b9ecc33cca09b",
        //   "email": "hadeere378@gmail.com",
        //   "name": "hadeer",
        //   "iat": 1702328960
        // }

        await sl<CacheHelper>().saveData(
          key: ApiKeys.token,
          value: r.token,
        );
        emit(SignUpSuccessState());
      },
    );
  }


}
