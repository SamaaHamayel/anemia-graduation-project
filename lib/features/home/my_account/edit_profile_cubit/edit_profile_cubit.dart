
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  XFile? image;

  // Take image from user
  void editImage(value) {
    image = value;
    emit(EditProfileImageSuccessState());
  }


  Future<void> uploadImage(XFile? imageFile) async {
    if (imageFile != null) {
      image = imageFile;
      emit(EditProfileImagePickedState());
    }
  }



}
