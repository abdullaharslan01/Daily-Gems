class Note{
  String ? id;
  String ? dataContext;
  String ? dataWriter;
  String ? colorValue;
  
 Note({this.id, this.dataContext, this.dataWriter, this.colorValue}); 

Map<String,dynamic> toJson(){
  return {"id":this.id, "dataContext":this.dataContext, "dataWriter":this.dataWriter, "colorValue": this.colorValue};
}

Note.fromJson(Map<String,dynamic> jsonFile){
  this.id=jsonFile["id"];
  this.dataContext=jsonFile["dataContext"];
  this.dataWriter=jsonFile["dataWriter"];
  this.colorValue=jsonFile["colorValue"];
}

}