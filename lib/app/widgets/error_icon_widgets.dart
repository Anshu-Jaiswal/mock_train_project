import 'package:flutter/material.dart';

class ErrorIconWidget extends StatelessWidget {
  const ErrorIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/img/error_icon.png",
          width: MediaQuery.of(context).size.width * 0.6,
        ),
        Text(
          "Some Issue",
          style: TextStyle(fontSize: Theme.of(context).textTheme.headline6?.fontSize),
        )
      ],
    ));
  }
}
