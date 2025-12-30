import 'package:ecommerce/controllers/product_details/product_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../models/add_to_cart_model.dart';
import '../../models/product.dart';
import '../../services/auth_services.dart';
import '../../services/cart_services.dart';
import '../../services/product_details_services.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  final productDetailsServices = ProductDetailsServicesImpl();
  final cartServices = CartServicesImpl();
  final authServices = AuthServicesImpl();

  String? size;

  Future<void> getProductDetails(String productId) async {
    emit(ProductDetailsLoading());
    try {
      final product = await productDetailsServices.getProductDetails(productId);
      emit(ProductDetailsLoaded(product));
    } catch (e) {
      emit(ProductDetailsError(e.toString()));
    }
  }

  Future<void> addToCart(Product product) async {
    emit(AddingToCart());
    try {
      final currentUser = authServices.currentUser;
      if (size == null) {
        emit(AddToCartError('Please select a size'));
      }
      final addToCartProduct = AddToCartModel(
        id: Uuid().v4(),
        title: product.title,
        price: product.price,
        productId: product.id,
        imgUrl: product.imgUrl,
        size: size!,
      );
      await cartServices.addProductToCart(currentUser!.uid, addToCartProduct);
      emit(AddedToCart());
    } catch (e) {
      emit(AddToCartError(e.toString()));
    }
  }

  void setSize(String newSize) {
    size = newSize;
    emit(SizeSelected(newSize));
  }
}