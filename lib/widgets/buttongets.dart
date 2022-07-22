import 'package:flutter/cupertino.dart';

class ButtonGet extends StatelessWidget {
  final Color bgrcolor;
  final String text;
  final Color textColor;

   ButtonGet({Key? key,
     required this.bgrcolor,
     required this.text,
     required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height/14,
      decoration: BoxDecoration(
        color: bgrcolor,
        borderRadius: BorderRadius.circular(40)
      ),
      child: Center(
        child: Text(text, style: TextStyle(
        fontSize: 20, color: textColor
      ),)
      ),

    );
  }
}
