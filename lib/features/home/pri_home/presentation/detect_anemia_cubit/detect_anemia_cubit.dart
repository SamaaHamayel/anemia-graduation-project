import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'detect_anemia_state.dart';
import 'package:dio/dio.dart';
import 'package:animeacheck/core/api/endPoints/end_point.dart';

class DetectAnemiaCubit extends Cubit<DetectAnemiaState> {
  DetectAnemiaCubit() : super(DetectAnemiaInitial());

  XFile? image;
  dynamic data;
  // Take image from user
  void takeImage(value) {
    image = value;
    emit(TakeImageFromUserState());
  }

  Future<void> uploadImage(XFile? imageFile) async {
    if (imageFile != null) {
      image = imageFile;
      emit(DetectAnemiaImagePickedState());
    }
  }

  Future<dynamic> classifyImage(XFile imageFile) async {
    final dio = Dio();
    emit(ClassifyImageLoadingState());
    try {
      String fileName = imageFile.path.split('/').last;
      FormData formData = FormData.fromMap({
        "image":
            await MultipartFile.fromFile(imageFile.path, filename: fileName),
      });
      final response = await dio.post(
        EndPoint.anemiaModel,
        data: formData,
      );
      if (response.statusCode == 200) {
        emit(ClassifyImageSuccessState());
        data = response.data;
        print(data);
      } else {
        emit(ClassifyImageErrorState('Failed to classify image'));
        void showToast() {
          Fluttertoast.showToast(
            msg: 'Try Again in another Time!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColors.grayColor,
            textColor: AppColors.whiteColor,
            fontSize: 16.0,
          );
        }
      }
    } catch (e) {
      void showToast() {
        Fluttertoast.showToast(
          msg: 'Try Again in another Time!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.grayColor,
          textColor: AppColors.whiteColor,
          fontSize: 16.0,
        );
      }
      // log(e.toString());
      // emit(ClassifyImageErrorState('Failed to classify image: $e'));
      // throw Exception('Failed to classify image: $e');
    }
  }
}
