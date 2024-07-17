import 'dart:ui';
import 'package:dahab_clinic_management/controllers/category_controller.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/services/category_service.dart';
import 'package:dahab_clinic_management/widgets/service_card.dart';
import 'package:dahab_clinic_management/widgets/leading_icon.dart';
import 'package:dahab_clinic_management/models/response/category_model.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final v=Get.put(CategoryController());

  @override
  void initState() {
    // TODO: implement initState
    v.getCategory(1);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffFEF3EC),
      body: Obx(
    (){
      if( v.resultModel.value is CategoryModel){
        return CustomScrollView(
        slivers: [
        SliverAppBar(
        bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
        decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
        top: Radius.circular(25)),
        color: Color(0xffFEF3EC),
        ),
        width: double.infinity,
        height: 15,
        child: const Text(""),
        ),
        ),
        leading: const LeadingIcon(),
        centerTitle: true,
        expandedHeight: 250.0,
        pinned: true,
        surfaceTintColor: ColorManager.jCreamColor,
    title: Text(
    widget.categoryModel.name,
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
    widget.categoryModel.description,
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
    padding: const EdgeInsets.symmetric(
    vertical: 8, horizontal: 14),
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
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 7.0,
    crossAxisSpacing: 5.0,
    childAspectRatio: 0.9,
    ),
    delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
    return const Center(
    child: ServiceCard(
    image: "assets/images/im.png",
    name: "hrte",
    ),
    );
    },
    childCount: 10,
    ),
    ),
    ],
    );

    }
      else if(v.resultModel.value is ExceptionResult){
        return Center(child: Text("oops"));

    }
      else{
        return Center(child: CircularProgressIndicator());
    }
    }

    )
    );
  }
}
