import 'package:passgen/constants/assets/assets_constants.dart';
import 'package:passgen/models/password.dart';

const List<Password> perUser = [
  Password(
    id: '01',
    title: 'Google',
    username: 'Hasbile',
    password: 'Hasbilbile',
    hint: 'who r u',
    imageUrl: Assets.google,
    date: 'added yesterday',
  ),

  Password(
    id: '02',
    title: 'Facebook',
    username: 'Mopreme',
    password: 'MopremeShakur',
    hint: 'who r u',
    imageUrl: Assets.facebook,
    date: 'added last week',
  ),

  Password(
    id: '03',
    title: 'Twitter',
    username: 'Junior',
    password: 'EzmahJunior',
    hint: 'who r u',
    imageUrl: Assets.twitter,
    date: 'added last month',
  ),

  Password(
    id: '04',
    title: 'PassGen',
    username: 'Charko',
    password: 'CharkoAbdoukarim',
    hint: 'who r u',
    imageUrl: Assets.logo,
    date: 'added last year',
  ),
];


const List<Password> generatedPasswords = [
  Password(
    id: '01',
    title: 'Google',
    username: 'Hasbile',
    password: 'Hasbilbile',
    hint: 'who r u',
    imageUrl: Assets.google,
    date: 'generated yesterday',
  ),

  Password(
    id: '02',
    title: 'Facebook',
    username: 'Hasbile',
    password: 'Hasbilbile1',
    hint: 'who r u',
    imageUrl: Assets.facebook,
    date: 'generated last week',
  ),

  Password(
    id: '03',
    title: 'Twitter',
    username: 'Hasbile',
    password: 'Hasbilbile3',
    hint: 'who r u',
    imageUrl: Assets.twitter,
    date: 'generated last month',
  ),

  Password(
    id: '04',
    title: 'PassGen',
    username: 'Hasbile',
    password: 'Hasbilbile4',
    hint: 'who r u',
    imageUrl: Assets.logo,
    date: 'generated last year',
  ),
];
