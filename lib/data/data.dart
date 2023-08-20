import 'package:passgen/constants/assets/assets_constants.dart';
import 'package:passgen/models/password.dart';
import 'package:passgen/models/user.dart';

const User anonymous =
    User(id: 'anonymous', email: 'email@anonymous.com', password: 'anonymous');
const User user1 =
    User(id: 'u001', email: 'email@exemple.com', password: 'password');

const List<String> passwords = [
  'anonymous',
  'password',
];

const List<String> emails = [
  'email@anonymous.com',
  'email@exemple.com',
];

const List<Password> generatedPasswords = [
  Password(
    id: '01',
    title: 'Google',
    username: 'Hasbile',
    password: 'Hasbilbile',
    hint: 'who r u',
    imageUrl: Assets.google,
  ),

  Password(
    id: '02',
    title: 'Facebook',
    username: 'Mopreme',
    password: 'MopremeShakur',
    hint: 'who r u',
    imageUrl: Assets.facebook,
  ),

  Password(
    id: '03',
    title: 'Twitter',
    username: 'Junior',
    password: 'EzmahJunior',
    hint: 'who r u',
    imageUrl: Assets.twitter,
  ),

  Password(
    id: '04',
    title: 'PassGen',
    username: 'Charko',
    password: 'CharkoAbdoukarim',
    hint: 'who r u',
    imageUrl: Assets.logo,
  ),
];


const List<Password> perUser = [
  Password(
    id: '01',
    title: 'Google',
    username: 'Hasbile',
    password: 'Hasbilbile',
    hint: 'who r u',
    imageUrl: Assets.google,
  ),

  Password(
    id: '02',
    title: 'Facebook',
    username: 'Hasbile',
    password: 'Hasbilbile1',
    hint: 'who r u',
    imageUrl: Assets.facebook,
  ),

  Password(
    id: '03',
    title: 'Twitter',
    username: 'Hasbile',
    password: 'Hasbilbile3',
    hint: 'who r u',
    imageUrl: Assets.twitter,
  ),

  Password(
    id: '04',
    title: 'PassGen',
    username: 'Hasbile',
    password: 'Hasbilbile4',
    hint: 'who r u',
    imageUrl: Assets.logo,
  ),
];
