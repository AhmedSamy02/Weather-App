import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  NoWeatherBody({
    required this.hasError,
    Key? key,
  }) : super(key: key);
  bool hasError;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              textAlign: TextAlign.center,
              !hasError
                  ? 'there is no weather 😔 start\nsearching now 🔍'
                  : 'City not found 😔',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
