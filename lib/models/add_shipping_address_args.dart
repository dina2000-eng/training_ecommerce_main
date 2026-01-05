import 'package:ecommerce/models/shipping_address.dart';
import '../controllers/checkout/checkout_cubit.dart';

class AddShippingAddressArgs {
  final ShippingAddress? shippingAddress;
  final CheckoutCubit checkoutCubit;

  AddShippingAddressArgs({this.shippingAddress, required this.checkoutCubit,});
}