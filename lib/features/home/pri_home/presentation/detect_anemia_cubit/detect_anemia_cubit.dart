
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'detect_anemia_state.dart';

class DetectAnemiaCubit extends Cubit<DetectAnemiaState> {
  DetectAnemiaCubit() : super(DetectAnemiaInitial());

  XFile? image;


  //!!take image from user
  void takeImage(value){
    image=value;
    emit(TakeImageFromUserState());
  }



}
