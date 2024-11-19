
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// LanguageCubit states
class LanguageState extends Equatable {
  final String selectedLanguage;
  
  const LanguageState(this.selectedLanguage);

  @override
  List<Object?> get props => [selectedLanguage];
}

// LanguageCubit to handle language selection
class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageState('ar'));

  // Update the selected language
  void selectLanguage(String language) {
    emit(LanguageState(language));
  }
}
