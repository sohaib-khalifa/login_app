import 'package:flutter/material.dart';
import '../theme/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextInputType keyboardType;
  final int maxLines;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final bool readOnly;

  final bool isDatePicker;
  final ValueChanged<DateTime>? onDateSelected;

  final bool isRequired;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.controller,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.textInputAction,
    this.prefixIcon,
    this.onTap,
    this.readOnly = false,
    this.isDatePicker = false,
    this.onDateSelected,
    this.isRequired = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      widget.controller?.text =
      "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      widget.onDateSelected?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      obscureText: _obscure,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      readOnly: widget.isDatePicker || widget.readOnly,
      onTap: widget.isDatePicker ? () => _pickDate(context) : widget.onTap,
      validator: widget.validator ??
          (widget.isRequired
              ? (value) {
            if (value == null || value.trim().isEmpty) {
              return 'هذا الحقل مطلوب';
            }
            return null;
          }
              : null),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          fontSize: 14,
          color: AppColors.white,
          fontWeight: FontWeight.normal,
        ),
        hintText: widget.hintText ?? widget.label,
        hintStyle: TextStyle(
          fontSize: 14,
          color: AppColors.white,
          fontWeight: FontWeight.normal,
        ),
        prefixIcon: widget.prefixIcon == null
            ? null
            : Padding(padding: EdgeInsets.all(12), child: widget.prefixIcon),
        suffixIcon: widget.obscureText
            ? IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_off : Icons.visibility,
            color: AppColors.white,
          ),
          onPressed: () {
            setState(() {
              _obscure = !_obscure;
            });
          },
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.white,width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.white,width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
          BorderSide(color: AppColors.white, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
