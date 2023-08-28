part of 'generate_bloc.dart';

@immutable
abstract class GenerateEvent {
  const GenerateEvent();
}

class GeneratePwd extends GenerateEvent {
  final int length;
  final bool isUpper;
  final bool isLower;
  final bool hasNumbers;
  final bool hasChars;

  const GeneratePwd(
    this.length,
    this.isUpper,
    this.isLower,
    this.hasNumbers,
    this.hasChars,
  );
}

class SetLength extends GenerateEvent {
  final int length;
  const SetLength(this.length);
}

class SetUpperCase extends GenerateEvent {
  final bool isUpper;
  const SetUpperCase(this.isUpper);
}

class SetLowerdCase extends GenerateEvent {
  final bool isLower;
  const SetLowerdCase(this.isLower);
}

class SetNumbers extends GenerateEvent {
  final bool hasNumbers;
  const SetNumbers(this.hasNumbers);
}

class SetCharacter extends GenerateEvent {
  final bool hasChars;
  const SetCharacter(this.hasChars);
}
