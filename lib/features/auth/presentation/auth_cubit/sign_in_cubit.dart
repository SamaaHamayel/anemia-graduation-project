import 'package:animeacheck/features/auth/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../core/api/endPoints/endPoint.dart';
import '../../../../core/cache_helper/cache_helper.dart';
import '../../../../core/services/service_locator.dart';
import '../../domain/repo/auth_repo.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepository authRepo;
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoginPasswordShowing = true;
  IconData suffixIcon = Icons.visibility;
  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordShowing = !isLoginPasswordShowing;
    suffixIcon =
    isLoginPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeLoginPasswordSuffixIcon());
  }

  // sign in method
  SignInModel? signInModel;
  void login() async {
    emit(SignInLoadingState());
    final result = await authRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
          (l) => emit(SignInErrorState(l)),
          (r) async {
        signInModel = r;
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
        emit(SignInSuccessState());
      },
    );
  }
}
