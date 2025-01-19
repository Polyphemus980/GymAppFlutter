import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppScaffold extends StatelessWidget {
  final List<Widget>? actions;
  final String title;
  final Widget? child;
  const AppScaffold({super.key, this.actions, required this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        shadowColor: Colors.black,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        actionsIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text(title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              )),
        ),
        actions: actions,
      ),
      body: child,
    );
  }
}

class AppTextFormField extends StatelessWidget {
  final List<TextInputFormatter>? formatters;
  final TextEditingController? controller;
  final double? height;
  final double? width;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final TextStyle? errorStyle;
  final String? Function(String?)? validator;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  const AppTextFormField(
      {super.key,
      this.errorStyle,
      this.labelText,
      this.hintText,
      this.formatters,
      this.controller,
      this.width,
      this.height,
      this.onChanged,
      this.onEditingComplete,
      this.errorText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 80,
      height: height,
      child: TextFormField(
        validator: validator,
        onEditingComplete: onEditingComplete,
        inputFormatters: formatters,
        controller: controller,
        style: Theme.of(context).textTheme.titleMedium,
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        maxLines: null,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          errorText: errorText,
          errorStyle: errorStyle,
          contentPadding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
          counter: null,
          filled: true,
          fillColor: Theme.of(context).colorScheme.primaryContainer,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.blueAccent,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class AppInkWellButton extends StatelessWidget {
  const AppInkWellButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.width,
      this.height});

  final VoidCallback onTap;
  final String text;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
          border:
              Border.all(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
