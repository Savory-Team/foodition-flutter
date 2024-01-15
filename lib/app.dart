import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/core.dart';
import 'features/auth/core/core_class.dart';
import 'features/foodition/core/core_class.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final router = appRouter.router;
    return MultiBlocProvider(
      providers: [
        ...Auth.blocProviders,
        ...Foodition.blocProviders,
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Intensive Club batch 12',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.inter(
              color: AppColors.black,
              fontSize: AppDimens.spacing18pt,
              fontWeight: FontWeight.w600,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.black,
            ),
            shape: Border(
              bottom: BorderSide(
                color: AppColors.black.withOpacity(0.5),
              ),
            ),
          ),
          dividerTheme: const DividerThemeData(color: AppColors.stroke),
          scaffoldBackgroundColor: AppColors.white,
        ),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        builder: EasyLoading.init(),
      ),
    );
  }
}
