import 'package:flutter/material.dart';
import 'package:flutter_example/utils/router_config.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatTile extends StatefulHookConsumerWidget {
  const ChatTile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatTileState();
}

class _ChatTileState extends ConsumerState<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context
          .push('${GoRoutes.message.fullPath}${GoRoutes.chatRoom.fullPath}'),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            ),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "한화 4/6 직관 채팅방",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "어디로감?",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const Spacer(),
            Text(
              '오전 1:44',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
