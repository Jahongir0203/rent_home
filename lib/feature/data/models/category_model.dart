class CategoryModel {
  final String name;
  final int id;

  CategoryModel({
    required this.id,
    required this.name,
  });
}

List<CategoryModel> categories = [
  CategoryModel(id: 1, name: "Home"),
  CategoryModel(id: 2, name: "Apartment"),
  CategoryModel(id: 3, name: "Hotel"),
  CategoryModel(id: 4, name: "Villa"),
  CategoryModel(id: 5, name: "Home"),
  CategoryModel(id: 6, name: "Apartment"),
  CategoryModel(id: 7, name: "Hotel"),
  CategoryModel(id: 8, name: "Villa"),
];
