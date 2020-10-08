import 'package:flutter/material.dart';
import 'package:flutter_setup/core/utill/color_resources.dart';
import 'package:flutter_setup/feature/post/provider/post_provider.dart';
import 'package:flutter_setup/feature/post/screen/post_screen.dart';
import 'package:provider/provider.dart';

import 'di_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => di.sl<PostProvider>(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: ColorResources.PRIMARY_MATERIAL,
        primaryColor: ColorResources.PRIMARY,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PostScreen(),
    );
  }
}
