import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:info_kino/themes/themes.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeData: AppTheme.darkTheme));

  void changeThem(ThemeData data) =>
      emit(ThemeState(themeData: data));
}
