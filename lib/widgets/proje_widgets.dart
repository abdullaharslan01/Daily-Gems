import 'package:flutter/material.dart';

class ProjeCardDesign extends StatelessWidget {
  const ProjeCardDesign({
    super.key, required this.child, required this.cardHeigh, required this.cardElevation, required this.cardShape, required this.cardChildPaddig, required this.cardWidth, required this.backgroundColor,
  }) ;

  final Widget child;
  final double cardHeigh; 
  final double cardWidth ;
  final double cardElevation;
  final ShapeBorder cardShape;
  final EdgeInsetsGeometry cardChildPaddig;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox( 
    height:cardHeigh , width: cardWidth,
    child: Card(
      color: backgroundColor,
      clipBehavior: Clip.antiAliasWithSaveLayer, 
      elevation: cardElevation, 
      semanticContainer: true,
      shape: cardShape,
      child: Padding(
        padding:  cardChildPaddig,
        child: SingleChildScrollView(child: child
        ),
      ),
      
    ),
              );
  }
}

// ignore: must_be_immutable
class ProjeButton extends StatelessWidget {
   ProjeButton({
    super.key, this.buttonOnTap, required this.buttonBackgroundColor, required this.buttonForeGroundColor, required this.buttonTextFontSize, required this.buttonText, this.buttonFontWeigh =FontWeight.normal
  });

  final Function()? buttonOnTap;
  final Color buttonBackgroundColor;
  final Color buttonForeGroundColor; 
  final double buttonTextFontSize;
  final String buttonText;
  FontWeight buttonFontWeigh;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      
      style: TextButton.styleFrom(
        elevation: 5,
        backgroundColor: buttonBackgroundColor, 
        fixedSize: Size(100, 50),
        shape: StadiumBorder()
      ),
      onPressed:buttonOnTap, child: Text(buttonText, style: TextStyle(color: buttonForeGroundColor, fontSize: buttonTextFontSize, fontWeight: buttonFontWeigh),));
  }
}
