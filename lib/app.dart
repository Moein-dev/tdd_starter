import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_starter/core/global/app_global.dart';
import 'package:tdd_starter/core/locator.dart';
import 'package:tdd_starter/features/home/presentation/bloc/home_bloc.dart';
import 'package:tdd_starter/features/home/presentation/pages/main_page.dart';

class App extends StatelessWidget {
  const App({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<HomeBloc>(),
        )
      ],
      child: MaterialApp(
        title: 'Books App',
        navigatorKey: AppGlobal.navigatorKey,
        debugShowCheckedModeBanner: false,
        home: const MainPage(),
      ),
    );
  }
}
