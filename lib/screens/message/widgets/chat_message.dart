import 'package:flutter/material.dart';
import 'package:flutter_example/utils/utils.dart';
import 'package:flutter_example/widgets/circle_profile_avatar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatMessage extends StatefulHookConsumerWidget {
  const ChatMessage({
    super.key,
    this.userName,
    required this.userId,
    required this.createdAt,
    required this.message,
    this.photoUrl,
    this.isMyChat = false,
  });
  final String? userName;
  final String userId;
  final DateTime createdAt;
  final String message;
  final bool isMyChat;
  final String? photoUrl;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatMessageState();
}

class _ChatMessageState extends ConsumerState<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    if (widget.isMyChat) {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              Utils.formatDate(widget.createdAt),
              style: Theme.of(context).textTheme.labelSmall?.merge(
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    widget.message,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 35,
            height: 35,
            child: Stack(
              children: [
                CircleProfileAvatar(
                  size: const Size(35, 35),
                  imageUrl: widget.photoUrl,
                ),
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(35),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(35),
                    onTap: () {
                      // context.push(GoRoutes.userProfile.fullPath,
                      //     extra: userId);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.userName ?? '',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.65,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        widget.message,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      Utils.formatDate(widget.createdAt),
                      style: Theme.of(context).textTheme.labelSmall?.merge(
                          TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onSecondary)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
