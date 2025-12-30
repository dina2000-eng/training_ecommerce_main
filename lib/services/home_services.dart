import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product.dart';

abstract class HomeServices {
  Future<List<Product>> getProducts();
}

class HomeServicesImpl implements HomeServices {
  final FirebaseFirestore firestore;

  HomeServicesImpl(this.firestore);

  @override
  Future<List<Product>> getProducts() async {
    final snapshot = await firestore.collection('products').get();
    return snapshot.docs
        .map((doc) => Product.fromMap(doc.data(), doc.id))
        .toList();
  }
}
