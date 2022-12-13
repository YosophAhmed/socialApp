import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscure;
  final IconData? suffix;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final void Function()? suffixFunction;

  const CustomTextFormField({
    Key? key,
    this.hintText = '',
    this.obscure = false,
    this.controller,
    required this.keyboardType,
    required this.onChanged,
    required this.onSubmitted,
    this.suffix,
    this.suffixFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'field is required!';
        }
        return null;
      },
      keyboardType: keyboardType,
      obscureText: obscure,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.sp,
        ),
        suffixIcon: IconButton(
          onPressed: suffixFunction,
          icon: Icon(
            suffix,
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
