import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quotenote/services/dio.dart';
import 'package:quotenote/models/model.dart';
import 'package:quotenote/services/shared_pref_manager.dart';
import 'package:quotenote/utilities/colors.dart';
import 'package:quotenote/utilities/proje_settigns.dart';
import 'package:quotenote/widgets/proje_widgets.dart';
import 'package:uuid/uuid.dart';


enum StateUpdateInsert{update,insert}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  bool dataLoadingState=false; 
  ProjeSettigns settigns=ProjeSettigns();
  NetWorkManager _netWorkManager=NetWorkManager();
  late final SharedManager _sharedManager;

@override
  void initState() {
    super.initState();
  _initStateSharedPreferences();
  }

  _initStateSharedPreferences() async {
    _sharedManager = SharedManager();
   await _sharedManager.initStateSharedPreferences();
    LoadData();
  }


DataLoadingChange() {
  setState(() {
    dataLoadingState=!dataLoadingState;
  });
}


 Color getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }
 
String dataContext="Please click change Button";
String dataWriter="Unknown";


  Future<void> GetDataFromNetworkManager() async{ 
  
  // I used Provider but I had a lot of problems updating the data, unfortunately I have to reload the page for now.
  DataLoadingChange();
try {
  
  String result= await _netWorkManager.GetData();
  print(result);
  if(result=="Done") {
    dataContext=_netWorkManager.dataContext;
    dataWriter=_netWorkManager.dataWriter;

  }
  
  
} catch (e) {
    dataContext = "There is no internet connection. Please control your internet connection and try again."; 
    dataWriter = "Error"; 
}
finally{
     DataLoadingChange();}}



String getId()

{
  return Uuid().v1();
}



  List<Note> _notes=[];


// if there is same value as the current vaule in the list then I don't permit to add a list. 
  SaveData(StateUpdateInsert expresState) async {
  if (expresState == StateUpdateInsert.insert &&
      !_notes.any((note) =>

          note.dataContext == _netWorkManager.dataContext &&
          note.dataWriter == _netWorkManager.dataWriter)) {
    _notes.add(Note(
        id: getId(),
        colorValue:getRandomColor().value.toString(),
        dataContext: _netWorkManager.dataContext,
        dataWriter: _netWorkManager.dataWriter, 
        ));
  }

  var cacheNotesJson =
      _notes.map((notes) => notes.toJson()).toList();
  await _sharedManager.saveData(
      DataKeys.notes, jsonEncode(cacheNotesJson));
  LoadData();
}

LoadData() {
  var datas= _sharedManager.getData(DataKeys.notes);
  if(datas !=null){
    _notes= (jsonDecode(datas) as List).map((notes) =>Note.fromJson(notes)).toList();
  }
  refleshScreen();
}


refleshScreen(){
  setState(() {
    
  });
}


DeleteData(String id) { 

  _notes.removeWhere((notes) => notes.id==id);
  SaveData(StateUpdateInsert.update);
}

UpdateData(String id){

}



  
  @override
  Widget build(BuildContext context) {

  

    return Scaffold(
      appBar: AppBar(
        leading: Center(child: 
        dataLoadingState? 
        CircularProgressIndicator(): SizedBox.shrink(),),
        title:Text(settigns.appBarTitle, style: TextStyle(color: Colors.grey.shade800),)),
      body: Padding(
        padding:  settigns.projeGeneralPadding,
        child: Column(children: [
          ProjeCardDesign(child: Text(dataContext, style: settigns.noteCardTextStyle,), cardHeigh: context.height*settigns.noteCardHeigh, cardElevation: settigns.noteCardElevation, cardShape: settigns.noteCardShape, cardChildPaddig: settigns.noteCardPadding, cardWidth:settigns.noteCardWidth,backgroundColor: settigns.noteCardBackgroundColor,), 
    
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ProjeCardDesign(child: Text(dataWriter, textAlign: TextAlign.center,), cardHeigh: settigns.writerCardHeigh, cardElevation: settigns.writerCardElevation, cardShape: settigns.writerCardShape, cardChildPaddig: settigns.writerCardPadding, cardWidth: settigns.writerCardWidth, backgroundColor: settigns.writerCardBackgroundColor,),
            ],
          ),
    
          Padding(
            padding: settigns.ProjeItemsPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  ProjeButton(buttonBackgroundColor: settigns.buttonSaveBackgroundColor, buttonForeGroundColor: settigns.buttonSaveForeGroundColor, buttonTextFontSize: settigns.buttonSaveTextSize, buttonText: settigns.buttonSaveText, buttonOnTap: (){
                    SaveData(StateUpdateInsert.insert);
                  },), 
          
                 ProjeButton(buttonBackgroundColor: settigns.buttonChangeBackgroundColor, buttonForeGroundColor: settigns.buttonChangeForeGroundColor, buttonTextFontSize: settigns.buttonChangeTextSize, buttonText: settigns.buttonChangeText, buttonOnTap: ()  {
               
                  GetDataFromNetworkManager();
               
             
    
                 },), 
    
                 
            ],),
          ), 
          SizedBox(height: 20,),
        Expanded(child:      
          ListView.builder(
            
          itemCount: _notes.length,
            
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                 color: Color(0Xff + int.parse(_notes[index].colorValue.toString())),

                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),   
                child: ListTile(
                  

                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 80,
                        
                        child: SingleChildScrollView(
                        
                        
                        
                        child: Text(_notes[index].dataContext.toString(),)),
                      ),
                    ],
                  ),
                
                subtitle: Text(_notes[index].dataWriter.toString()), 
              
                leading: Text((index+1).toString(), style: TextStyle(fontSize: 18),),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    // I am going to add edit button after.
                    IconButton(onPressed: (){
                      DeleteData(_notes[index].id.toString());
                    }, icon: settigns.listTileIconRemove),
                  ],
                ),
                
                ));
            },))
    
          
        ],),
      ),
    );
  }
}






extension BuildContextExtension on BuildContext{
  
  double get width {
    return MediaQuery.of(this).size.width;  
    
    }

    double get height {
    return MediaQuery.of(this).size.height;  
    
    }

}