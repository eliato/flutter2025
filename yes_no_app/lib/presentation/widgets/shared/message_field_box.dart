import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textControler = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.transparent),
    );
    final inputDecoration = InputDecoration(
      hintText: 'Escribe un mensaje "?"',
      filled: true,
      fillColor: Colors.grey[200],
      focusedBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      suffixIcon: IconButton(
        icon: const Icon(Icons.send, color: Color.fromARGB(255, 42, 145, 45)),
        onPressed: () {
          final txtValue = textControler.text;
          print(txtValue);
          textControler.clear();
        },
      ),
    );
    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textControler,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print(value);
        textControler.clear();
        focusNode.requestFocus();
      },
    );
  }
}
