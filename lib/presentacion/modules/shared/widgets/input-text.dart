import 'package:flutter/material.dart';

class InputTextCustom extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final TextEditingController controller;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool isPassword;
  final bool isRequired;
  final String? requiredText;
  final TextInputType keyboardType;
  final int? minLength;
  double? borderRadio = 8.0;
  int? maxLines = 1;
  bool readonly;
  Color? borderColor;

  InputTextCustom(
      {Key? key,
      required this.hintText,
      this.labelText,
      required this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.isPassword = false,
      this.isRequired = false,
      this.requiredText,
      this.keyboardType = TextInputType.text,
      this.minLength,
      this.borderRadio,
      this.maxLines,
      this.borderColor,
      this.readonly = false})
      : super(key: key);

  @override
  _InputTextCustomState createState() => _InputTextCustomState();
}

class _InputTextCustomState extends State<InputTextCustom> {
  bool _obscureText = true;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: _obscureText && widget.isPassword,
      controller: widget.controller,
      autofocus: false,
      keyboardType: widget.keyboardType,
      readOnly: widget.readonly,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadio ?? 8),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber, width: 2),
            borderRadius: BorderRadius.circular(widget.borderRadio ?? 8)),
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.white, fontSize: 20),
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        errorStyle: TextStyle(
          color: Color.fromARGB(255, 255, 0, 0), // Color del texto de error
          fontSize: 16, // Tamaño del texto de error
          fontWeight: FontWeight.bold, // Peso de la fuente
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : Icon(widget.suffixIcon),
        errorText: _errorMessage,
      ),
      validator: (value) {
        if (widget.isRequired && (value == null || value.isEmpty)) {
          return widget.requiredText ?? 'Este campo es requerido';
        }
        if (widget.minLength != null &&
            value != null &&
            value.length < widget.minLength!) {
          return 'Debe tener al menos ${widget.minLength} caracteres';
        }
        return null;
      },
      onChanged: (value) {
        return null;
      },
    );
  }
}
