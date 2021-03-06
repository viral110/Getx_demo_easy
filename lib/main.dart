import 'package:bloc_api/View/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

GetStorage getStorage = GetStorage();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
       BouncingScrollWrapper.builder(context, widget!),
       maxWidth: 1200,
       minWidth: 480,
       defaultScale: true,
       breakpoints: [
         const ResponsiveBreakpoint.resize(480,name: MOBILE),
         const ResponsiveBreakpoint.autoScale(800, name: TABLET),
         const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
       ],
      //  background: Container(color: ,)
      ),
      home: HomePage(),
    );
  }
}
