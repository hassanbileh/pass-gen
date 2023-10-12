import 'package:flutter/material.dart';

typedef SwitchCallBack = void Function(bool)?;

class PasswordOptions extends StatelessWidget {
  final String leading, trailing;
  final bool? has;
  final SwitchCallBack onChanged;
  const PasswordOptions({
    super.key,
     this.has,
    required this.onChanged,
    required this.leading,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              Text(
                trailing,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                child: Switch.adaptive(
                  value: has!,
                  onChanged: onChanged,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
