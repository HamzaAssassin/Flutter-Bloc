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

class CategoriesLoadedUI extends StatefulWidget {
  const CategoriesLoadedUI({
    super.key,
    required this.categoriesList,
  });
  final List<Categories> categoriesList;

  @override
  State<CategoriesLoadedUI> createState() => _CategoriesLoadedUIState();
}

class _CategoriesLoadedUIState extends State<CategoriesLoadedUI> {
  late TextEditingController titleController;
  late TextEditingController updateTitleController;
  late CategoriesBloc categoriesBloc;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    updateTitleController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    updateTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    // var height = screenSize.height;
    // var width = screenSize.width;
    print("lllllllllllllllllllll");
    categoriesBloc = Provider.of<CategoriesBloc>(context, listen: false);
    return Scaffold(
      body: ListView.builder(
        //padding: const EdgeInsets.all(10),
        itemCount: widget.categoriesList.length,
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
                      arguments: widget.categoriesList[index]);
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
                  widget.categoriesList[index].categoryTitle,
                  style: const TextStyle(
                      color: Color(0xff0a3049), fontWeight: FontWeight.bold),
                ),
                subtitle:
                    Text(widget.categoriesList[index].categoryId.toString()),
                //  style: ListTileStyle.list,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                tileColor: const Color(0xfffeedfa),
                trailing: SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          categoriesBloc.add(DeleteCategoryByIdEvent(
                              id: widget.categoriesList[index].categoryId));
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
                      IconButton(
                        onPressed: () {
                          // categoriesBloc.add(DeleteCategoryByIdEvent(
                          //     id: widget.categoriesList[index].categoryId));
                          updateTitleController.text =
                              widget.categoriesList[index].categoryTitle;
                          _updateCategoryDialog(widget.categoriesList[index]);
                        },
                        icon: Icon(
                          Icons.edit,
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
                    ],
                  ),
                )),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addCategoryDialog();
          },
          child: const Icon(Icons.add)),
    );
  }

  Future<void> _addCategoryDialog() async {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (dialogContext) {
        var screensize = MediaQuery.of(dialogContext).size;
        var height = screensize.height;
        var width = screensize.width;

        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: SizedBox(
            // height: height * 0.6,
            width: width * 0.8,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.07,
                      width: width * 0.3,
                      child: const FittedBox(
                        child: Text("Category"),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.title),
                        border: const OutlineInputBorder(),
                        hintText: 'Title',
                        labelText: 'Title',
                        errorText: _errorText,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _popDialog(),
                          child: const Text("Cancel"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () => titleController.value.text.isNotEmpty
                              ? _submit()
                              : null,
                          child: const Text("Add"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _updateCategoryDialog(Categories categories) async {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (dialogContext) {
        var screensize = MediaQuery.of(dialogContext).size;
        var height = screensize.height;
        var width = screensize.width;

        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: SizedBox(
            // height: height * 0.6,
            width: width * 0.8,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.07,
                      width: width * 0.3,
                      child: const FittedBox(
                        child: Text("Category"),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    TextField(
                      controller: updateTitleController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.title),
                        border: const OutlineInputBorder(),
                        hintText: 'Title',
                        labelText: 'Title',
                        errorText: _updateErrorText,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _popDialog(),
                          child: const Text("Cancel"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print("up");
                            return updateTitleController.value.text.isNotEmpty
                                ? _updateSubmit(categories.categoryId)
                                : null;
                          },
                          child: const Text("Update"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _submit() {
    // if there is no error text
    if (_errorText == null) {
      // notify the parent widget via the onSubmit callback
      categoriesBloc.add(AddCategoryEvent(title: titleController.value.text));
      _popDialog();
    }
  }

  void _updateSubmit(int id) {
    // if there is no error text
    if (_errorText != null) {
      // notify the parent widget via the onSubmit callback
      categoriesBloc.add(UpdateCategoryEvent(
          title: updateTitleController.value.text, categoryId: id));
      _popDialog();
    }
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = titleController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    } else if (text.length < 4) {
      return 'Too short';
    } else {
      // return null if the text is valid
      return null;
    }
  }

  String? get _updateErrorText {
    // at any time, we can get the text from _controller.value.text
    final text = updateTitleController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    } else if (text.length < 4) {
      return 'Too short';
    } else {
      // return null if the text is valid
      return null;
    }
  }

  void _popDialog() {
    Navigator.pop(context);
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
