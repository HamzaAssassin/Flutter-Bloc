import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_implementation/categories/bloc/categories_bloc.dart';

import 'categories/view/categories_view.dart';
import 'categoriyProduct/bloc/category_product_bloc.dart';
import 'navigations/app_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryProductBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppNavigation.buildPage,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CategoriesPage(),
      ),
    );
  }
}
