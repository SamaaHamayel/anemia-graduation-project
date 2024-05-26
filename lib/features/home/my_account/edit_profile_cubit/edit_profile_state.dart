abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}


class EditProfileImageSuccessState extends EditProfileState {
  get image => null;
}

class EditProfileImageLoadingState extends EditProfileState {}

class EditProfileImageErrorState extends EditProfileState {}




class EditProfileImagePickedState extends EditProfileState {}
