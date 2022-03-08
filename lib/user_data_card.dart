import 'package:api_intregration/time_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'button.dart';
import 'display_location.dart';
import 'model.dart';





class userDataCard extends StatefulWidget {
  @override
  _userDataCardState createState() => _userDataCardState();
}

class _userDataCardState extends State<userDataCard> {
  late Future<List<Data>> futureData;
 String pickUpLocation="Floor, A162, First, Block 13D-1 Gulshan-e-Iqbal, Karachi";
  String dropLocation="Floor, A162, First, Block 13D-1 Gulshan-e-Iqbal, Karachi";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureData = fetchData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder<List<Data>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Data>? data = snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data == null ? 0 : data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        margin:  const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                        child: Container(
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffa2a2a6),
                          ),
                          margin: EdgeInsets.all(1.5),
                          child: Column(
                            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration:const BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10),),
                                  color: Color(0xff8c8c8c),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                width: 1000.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    data![index].title,
                                    style:const  TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10,horizontal:10,),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                DisplayLocation(text: "Pick up Location",location: pickUpLocation,),
                                 const SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                   Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal:10),
                                   child:TimeAndDate(title: "03:00",text: "AM",), 
                                 ),
                                 Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal:10),
                                   child:TimeAndDate(title: "03/02/2002",text: "SUN",), 
                                 ),
                                ],),
                                 const SizedBox(height: 10,),
                                DisplayLocation(text:"Drop Location",location: dropLocation,),
                                 const SizedBox(height: 10,),
                                 
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Button(text: 'Reject',onTap: (){},),
                                  Button(text:"Accept",onTap: (){},),
                                ],
                              ),
                              SizedBox(height: 10,),
                            ],),)
 
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default show a loading spinner.
                return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}

