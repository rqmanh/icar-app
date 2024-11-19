import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_lang_state.dart';

class SplashLangCubit extends Cubit<SplashLangState> {
  SplashLangCubit() : super(SplashLangInitial());
}
