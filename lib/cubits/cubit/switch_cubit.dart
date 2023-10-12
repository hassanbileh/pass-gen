import 'package:bloc/bloc.dart';


class SwitchCubit extends Cubit<bool> {
  SwitchCubit() : super(false);

  void turn() => (!state) ? emit(state == true) : emit(state == false);
}
