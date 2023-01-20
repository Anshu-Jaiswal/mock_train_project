import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mock_train_project/app/screens/mock_confirm_screen.dart';
import 'package:mock_train_project/providers/mock_provider.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MockProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MockConfirmScreen(),
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: SafeArea(
                child: Banner(
                    color: context.watch<MockProvider>().mock
                        ? Colors.purple
                        : Colors.green,
                    message: context.watch<MockProvider>().label,
                    location: BannerLocation.topEnd,
                    child: child!)),
          );
        },
      ),
    );
  }
}
