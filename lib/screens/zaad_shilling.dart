// import 'package:city_guide/json/daily_json.dart';
// import 'package:city_guide/json/day_month.dart';
// import 'package:city_guide/theme/colors.dart';
// import 'package:flutter/material.dart';
//
// class DailyPage extends StatefulWidget {
//   const DailyPage({Key? key}) : super(key: key);
//
//   @override
//   _DailyPageState createState() => _DailyPageState();
// }
//
// class _DailyPageState extends State<DailyPage> {
//   int activeDay = 4;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white.withOpacity(0.5),
//       body: getBody(),
//     );
//   }
//
//   Widget getBody() {
//     var size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(color: Colors.white, boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.01),
//                 spreadRadius: 10,
//                 blurRadius: 3,
//               )
//             ]),
//             child: Padding(
//               padding:
//                   const EdgeInsets.only(top: 20, bottom: 15, left: 20, right: 20),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Daily Trans",
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.lightBlue),
//                       ),
//                       Icon(Icons.search),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: List.generate(days.length, (index) {
//                         return GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 activeDay = index;
//                               });
//                             },
//                             child: Container(
//                               width: (size.width - 40) / 7,
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     days[index]['label'],
//                                     style: TextStyle(fontSize: 11),
//                                   ),
//                                   SizedBox(height: 10),
//                                   Container(
//                                     width: 25,
//                                     height: 25,
//                                     decoration: BoxDecoration(
//                                         color: activeDay == index
//                                             ? primary
//                                             : Colors.transparent,
//                                         shape: BoxShape.circle,
//                                         border: Border.all(
//                                             color: activeDay == index
//                                                 ? primary
//                                                 : black.withOpacity(0.1))),
//                                     child: Center(
//                                       child: Text(
//                                         days[index]['day'],
//                                         style: TextStyle(
//                                             fontSize: 10,
//                                             color: activeDay == index
//                                                 ? white
//                                                 : black),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ));
//                       })),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               child: Column(
//                   children: List.generate(daily.length, (index) {
//                 return Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           width: (size.width - 40) * 0.7,
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 50,
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                     color: white.withOpacity(0.1),
//                                     shape: BoxShape.circle),
//                                 child: Center(
//                                   child: Image.asset(
//                                     daily[index]['icon'],
//                                     width: 30,
//                                     height: 30,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 15,
//                               ),
//                               Container(
//                                 width: (size.width - 90) * 0.5,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       daily[index]['name'],
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           color: black,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       daily[index]['date'],
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           color: black.withOpacity(0.5),
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Container(
//                           width: (size.width - 40) * 0.3,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Text(
//                                 daily[index]['price'],
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w600,
//                                     color: green),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         left: 65,
//                         top: 5,
//                       ),
//                       child: Divider(
//                         thickness: 0.8,
//                       ),
//                     )
//                   ],
//                 );
//               }))),
//           SizedBox(
//             height: 15,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20),
//             child: Row(
//               children: [
//                 Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 80),
//                   child: Text(
//                     "Total",
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: black),
//                   ),
//                 ),
//                 Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 80),
//                   child: Text(
//                     daily[4]['price'],
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: black),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sms/sms.dart';

class MyInbox1 extends StatefulWidget {
  const MyInbox1({Key? key}) : super(key: key);

  @override
  State createState() {
    return MyInboxState();
  }
}

class MyInboxState extends State {

  SmsQuery query = SmsQuery();
  List<SmsMessage> messages =  <SmsMessage>[];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("E-DAHAB SHILLING"),
      //   backgroundColor: Colors.pink,
      // ),
      body: FutureBuilder(
        future: fetchSMS(),
        builder: (context, snapshot) {
          return ListView.separated(

              separatorBuilder: (context, index) => const Divider(
                color: Colors.black,
                height: 1,
                thickness: 0.8,
                indent: 35,
                endIndent: 35,
              ),
              //itemCount: messages.length,// shows all messages
              itemCount: messages.length<10? messages.length:20,//show latest 20 messages
              itemBuilder: (context, index) {
                return
                  Slidable(actionPane: const SlidableStrechActionPane(),
                    actionExtentRatio: 0.15,
                    child:
                    // Padding(
                    // padding: const EdgeInsets.all(8.0),
                    ListTile(
                      leading: const Icon(
                        Icons.monetization_on_outlined,
                        color: Colors.black,
                      ),
                      title: Text(messages[index].address,style: const TextStyle(
                        color: Colors.black,fontWeight: FontWeight.bold,
                      ),),
                      isThreeLine: true,
                      trailing: const Icon(

                          Icons.format_list_numbered_sharp
                      ),
                      subtitle: Text(
                        messages[index].body,
                        maxLines: 4,
                        style: const TextStyle(color: Colors.black87),
                      ),

                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: "Delete",
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: (){},

                      )

                    ],
                    secondaryActions: [
                      IconSlideAction(
                        caption: "Move to..",
                        color: Colors.lightGreen,
                        icon: Icons.arrow_forward,
                        onTap: (){},

                      ),
                      IconSlideAction(
                        caption: "Archive",
                        color: Colors.lightBlue,
                        icon: Icons.archive,
                        onTap: (){},

                      )
                    ],
                  );

              });
        },
      ),
    );
  }

  fetchSMS() async {
    //messages = await query.getAllSms;
    messages = await query.querySms(address:'222');
    //messages = await query.querySms(address:"898");
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
