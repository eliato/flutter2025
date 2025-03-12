import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 155, 138),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://images.crunchbase.com/image/upload/c_thumb,h_256,w_256,f_auto,g_face,z_0.7,q_auto:eco,dpr_1/qq2ofxh8q7yvfgk9iixo'),
          ),
        ),
        title: const Text('Chat ON'), 
        centerTitle: false),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {

   final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/images/whatsapp_background.jpg'), // You'll need to add this image
        fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
        children: [
          Expanded(
          child: ListView.builder(
            controller: chatProvider.scrollController,
            itemCount: chatProvider.messagesList.length,
            itemBuilder: (context, index) {
              final message = chatProvider.messagesList[index];

            return (message.fromWho == FromWho.hers) 
            ? const HerMessageBubble() : 
              MyMessageBubble( message: message);
            
            
            },
          ),
          ),
           MessageFieldBox(
          onValue: (value) => chatProvider.sendMessage(value)
          
           ),
        ],
        ),
      ),
      ),
    );
  }
}
