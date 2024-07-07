import 'package:flutter/material.dart';
import 'package:flutter_example/widgets/app_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateRoomView extends StatefulHookConsumerWidget {
  const CreateRoomView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateRoomViewState();
}

class _CreateRoomViewState extends ConsumerState<CreateRoomView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(
        title: Text(
          '직관 모집',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: const Center(
        child: Text('Create Room View'),
      ),
    );
  }
}
