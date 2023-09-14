import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/riverpod/stream_provider.dart';

import '../layout/default_layout.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<int>> state = ref.watch(multipleStreamProvider);

    return DefaultLayout(
      title: 'StreamProvider',
      body: Center(
        child: state.when(
          data: (data) => Text(data.toString()),
          error: (error, stack) => Text('Error: $error'),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}

