import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light); 
 bool isDark = false;
  void toggleTheme() {
    isDark = !isDark;
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }
}
