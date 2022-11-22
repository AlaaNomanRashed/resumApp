import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function() onPress;
  final bool loading;

  const MyButton({
    required this.text,
    required this.onPress,
    this.loading = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent,
        minimumSize: const Size(double.infinity, 43),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(
            color: Colors.black,
            width: 1.3,
          ),
        ),
      ),
      child: Center(
        child: !loading
            ? Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              )
            : const CircularProgressIndicator(color: Colors.black),
      ),
    );
  }
}
