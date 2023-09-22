import 'package:dio/dio.dart';

class NetWorkManager    {
  late Dio _networkManager;


  NetWorkManager(){
   _networkManager=Dio();

  }
String dataContext="";
String dataWriter="";



Future<String> GetData() async{
  
final Response response= await _networkManager.get("https://api.quotable.io/quotes/random");
  if(response.statusCode==200)
  {
    dataContext=response.data[0]["content"].toString();
    dataWriter=response.data[0]["author"].toString();
     return "Done";
  }
 
 return "Fail";


}
  
}