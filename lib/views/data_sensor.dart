import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacheck/pageNavigator.dart';
import 'package:vitacheck/provider/Database/db_provider.dart';
import 'package:vitacheck/provider/dark_theme_provider.dart';
import 'package:vitacheck/views/graph.dart';
import '../provider/sensor_provider.dart';
import '../widgets/Sensor_Data.dart';
import '../widgets/bottom_navigation..dart';

  enum MenuItem{
logOut,Dark_theme,Graph
  }
class SensorHome extends StatelessWidget {



  const SensorHome({super.key});

  @override
  Widget build(BuildContext context) {
    SensorDataApi sensorData1 = context.watch<SensorDataApi>();
    DarkThemeProvider darkTheme = DarkThemeProvider();
    

    return StreamBuilder<Map>(
        stream: sensorData1.initStream(),
        initialData:{},
        builder: (context, snapshot) {
          if (snapshot.hasData && sensorData1.sensorData1.isNotEmpty) {
            
            return Scaffold(
              // bottomNavigationBar: const BottomNavigation(
              //   selectedIndex: 4,
              // ),
              appBar: AppBar(
                       iconTheme: IconThemeData(color: const Color(0xFF3E64FF),),

                scrolledUnderElevation: 0,
                elevation: 0,
                backgroundColor: Colors.white70,
                title: Row(
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Hello,Welcome ",
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF3E64FF),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                actions: [
             
                  PopupMenuButton<MenuItem>(
                    onSelected: (MenuItem value ){
                      if (value==MenuItem.logOut){

DatabaseProvider().logOut(context);
                      }
                      else if(value ==MenuItem.Dark_theme){
                        darkTheme.setdarktheme(true);
                      }
                      else if(value==MenuItem.Graph){
pageNavigator(ctx:context).nextPageOnly(page:Graph());
                      }

                    },
                    icon: Image.asset("images/doc1.png"),iconSize: 50,itemBuilder: (context)=>[
                    PopupMenuItem(
                     
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [ 
        Icon(Icons.add_chart,color: Color(0xFF3E64FF),),
          Text('Graph')]),)
      , 
      PopupMenuItem( value:MenuItem.logOut ,
        child:
       Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [ 

                        Icon(Icons.exit_to_app,color: Color(0xFF3E64FF),),
          Text('Sign OUT'),],),)
                  ])
                  // ),
                //   ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                
                    const SizedBox(
                      height: 15,
                    ),
                 
                    const Text(
                      "Your Health data",
                      style: TextStyle(
                          fontSize: 28,
                          color: Color(0xFF3E64FF),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    sensorData(
                      color: const Color(0xFF3E64FF),
                      text: "Your temperature",
                      outlineColor: Colors.black,

                      positionIcon: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 30),
                        child: Image.asset("images/temperature.png"),
                      ),
                     
                      data: sensorData1.sensorData1['SensorData']=="no Data found"
                          ?
                          "--"
                          : 
                           "${
                                
                              sensorData1.sensorData1['SensorData']["Temp"]} °C"
                          ,
                      fontcolor: Colors.white,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    sensorData(
                      sized_height: 20,
                      color: Colors.white,
                      text: "Blood Pressure",
                      data: sensorData1.sensorData1['SensorData']=="no Data found"
                          ? 
                           "--"
                          :
                          "${
                     
                              sensorData1.sensorData1['SensorData']["Bmp"]} Bmp"
                           ,
                      outlineColor: Colors.transparent,
                      positionIcon: Padding(
                        padding: const EdgeInsets.only(
                          top: 45,
                          left: 10,
                          right: 10,
                        ),
                        child: Image.asset("images/bloodpressure.png"),
                      ),
                      fontcolor: Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    sensorData(
                      color: const Color(0xFF3E64FF),
                      text: "Weight",
                      outlineColor: Colors.black,
                      positionIcon: Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 30, right: 30),
                        child: Image.asset("images/weight.png"),
                      ),
                     
                      data: sensorData1.sensorData1['SensorData']=="no Data found"
                          ?
                           "--"
                          :
                           "${
                              sensorData1.sensorData1['SensorData']["weight"]} kg"
                          ,
                      fontcolor: Colors.white,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    sensorData(
                      color: Colors.white,
                      text: "Height",
                      outlineColor: Colors.transparent,
                      positionIcon: Padding(
                        padding: const EdgeInsets.only(top: 18, left: 30),
                        child: Image.asset("images/height.png"),
                      ),
                     

                      data: sensorData1.sensorData1['SensorData']=="no Data found"
                          ?
                           "--"
                          :
                           "${
              
                              sensorData1.sensorData1['SensorData']["Height"]} ft"
                           ,
                      fontcolor: Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                   ],
                ),
              ),
            );
          }

            return Scaffold(
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Loading ......"),
                ],
              )),
            );
          
        });
  }
}
