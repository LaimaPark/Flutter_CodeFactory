


import 'package:flutter_riverpod/flutter_riverpod.dart';

final multiplesFutureProvider = FutureProvider<List<int>>((ref) async {
  final result = await MultiplesRepository.getMultiplesFuture(number: 2);

  return result;
});
