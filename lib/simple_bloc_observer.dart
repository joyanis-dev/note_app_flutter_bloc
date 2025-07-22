import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {



  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
  
   
  }
  @override
  // ignore: must_call_super
  void onCreate(BlocBase bloc) {
    
  }
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('onChange: $change');
  } 
}
