import 'package:ecommerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/checkout/checkout_cubit.dart';
import '../../../../core/components/widgets/main_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/constants.dart';
import '../../../../models/shipping_address.dart';
import '../../widgets/main_dialog.dart';

class AddShippingAddressPage extends StatefulWidget {
  final ShippingAddress? shippingAddress;
  const AddShippingAddressPage({super.key, this.shippingAddress});

  @override
  State<AddShippingAddressPage> createState() => _AddShippingAddressPageState();
}

class _AddShippingAddressPageState extends State<AddShippingAddressPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _countryController = TextEditingController();
  ShippingAddress? shippingAddress;

  @override
  void initState() {
    super.initState();
    shippingAddress = widget.shippingAddress;
    if (shippingAddress != null) {
      _fullNameController.text = shippingAddress!.fullName;
      _addressController.text = shippingAddress!.address;
      _cityController.text = shippingAddress!.city;
      _stateController.text = shippingAddress!.state;
      _zipCodeController.text = shippingAddress!.zipCode;
      _countryController.text = shippingAddress!.country;
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  Future<void> saveAddress(CheckoutCubit checkoutCubit) async {
    try {
      if (_formKey.currentState!.validate()) {
        final address = ShippingAddress(
          id: shippingAddress != null
              ? shippingAddress!.id
              : documentIdFromLocalData(),
          fullName: _fullNameController.text.trim(),
          country: _countryController.text.trim(),
          address: _addressController.text.trim(),
          city: _cityController.text.trim(),
          state: _stateController.text.trim(),
          zipCode: _zipCodeController.text.trim(),
        );
        await checkoutCubit.saveAddress(address);
        // await database.saveAddress(address);
        if (!mounted) return;
        Navigator.of(context).pop();
      }
    } catch (e) {
      MainDialog(
          context: context,
          title: 'Error Saving Address',
          content: e.toString())
          .showAlertDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    final checkoutCubit = BlocProvider.of<CheckoutCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          shippingAddress != null
              ? 'Editing Shipping Address'
              : 'Adding Shipping Address',
          style: AppTextStyles.font16BlackWeight400,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    fillColor: AppColors.whiteColor,
                    filled: true,
                  ),
                  validator: (value) =>
                  value!.isNotEmpty ? null : 'Please enter your name',
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    fillColor: AppColors.whiteColor,
                    filled: true,
                  ),
                  validator: (value) =>
                  value!.isNotEmpty ? null : 'Please enter your name',
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    fillColor: AppColors.whiteColor,
                    filled: true,
                  ),
                  validator: (value) =>
                  value!.isNotEmpty ? null : 'Please enter your name',
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _stateController,
                  decoration: const InputDecoration(
                    labelText: 'State/Province',
                    fillColor: AppColors.whiteColor,
                    filled: true,
                  ),
                  validator: (value) =>
                  value!.isNotEmpty ? null : 'Please enter your name',
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _zipCodeController,
                  decoration: const InputDecoration(
                    labelText: 'Zip Code',
                    fillColor: AppColors.whiteColor,
                    filled: true,
                  ),
                  validator: (value) =>
                  value!.isNotEmpty ? null : 'Please enter your name',
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _countryController,
                  decoration: const InputDecoration(
                    labelText: 'Country',
                    fillColor: AppColors.whiteColor,
                    filled: true,
                  ),
                  validator: (value) =>
                  value!.isNotEmpty ? null : 'Please enter your name',
                ),
                const SizedBox(height: 32.0),
                MainButton(
                  title: 'Save Address',
                  onTap: () => saveAddress(checkoutCubit),
                  //hasCircularBorder: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}