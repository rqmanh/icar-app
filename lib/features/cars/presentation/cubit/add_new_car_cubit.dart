import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';



part 'add_new_car_state.dart';

// Define the Cubit class for managing images
class AddNewCarCubit extends Cubit<AddNewCarState> {
  AddNewCarCubit() : super(AddNewCarState());

  void pickImages() async {
    // Logic to pick images
    final pickedImages = await ImagePicker().pickMultiImage();
    if (pickedImages != null) {
      emit(state.copyWith(
        pickedImages: [...state.pickedImages, ...pickedImages.map((e) => File(e.path))],
      ));
    }
  }

  void removeNewImage(int index) {
    final updatedImages = [...state.pickedImages];
    updatedImages.removeAt(index);
    emit(state.copyWith(pickedImages: updatedImages));
  }

  void removeExistingImage(int index) {
    final updatedImages = [...state.existingImages];
    updatedImages.removeAt(index);
    emit(state.copyWith(existingImages: updatedImages));
  }
}

