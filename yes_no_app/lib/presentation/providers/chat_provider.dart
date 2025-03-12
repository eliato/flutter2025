import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  final List<Message> messagesList = [
    Message(text: 'Hola amorrrr', fromWho: FromWho.me),
    Message(text: 'Ya salio del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {

    if (text.isEmpty) return;

    messagesList.add(Message(text: text, fromWho: FromWho.me));

    if (text.endsWith('?')) {
      await getAnswer();
      
    }

    notifyListeners();
    movedScroll();
  }

  Future<void> getAnswer() async {
    final message = await getYesNoAnswer.getYesNoAnswer();
    messagesList.add(message);
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
