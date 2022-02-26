
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:only_sugar_admin/shared/constants/constants.dart';

class InputText extends StatefulWidget {
  final TextEditingController? controller;
  final String? defaultValue, label, placeholder, prefixIcon;
  final bool obscureText;
  final void Function(String)? onChanged,onSubmit;
  final void Function(String?)? onSaved;
  final String? Function(String)? validator;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final Color? backgroundColor;
  final int maxLines;
  final bool enabled;

  InputText({
    Key? key,
    this.controller,
    this.defaultValue = '',
    this.label,
    this.placeholder,
    this.obscureText = false,
    this.onChanged,
    this.onSaved,
    this.onSubmit,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.focusNode,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.backgroundColor,
    this.maxLines = 1,
    this.enabled = true
  }) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  late TextEditingController _controller;
  FocusNode _focusNode = FocusNode();
  late bool _obscureText, _isFocused = false, _hasError = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _controller.text = widget.defaultValue ?? "";

    _focusNode.addListener(() {
      _isFocused = _focusNode.hasFocus;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant InputText oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: _hasError ? 10 : 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: widget.backgroundColor ?? ColorConstants.white,
        boxShadow: inputShadow,
      ),
      child: TextFormField(
        controller: _controller,
        focusNode: _focusNode,
        maxLines: widget.maxLines,
        enabled: widget.enabled,
        textCapitalization: widget.textCapitalization,
        inputFormatters: widget.inputFormatters,
        validator: widget.validator != null
            ? (text) {
                final error = widget.validator!(text!);
                setState(() {
                  _hasError = error != null;
                });
                return error;
              }
            : null,
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        onFieldSubmitted: widget.onSubmit,
        decoration: InputDecoration(
          /*labelStyle: FontStyles.normal.copyWith(
            height: 1,
            color: _isFocused ? primaryColor : Colors.black45,
          ),*/
          labelText: widget.label,
          hintText: widget.placeholder,
          /*hintStyle: FontStyles.normal.copyWith(
            color: Colors.black26,
          ),*/
          errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.redAccent.withOpacity(0.7),
            ),
          ),
          suffixIcon: widget.obscureText
              ? CupertinoButton(
                  padding: EdgeInsets.only(right: 10),
                  minSize: 10,
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: _obscureText ? Colors.black45 : Colors.black38,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.grey[300]!,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: ColorConstants.principalColorLight,
            ),
          ),
          disabledBorder: InputBorder.none
        ),
      ),
    );
  }
}
