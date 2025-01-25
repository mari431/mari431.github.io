import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.maxLines = 1,
    this.hintText,
    this.focusNode,  // FocusNode support
  });

  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;
  final FocusNode? focusNode; // FocusNode is optional

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode; // Local focus node

  @override
  void initState() {
    super.initState();
    // Use widget's focus node or create a new one
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    // Dispose of the focus node when the widget is disposed
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode, // Assign focus node
      maxLines: widget.maxLines,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(7),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: getInputBorder,
        enabledBorder: getInputBorder,
        border: getInputBorder,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  OutlineInputBorder get getInputBorder {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey),
    );
  }
}

















// class CustomTextField extends StatefulWidget {
//   const CustomTextField({
//     super.key,
//     this.controller,
//     this.maxLines = 1,
//     this.hintText,
//     // this.validator,
//   });
//
//   final TextEditingController? controller;
//   final int maxLines;
//   final String? hintText;
//   // final String? Function(String?)? validator;
//
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   // bool _hasError = false;
//   // String? _errorMessage;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       maxLines: widget.maxLines,
//       style: const TextStyle(
//         color: Colors.black,
//       ),
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.all(7),
//         filled: true,
//         fillColor: Colors.white,
//         focusedBorder: getInputBorder,
//         enabledBorder: getInputBorder,
//         border: getInputBorder,
//         hintText: widget.hintText,
//         hintStyle: const TextStyle(
//           color: Colors.grey,
//         ),
//         // errorText: _hasError ? _errorMessage : null,
//       ),
//       // validator: widget.validator,
//       // onChanged: (value) {
//       //   setState(() {
//       //     _hasError = false;
//       //     _errorMessage = null;
//       //   });
//       // },
//     );
//   }
//
//   OutlineInputBorder get getInputBorder {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       // borderSide: BorderSide.none,
//       borderSide: BorderSide(color: Colors.grey),
//     );
//   }
// }
