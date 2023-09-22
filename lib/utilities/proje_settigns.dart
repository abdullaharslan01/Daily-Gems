
import 'package:flutter/material.dart';
import 'package:quotenote/utilities/colors.dart';

class ProjeSettigns {

  final Icon listTileIconEdit=  Icon(Icons.edit_note_outlined);
  final Icon listTileIconRemove= Icon(Icons.delete_forever_outlined);

  final String appBarTitle="Daily Gems";
  final EdgeInsetsGeometry projeGeneralPadding=EdgeInsets.symmetric(vertical: 10, horizontal: 10);
  final  EdgeInsetsGeometry ProjeItemsPadding=EdgeInsets.only(top: 10);

  final double noteCardHeigh=0.15;
  final double noteCardElevation=4;
  final ShapeBorder noteCardShape=RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
  final EdgeInsetsGeometry noteCardPadding=EdgeInsets.all(10);
  final double noteCardWidth= double.infinity;
  final Color noteCardBackgroundColor=Colors.white;
  final TextStyle noteCardTextStyle=TextStyle();

  final double writerCardHeigh=50;
  final double writerCardElevation=4;
  final ShapeBorder writerCardShape=RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
  final EdgeInsetsGeometry writerCardPadding=EdgeInsets.all(10);
  final double writerCardWidth= 180;
  final Color writerCardBackgroundColor=Colors.brown.shade50;
  final TextStyle writerCardTextStyle=TextStyle();

  final Color buttonSaveBackgroundColor= backgroundColors[2];
  final Color buttonSaveForeGroundColor=Colors.black; 
  final double buttonSaveTextSize=18;
  final String buttonSaveText="Save";



  final Color buttonChangeBackgroundColor= backgroundColors[4];
  final Color buttonChangeForeGroundColor=Colors.black; 
  final double buttonChangeTextSize=18;
  final String buttonChangeText="Change";


}