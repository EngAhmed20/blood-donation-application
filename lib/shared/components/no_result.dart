import 'package:flutter/cupertino.dart';

class WidgetNoResult extends StatelessWidget {
  const WidgetNoResult({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: double.infinity,
        height: height * 0.35,
        padding: const EdgeInsets.all(10.0),
        child:Image.asset('assets/images/no_result.png',width: double.infinity,),

    ),
    );
  }
}
