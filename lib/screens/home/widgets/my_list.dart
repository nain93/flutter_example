import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyList extends StatefulHookConsumerWidget {
  const MyList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyListState();
}

class _MyListState extends ConsumerState<MyList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
