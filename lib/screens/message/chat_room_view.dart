import 'package:flutter/material.dart';
import 'package:flutter_example/screens/message/widgets/chat_message.dart';
import 'package:flutter_example/widgets/app_bar.dart';
import 'package:flutter_example/widgets/button.dart';
import 'package:flutter_example/widgets/edit_text.dart';
import 'package:gap/gap.dart';
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
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: const AppBarBack(
        title: '채팅방',
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Material(
                    color: Theme.of(context).colorScheme.onPrimary,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                                color: Theme.of(context).dividerColor),
                            right: BorderSide(
                                color: Theme.of(context).dividerColor),
                            bottom: BorderSide(
                                color: Theme.of(context).dividerColor),
                          ),
                        ),
                        height: 70,
                        alignment: Alignment.center,
                        child: const Text(
                          '직관 정보',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    color: Theme.of(context).colorScheme.onPrimary,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                                color: Theme.of(context).dividerColor),
                            bottom: BorderSide(
                                color: Theme.of(context).dividerColor),
                          ),
                        ),
                        height: 70,
                        alignment: Alignment.center,
                        child: const Text(
                          '공지',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: double.infinity,
                color: Theme.of(context)
                    .colorScheme
                    .surfaceContainer
                    .withOpacity(0.5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ChatMessage(
                        userName: '닉네임(방장)',
                        userId: 'userId',
                        createdAt: DateTime.now(),
                        message: 'message22',
                      ),
                      ChatMessage(
                        userName: '닉네임',
                        userId: 'userId',
                        createdAt: DateTime.now(),
                        message: 'message11',
                        isMyChat: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  const Gap(20),
                  Expanded(
                    child: EditText(
                      onChanged: (value) {},
                      height: 40,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  CircleIconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send_rounded,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
