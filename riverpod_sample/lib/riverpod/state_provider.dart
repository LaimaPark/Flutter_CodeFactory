import 'package:flutter_riverpod/flutter_riverpod.dart';

/// StateProvider
/// - UI에서 직접적으로 데이터를 변경할 수 있도록 하고싶을 때 사용
/// - int String 등 단순한 형태만 관리
/// - Map, List 처럼 복잡한건 지양
/// - 아주 간단한 로직이 필요할떄만 사용 (number++)
///
final numberProvider = StateProvider<int>((ref) => 0);
