import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio_flutter/features/contact-me/logic/contact_me_bloc/contact_me_bloc.dart';
import 'package:my_portfolio_flutter/shared/logic/shared_cubit/shared_cubit.dart';

import 'features/main_screen.dart';
import 'firebase_options.dart';
import 'shared/theme/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactMeBloc(),
        ),
        BlocProvider(
          create: (context) => SharedCubit(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: getApplicationThemeLight(context),
          home: const MainScreen()),
    );
  }
}
