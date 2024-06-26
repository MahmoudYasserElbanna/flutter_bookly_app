import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/core/utils/service_locater.dart';
import 'package:bookly_app/feature/home/data/repos/home_repos_impl.dart';
import 'package:bookly_app/feature/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/feature/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepositoryImpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepositoryImpl>(),
          )..fetchNewestBooks(),
        ),
        // BlocProvider(
        //   create: (context) =>
        //       NewestBooksCubit(HomeRepositoryImpl(API(Dio()))),
        // ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
