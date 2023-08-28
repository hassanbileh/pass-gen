part of 'generate_bloc.dart';

@immutable
abstract class GenerateState {
  const GenerateState();
}

// class InitialPwdLengthState extends GenerateState {
//   final String pwd;
//   final Widget flag;

//   const InitialPwdLengthState({
//     required this.pwd,
//     required this.flag,
//   });
// }

class LengthState extends GenerateState {
  final int length;
  const LengthState(this.length);
}

class UpperCaseState extends GenerateState {
  final bool isUpper;
  const UpperCaseState(this.isUpper);
}

class LowerCaseState extends GenerateState {
  final bool isLower;
  const LowerCaseState(this.isLower);
}

class NumbersState extends GenerateState {
  final bool hasNumbers;
  const NumbersState(this.hasNumbers);
}

class CharactersState extends GenerateState {
  final bool hasChars;
  const CharactersState(this.hasChars);
}

class GeneratedPasswordState extends GenerateState {
  final String pwd;
  final Widget flag;

  const GeneratedPasswordState({required this.pwd, required this.flag});
}

class InitialPasswordState extends GenerateState {
  final String pwd;
  final Widget flag;
  final int length;
  final bool isUpper;
  final bool isLower;
  final bool hasNumbers;
  final bool hasChars;

  const InitialPasswordState({
    this.pwd = '',
    this.flag = const Text(''),
    this.length = 0,
    this.isUpper = true,
    this.isLower = true,
    this.hasNumbers = false,
    this.hasChars = false,
  });
}
