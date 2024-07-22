import 'dart:ui';
import 'package:dahab_clinic_management/controllers/category_controller.dart';
import 'package:dahab_clinic_management/models/response/service_response_model.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/widgets/service_card.dart';
import 'package:dahab_clinic_management/widgets/leading_icon.dart';
import 'package:dahab_clinic_management/models/response/category_model.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'no_data_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.categoryId,});
final int categoryId;
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final v = Get.put(CategoryController());
  final serviceController = Get.put(ServiceController());
  List<ServiceResponseModel> services = [];

  @override
  void initState() {
    super.initState();
    v.getCategory(widget.categoryId);
    print("hola");
    serviceController.getServices(1);
    // print(serviceController.resultModel.value);
    // print(v.resultModel.value);
    // printRes();
  }
  //
  // printRes(){
  //   setState(() {
  //     print("tk ${serviceController.resultModel.value}");
  //     print("tk ${v.resultModel.value}");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: const Color(0xffFEF3EC),
      body: Obx(
        () {
          if (v.resultModel.value is CategoryModel ) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(0),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25)),
                        color: Color(0xffFEF3EC),
                      ),
                      width: double.infinity,
                      height: 15,
                      child: const SizedBox(),
                    ),
                  ),
                  leading: const LeadingIcon(),
                  centerTitle: true,
                  expandedHeight: 250.0,
                  pinned: true,
                  surfaceTintColor: ColorManager.jCreamColor,
                  title: Text(
                    ( v.resultModel.value as CategoryModel).name,
                    style: StyleManager.kAppBar,
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          "http://127.0.0.1:8000${(v.resultModel.value as CategoryModel).image}",
                          fit: BoxFit.cover,
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  ColorManager.jBrownColor.withOpacity(0.7),
                                  ColorManager.kCoffeeColor.withOpacity(0.6),
                                  ColorManager.kCreamColor.withOpacity(0.1),
                                  Colors.transparent
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30.0,
                          left: 16.0,
                          right: 16.0,
                          child: Text(
                            (v.resultModel.value as CategoryModel).description,
                            maxLines: 4,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: ColorManager.kCoffeeColor,
                  foregroundColor: ColorManager.kCreamColor,
                ),
                   SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                    child: Text(
                      "skin care services",
                      style: StyleManager.headerTextStyle,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: height * 0.01,
                      crossAxisSpacing: width * 0.01,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Center(
                          child: ServiceCard(
                            id:index,
                          //  image: AssetsManager.testImg,
                           image:  "http://127.0.0.1:8000${(serviceController.resultModel.value as ListOf<ServiceResponseModel>).resutl[index].image}",
                           // name:"3aaa",
                         name: (serviceController.resultModel.value as  ListOf<ServiceResponseModel>).resutl[index].name
                          ),
                        );
                      },
                      childCount:
                      (serviceController.resultModel.value as ListOf<ServiceResponseModel>  ).resutl.length ,
                    ),
               ),

              ],
            );
          }   else if (v.resultModel.value is EmptyResult ) {
            return Center(child: NoDataScreen());
          }
          else if (v.resultModel.value is ExceptionResult ) {
            return Center(child: NoDataScreen());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
