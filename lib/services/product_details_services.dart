import '../models/product.dart';
import '../generated/api_path.dart';
import 'firestore_services.dart';

abstract class ProductDetailsServices {
  Future<Product> getProductDetails(String productId);
}

class ProductDetailsServicesImpl implements ProductDetailsServices {
  final firestoreServices = FirestoreServices.instance;

  @override
  Future<Product> getProductDetails(String productId) async =>
      await firestoreServices.getDocument(
        path: ApiPath.product(productId),
        builder: (data, documentId) => Product.fromMap(data, documentId),
      );
}