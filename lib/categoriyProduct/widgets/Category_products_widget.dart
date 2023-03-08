import 'package:flutter/material.dart';
import 'package:flutter_bloc_implementation/categoriyProduct/model/product.dart';

class CategoriesProductLoadingUI extends StatelessWidget {
  const CategoriesProductLoadingUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CategoryProductLoadedUI extends StatelessWidget {
  const CategoryProductLoadedUI(
      {super.key, required this.productssList, required this.categoryName});
  final List<Product> productssList;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    // var height = screenSize.height;
    // var width = screenSize.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        centerTitle: true,
        backgroundColor: const Color(0xff0a3049),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1 / 1.5,
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: productssList.length,
        itemBuilder: (context, index) => Container(
          decoration: const BoxDecoration(
            color: Color(0xFFDFDFF8),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  productssList[index].productName,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      r"Rs : " + productssList[index].salePrice.toString(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const SizedBox(
                    //   width: 8.0,
                    // ),
                    // Text(
                    //   productssList[index].description,
                    //   textAlign: TextAlign.left,
                    //   style: const TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 14,
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Expanded(
                  child: productssList[index].imageFile.isNotEmpty
                      ? Image.network(
                          "https://food.elms.pk${productssList[index].imageFile}",
                        )
                      : Image.asset("assets/images/biryani.png"),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            "Add to cart",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Icon(
                            Icons.add_shopping_cart,
                            color: Colors.black,
                            size: 16,
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesProductEmptyUI extends StatelessWidget {
  const CategoriesProductEmptyUI({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        centerTitle: true,
        backgroundColor: const Color(0xff0a3049),
      ),
      body: const Center(
        child: Text("No Product Found"),
      ),
    );
  }
}
