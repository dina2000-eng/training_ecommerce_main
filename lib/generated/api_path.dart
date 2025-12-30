class ApiPath {
  static String products() => 'products/';
  static String product(String id) => 'products/$id';
  static String user(String uid) => 'users/$uid';
  static String addToCart(String uid, String addToCartId) => 'users/$uid/cart/$addToCartId';
  static String myProductsCart(String uid) => 'users/$uid/cart/';

}