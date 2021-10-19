import 'package:sms/sms.dart';
class Method1{
  SmsQuery query = SmsQuery();
  List messages = new SmsQuery() as List;
  String numberOne ="222";
  String numberTwo ="888";
  int counOne=0;
  int countTwo=0;
  fetchSMS()async {
    try{
      print(messages.length);
      messages=await query.getAllSms;
      print(messages.length);
      for(var i = 0; i< messages.length;i++){
        if((messages[i].body).toString().contains(numberOne)){
          print("numberOne at $i");
          print(messages[i].body);
          counOne++;
        }else if ((messages[i].body).toString().contains(numberTwo)) {
          print("numberTwo found at$i");
          countTwo++;
          print(messages[i].body);

        }


      }
      print("numberOne:$counOne");
      print("numberTwo:$countTwo");
    }catch(e){
      print("error ocoured");
      print(e.toString());
    }
  }
}