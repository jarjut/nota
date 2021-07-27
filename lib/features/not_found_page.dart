import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '404 Page',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            TextButton(
              onPressed: () => VRouter.of(context).to('/'),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
