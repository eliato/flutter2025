import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Adipisicing est est Lorem esse sunt ea. Ea eiusmod esse labore amet irure esse nostrud dolor pariatur exercitation. Reprehenderit nostrud qui irure irure. Dolore nisi magna magna ex cillum eu est exercitation tempor qui commodo ut do labore.',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),

        _ImageBubble(),

        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://yesno.wtf/assets/yes/4-c53643ecec77153eefb461e053fb4947.gif',
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: Container(
              width: size.width * 0.2,
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
