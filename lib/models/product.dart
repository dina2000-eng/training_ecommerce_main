
import '../generated/app_assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String imgUrl;
  final int? discountValue;
  final String category;
  final int? rate;


  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imgUrl,
    this.discountValue,
    this.category = 'Other',
    this.rate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imgUrl': imgUrl,
      'discountValue': discountValue,
      'category': category,
      'rate': rate,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map, String documentId) {
    return Product(
      id: documentId,
      title: map['title'] as String? ?? '',
      price: (map['price'] as int?) ?? 0,
      imgUrl: (map['imgUrl'] as String?)?.isNotEmpty == true
          ? map['imgUrl'] as String
          : AppAssets.imagesClothe1,
      discountValue: (map['discountValue'] as int?) ?? 0,
      category: map['category'] as String? ?? 'Other',
      rate: map['rate'] as int?,
    );
  }
}

List<Product> dummyProducts = [
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: AppAssets.imagesClothe2,
    category: 'Clothes',
    discountValue: 20,
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: AppAssets.imagesClothe2,
    category: 'Clothes',
    discountValue: 20,
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: AppAssets.imagesClothe2,
    category: 'Clothes',
    discountValue: 20,
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: AppAssets.imagesClothe2,
    category: 'Clothes',
    discountValue: 20,
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: AppAssets.imagesClothe2,
    category: 'Clothes',
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: AppAssets.imagesClothe2,
    category: 'Clothes',
    discountValue: 20,
  ),
];