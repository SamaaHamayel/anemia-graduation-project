import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'detect_anemia_state.dart';
import 'package:dio/dio.dart';
import 'package:animeacheck/core/api/endPoints/end_point.dart';

class DetectAnemiaCubit extends Cubit<DetectAnemiaState> {
  DetectAnemiaCubit() : super(DetectAnemiaInitial());

  XFile? image;

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

  Future<Image> classifyImage(XFile imageFile) async {
    final dio = Dio();
    emit(ClassifyImageLoadingState());
    try {
      String fileName = imageFile.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file":
            await MultipartFile.fromFile(imageFile.path, filename: fileName),
      });

      final response = await dio.post(
        EndPoint.anemiaModel,
        data: formData,
      );

      if (response.statusCode == 200) {
        emit(ClassifyImageSuccessState());
        final message = response.data['message'];
        return Image(image: AssetImage(message));
      } else {
        emit(ClassifyImageErrorState('Failed to classify image'));
        throw Exception('Failed to classify image');
      }
    } catch (e) {
      emit(ClassifyImageErrorState('Failed to classify image: $e'));
      throw Exception('Failed to classify image: $e');
    }
  }
}
