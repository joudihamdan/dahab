import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/sessions_controller.dart';
import '../../models/response/sessions_model.dart';


class SessionsScreen extends StatefulWidget {
  @override
  _SessionsScreenState createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final SessionsController controller = Get.put(SessionsController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        controller.setSelectedIndex(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.kCoffeeColor,
        title: const Text('Sessions',style: StyleManager.kAppBar,),
        bottom: TabBar(
          labelColor:ColorManager.kCreamColor ,
          labelStyle: const TextStyle(fontSize: 17,fontWeight: FontWeight.w700),
          splashBorderRadius: const BorderRadius.only(bottomRight: Radius.circular(15),topLeft: Radius.circular(15)),
          unselectedLabelColor:ColorManager.kWhiteColor ,
          unselectedLabelStyle: const TextStyle(fontSize: 16),
          indicatorColor: ColorManager.kCreamColor,
          // indicator: BoxDecoration(
          //   color: ColorManager.kCreamColor
          // ),
          // indicatorPadding: EdgeInsets.all(value),
          controller: _tabController,
          tabs: const [
            Tab(text: 'On Progress'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      body: Obx(() {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: controller.selectedIndex.value == 0
              ? OnProgressScreen(key: const ValueKey('OnProgress'))
              : const CompletedScreen(key: ValueKey('Completed')),
        );
      }),
    );
  }
}


List<SessionsModel> onProgressSessionList=[
  SessionsModel(sreviceName: "dermal", date: "2024.7.14", time: "9:00 AM"),
  SessionsModel(sreviceName: "mesobash", date: "2024.7.6", time: "11:30 AM"),
  SessionsModel(sreviceName: "hand laser", date: "2024.7.14", time: "13:00 PM"),
];

class OnProgressScreen extends StatelessWidget {
   const OnProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  ListView.builder(
      itemCount:onProgressSessionList.length,
       itemBuilder: (context,index){
       return  Card(
         color: ColorManager.kCreamColor,
         child: ListTile(
            title:Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(onProgressSessionList[index].sreviceName,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: ColorManager.jBrownColor),),
            ),
         
           subtitle: Text("${onProgressSessionList[index].date}\t\t${onProgressSessionList[index].time}"),
           contentPadding: const EdgeInsets.all(8),
           trailing: Row(
             mainAxisSize: MainAxisSize.min,
             children: [
             IconButton(onPressed: (){

             }, icon: const Icon(Icons.edit,color: ColorManager.jBrownColor,),),
             IconButton(onPressed: (){
               _showConfirmDeleteReservationDialog();
             }, icon: const Icon(Icons.delete,color: ColorManager.jBrownColor,))
         
           ],),
            ),
       );
        });
  }
}





class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount:2 ,
        itemBuilder: (context,index){
          return  Card(
            color: ColorManager.kCreamColor,
            child: ListTile(
              title:Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(onProgressSessionList[index].sreviceName,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: ColorManager.jBrownColor),),
              ),

                subtitle: Text("${onProgressSessionList[index].date}\t\t${onProgressSessionList[index].time}"),
              contentPadding: const EdgeInsets.all(8),
              trailing: Container(
                decoration: BoxDecoration(
                    color: ColorManager.jBrownColor,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: TextButton(onPressed: (){
                  _showReviewDialog();
                },child: const Text("Review",style: TextStyle(color: ColorManager.kWhiteColor),),),
              )
            ),
          );
        });
  }
}

_showConfirmDeleteReservationDialog(){
  Get.dialog(
      Dialog(
        backgroundColor: ColorManager.jCreamColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Are you sure you want to cancel your reservation ?',style: StyleManager.normalText.copyWith(color: ColorManager.jBrownColor,fontWeight: FontWeight.bold,fontSize: 20
              )),

              const SizedBox(height: 40.0),

              Row(
               // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: StyleManager.ElevatedButtonStyle.copyWith(minimumSize: const WidgetStatePropertyAll(Size(60,20))),
                    onPressed: () {

                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text('Yes',style: StyleManager.buttunTextStyle,),
                    ),
                  ),
                  ElevatedButton(
                    style: StyleManager.ElevatedButtonStyle.copyWith(minimumSize: const WidgetStatePropertyAll(Size(40,15))),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Cancel',style: StyleManager.buttunTextStyle,),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
  );
}


_showReviewDialog(){
  Get.dialog(
      SizedBox(
        width: double.infinity,
        child: Dialog(
          backgroundColor: ColorManager.jCreamColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('add your review here please',style: StyleManager.normalText.copyWith(color: ColorManager.jBrownColor,fontWeight: FontWeight.bold,fontSize: 20
                ),
                ),
                const SizedBox(height: 40.0),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: ColorManager.jBrownColor)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: ColorManager.jBrownColor)
                          ),

                        ),
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 40.0),

                ElevatedButton(
                    style: StyleManager.ElevatedButtonStyle.copyWith(minimumSize:const WidgetStatePropertyAll(Size(100,40))),
                    onPressed: (){
                      Get.back();
                      _showThanksDialog();
                    }, child: Text("Go",style: StyleManager.buttunTextStyle,))
              ],
            ),
          ),
        ),
      )
  );
}


_showThanksDialog(){
  Get.dialog(
      Dialog(
        backgroundColor: ColorManager.jCreamColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70,horizontal: 20),
            child:Text('Thanks for your Comment',textAlign: TextAlign.center,style: StyleManager.normalText.copyWith(color: ColorManager.jBrownColor,fontWeight: FontWeight.bold,fontSize: 20

          ),
        ),
      ),
            )
  );
}