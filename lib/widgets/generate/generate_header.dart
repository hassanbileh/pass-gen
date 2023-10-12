import 'package:flutter/material.dart';

typedef VerifyRobustess = Widget Function(String?);

class GeneratePasswordHeader extends StatelessWidget {
  final String? generatedPwd;
  const GeneratePasswordHeader({
    super.key,
    required this.generatedPwd,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        height: MediaQuery.sizeOf(context).height * 0.15,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'GENERATED PASSWORD',
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(.0),
                      color: Colors.grey.shade300),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      generatedPwd ?? 'ex : cjnKOPnj&D!23Tr',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: generatedPwd != null
                            ? Colors.black
                            : Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: (generatedPwd != null) ? true : false,
                  child: (generatedPwd != null)
                      ? _verifyStrength(context, generatedPwd!)
                      : const Text(''),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//STRENGTH VERIFICATION

Widget _verifyStrength(BuildContext context, String pwd) {
  if (pwd.length > 20) {
    return Container(
      height: 35.0,
      width: MediaQuery.sizeOf(context).width,
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
      width: MediaQuery.sizeOf(context).width,
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
      width: MediaQuery.sizeOf(context).width,
      color: Colors.orange[300],
      child: const Center(
        child: Text(
          'Medium password',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  } else if(pwd.length > 1 && pwd.length < 10) {
    return Container(
      height: 35.0,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.red[300],
      child: const Center(
        child: Text(
          'Poor password',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }else{
    return Container();
  }
}
