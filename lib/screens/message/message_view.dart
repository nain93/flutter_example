import 'package:flutter/material.dart';
import 'package:flutter_example/screens/message/widgets/chat_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MessageView extends StatefulHookConsumerWidget {
  const MessageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MessageViewState();
}

class _MessageViewState extends ConsumerState<MessageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: 15,
          itemBuilder: (context, index) {
            return const ChatTile();
          },
        ),
      ),
    );
  }
}
