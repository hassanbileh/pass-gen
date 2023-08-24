import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'generate_event.dart';
part 'generate_state.dart';

class GenerateBloc extends Bloc<GenerateEvent, GenerateState> {
  GenerateBloc() : super(GenerateInitial()) {
    on<GenerateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
