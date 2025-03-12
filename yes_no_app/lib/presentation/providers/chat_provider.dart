import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  final List<Message> messagesList = [
    Message(text: 'Hola amorrrr', fromWho: FromWho.me),
    Message(text: 'Ya salio del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {

    if (text.isEmpty) return;

    messagesList.add(Message(text: text, fromWho: FromWho.me));
    notifyListeners();
    movedScroll();
  }

 Future<void> movedScroll() async {
    await Future.delayed(const Duration(milliseconds: 300));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
