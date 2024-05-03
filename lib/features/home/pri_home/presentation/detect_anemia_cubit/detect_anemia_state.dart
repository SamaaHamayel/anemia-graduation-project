abstract class DetectAnemiaState {}

class DetectAnemiaInitial extends DetectAnemiaState {}

class DetectAnemiaLoadingState extends DetectAnemiaState {}

class DetectAnemiaSuccessState extends DetectAnemiaState {}

class DetectAnemiaErrorState extends DetectAnemiaState {}
class TakeImageFromUserState extends DetectAnemiaState {}
