import 'package:flutter/material.dart';
import 'package:flutter_example/widgets/app_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatRoomView extends StatefulHookConsumerWidget {
  const ChatRoomView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatRoomViewState();
}

class _ChatRoomViewState extends ConsumerState<ChatRoomView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(
        title: Text(
          '채팅방',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: const Center(
        child: Text('Chat Room View'),
      ),
    );
  }
}
