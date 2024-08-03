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
    return const Scaffold(
      appBar: AppBarBack(
        title: '채팅방',
      ),
      body: Center(
        child: Text('Chat Room View'),
      ),
    );
  }
}
