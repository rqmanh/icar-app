part of 'add_new_car_cubit.dart';
class AddNewCarState {
  final List<File> pickedImages;
  final List<String> existingImages;

  AddNewCarState({
    this.pickedImages = const [],
    this.existingImages = const [],
  });

  AddNewCarState copyWith({
    List<File>? pickedImages,
    List<String>? existingImages,
  }) {
    return AddNewCarState(
      pickedImages: pickedImages ?? this.pickedImages,
      existingImages: existingImages ?? this.existingImages,
    );
  }
}