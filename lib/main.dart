import 'package:flutter/material.dart';
import '../routing/router.dart';
import '../routing/routes.dart';
import '../utils/env.dart';
import 'package:provider/provider.dart';

import 'notifiers/Station_Notifier.dart';
import 'notifiers/User_Notifier.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => UserNotifier(user_data: {})),
          ChangeNotifierProvider(create: (context) => StationNotifier()),
        ],
        child: MaterialApp(
          title: APP_NAME,
          theme: ThemeData(
            fontFamily: 'Avenir',
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: generateRoute,
          initialRoute: landing,
        ));
  }
}
