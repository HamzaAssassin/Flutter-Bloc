// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  String productName;
  double salePrice;
  String imageFile;
  String description;
  Product({
    required this.productName,
    required this.salePrice,
    required this.imageFile,
    required this.description,
  });

  Product copyWith({
    String? productName,
    double? salePrice,
    String? imageFile,
    String? description,
  }) {
    return Product(
      productName: productName ?? this.productName,
      salePrice: salePrice ?? this.salePrice,
      imageFile: imageFile ?? this.imageFile,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productName': productName,
      'salePrice': salePrice,
      'imageFile': imageFile,
      'description': description,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productName: map['ProductName'] as String,
      salePrice: map['SalePrice'] as double,
      imageFile: map['ImageFile'] as String,
      description: map['Description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(productName: $productName, salePrice: $salePrice, imageFile: $imageFile, description: $description)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.productName == productName &&
      other.salePrice == salePrice &&
      other.imageFile == imageFile &&
      other.description == description;
  }

  @override
  int get hashCode {
    return productName.hashCode ^
      salePrice.hashCode ^
      imageFile.hashCode ^
      description.hashCode;
  }
  }
