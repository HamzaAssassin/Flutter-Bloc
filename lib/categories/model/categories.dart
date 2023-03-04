
import 'dart:convert';

class Categories {
    int categoryId;
    String categoryTitle;
    String imageFile;
  Categories({
    required this.categoryId,
    required this.categoryTitle,
    required this.imageFile,
  });

    

  Categories copyWith({
    int? categoryId,
    String? categoryTitle,
    String? imageFile,
  }) {
    return Categories(
      categoryId: categoryId ?? this.categoryId,
      categoryTitle: categoryTitle ?? this.categoryTitle,
      imageFile: imageFile ?? this.imageFile,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CategoryId': categoryId,
      'CategoryTitle': categoryTitle,
      'ImageFile': imageFile,
    };
  }

  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      categoryId: map['CategoryId'] as int,
      categoryTitle: map['CategoryTitle'] as String,
      imageFile: map['ImageFile'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Categories.fromJson(String source) => Categories.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Categories(CategoryId: $categoryId, CategoryTitle: $categoryTitle, ImageFile: $imageFile)';

  @override
  bool operator ==(covariant Categories other) {
    if (identical(this, other)) return true;
  
    return 
      other.categoryId == categoryId &&
      other.categoryTitle == categoryTitle &&
      other.imageFile == imageFile;
  }

  @override
  int get hashCode => categoryId.hashCode ^ categoryTitle.hashCode ^ imageFile.hashCode;
}
