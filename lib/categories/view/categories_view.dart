import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_implementation/categories/bloc/categories_bloc.dart';
import 'package:provider/provider.dart';

import '../widgets/categories_widget.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesBloc categoriesBloc =
        Provider.of<CategoriesBloc>(context, listen: false);
    categoriesBloc.add(FetchCategoriesEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc"),
        centerTitle: true,
        backgroundColor: const Color(0xff0a3049),
      ),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        bloc: categoriesBloc,
        builder: (context, state) {
          if (state is CategoriesInitialState) {
            return const SizedBox();
          } else if (state is CategoriesLoadingState) {
            return const CategoriesLoadingUI();
          } else if (state is CategoriesLoadedState) {
            return CategoriesLoadedUI(
              categoriesList: state.categoriesList,
            );
          } else if (state is CategoriesErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
            ));
            return const SizedBox();
          } else if (state is CategoriesEmptyState) {
            return const CategoriesEmptyUI();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
