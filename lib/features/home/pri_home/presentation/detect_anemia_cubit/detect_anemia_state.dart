abstract class DetectAnemiaState {}

class DetectAnemiaInitial extends DetectAnemiaState {}

class DetectAnemiaLoadingState extends DetectAnemiaState {}

class DetectAnemiaSuccessState extends DetectAnemiaState {}

class DetectAnemiaErrorState extends DetectAnemiaState {}
class TakeImageFromUserState extends DetectAnemiaState {}

class ClassifyImageLoadingState extends DetectAnemiaState {}

class ClassifyImageSuccessState extends DetectAnemiaState {}

class ClassifyImageErrorState extends DetectAnemiaState {
  final String message;

  ClassifyImageErrorState(this.message);

}

class DetectAnemiaImageSelectedState extends DetectAnemiaState {}
class DetectAnemiaImagePickedState extends DetectAnemiaState {}
