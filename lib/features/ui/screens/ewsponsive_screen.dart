import 'package:flutter/material.dart';

import '../../../utils/app_sizes.dart';

class ResponsiveExampleScreen extends StatelessWidget {
  const ResponsiveExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double padding = SizeConfig.getPadding(context, 16);
    double fontSize = SizeConfig.getFont(context, 16);
    double buttonHeight = SizeConfig.getHeight(context, 50);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Responsive Screen',
          style: TextStyle(fontSize: SizeConfig.getFont(context, 18)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            Text(
              'হ্যালো, Flutter!',
              style: TextStyle(fontSize: fontSize),
            ),
            SizedBox(height: SizeConfig.getHeight(context, 20)),
            TextField(
              decoration: InputDecoration(
                hintText: 'কিছু লিখুন',
                contentPadding: EdgeInsets.symmetric(
                  vertical: SizeConfig.getHeight(context, 12),
                  horizontal: SizeConfig.getWidth(context, 16),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.getHeight(context, 20)),
            SizedBox(
              width: double.infinity,
              height: buttonHeight,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
