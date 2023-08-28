import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'generate_event.dart';
part 'generate_state.dart';

class GenerateBloc extends Bloc<GenerateEvent, GenerateState> {
  GenerateBloc() : super(const InitialPasswordState()) {
    on<GeneratePwd>((event, emit) {
      String generateRandomString(int len) {
        var r = Random();
        const chars =
            'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890!@\$^&';
        return List.generate(len, (index) => chars[r.nextInt(chars.length)])
            .join();
      }

      Widget _verifyStrength(String pwd) {
        if (pwd.length > 20) {
          return Container(
            height: 35.0,
            width: 400,
            color: Colors.green[400],
            child: const Center(
              child: Text(
                'Super strong password',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        } else if (pwd.length > 15) {
          return Container(
            height: 35.0,
            width: 400,
            color: Colors.blue[200],
            child: const Center(
              child: Text(
                'Strong password',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        } else if (pwd.length >= 10) {
          return Container(
            height: 35.0,
            width: 400,
            color: Colors.orange[300],
            child: const Center(
              child: Text(
                'Medium password',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        } else {
          return Container(
            height: 35.0,
            width: 400,
            color: Colors.red[300],
            child: const Center(
              child: Text(
                'Poor password',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      }

      final _generatedPwd = generateRandomString(event.length);
      final _strength = _verifyStrength(_generatedPwd);
      emit(GeneratedPasswordState(pwd: _generatedPwd, flag: _strength));
    });
  
    on<SetLength>((event, emit) {
      final length = event.length;
      emit(LengthState(length));
    });
    on<SetUpperCase>((event, emit) {
      final isUpper = event.isUpper;
      if (isUpper) {
        const  isUpper = false;
        emit(const UpperCaseState(isUpper));
      }else{
        
        const isUpper = true;
        emit(const UpperCaseState(isUpper));
      }
      
    });
    on<SetLowerdCase>((event, emit) {
      final isLower = event.isLower;
      if (isLower) {
        const  isLower = false;
        emit(const UpperCaseState(isLower));
      }else{
        
        const isLower = true;
        emit(const UpperCaseState(isLower));
      }
      emit(LowerCaseState(isLower));
    });
    on<SetNumbers>((event, emit) {
      final hasNumbers = event.hasNumbers;
      if (hasNumbers) {
        const  hasNumbers = false;
        emit(const NumbersState(hasNumbers));
      }else{
        
        const hasNumbers = true;
        emit(const NumbersState(hasNumbers));
      }
    });

    on<SetCharacter>((event, emit) {
      final hasChars = event.hasChars;
      emit(CharactersState(hasChars));
    });
  }
}
