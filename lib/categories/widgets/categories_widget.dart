import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../categoriyProduct/view/category_products_view.dart';
import '../bloc/categories_bloc.dart';
import '../model/categories.dart';

class CategoriesLoadingUI extends StatelessWidget {
  const CategoriesLoadingUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CategoriesLoadedUI extends StatelessWidget {
  const CategoriesLoadedUI(
      {super.key, required this.categoriesList, this.status = ""});
  final List<Categories> categoriesList;
  final String status;
  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    // var height = screenSize.height;
    // var width = screenSize.width;
    CategoriesBloc categoriesBloc =
        Provider.of<CategoriesBloc>(context, listen: false);
    return Scaffold(
      body: ListView.builder(
        //padding: const EdgeInsets.all(10),
        itemCount: categoriesList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: PhysicalModel(
            color: const Color(0xfffeedfa),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            elevation: 10,
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(CategoryProductsPage.pageName,
                    arguments: categoriesList[index]);
              },
              dense: true,
              leading: CircleAvatar(
                backgroundColor: const Color(0xff0a3049),
                child: Text(
                  "$index",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                categoriesList[index].categoryTitle,
                style: const TextStyle(
                    color: Color(0xff0a3049), fontWeight: FontWeight.bold),
              ),
              subtitle: Text(categoriesList[index].categoryId.toString()),
              //  style: ListTileStyle.list,
              shape: const RoundedRectangleBorder(
                side: BorderSide(width: 0.5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              tileColor: const Color(0xfffeedfa),
              trailing: IconButton(
                onPressed: () {
                  categoriesBloc.add(DeleteCategoryByIdEvent(
                      id: categoriesList[index].categoryId));

                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(status)));
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.black.withOpacity(0.7),
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 7,
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesEmptyUI extends StatelessWidget {
  const CategoriesEmptyUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("No Category Found"),
    );
  }
}
