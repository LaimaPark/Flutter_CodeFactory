import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {

  /* ProviderScope 안에 있는 Provider 값이 변경되면 호출 */
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    /* super 는 지워도 상관없음 */
  }

  /* Provider 가 추가되면 호출되는 함수 */
  @override
  void didAddProvider(ProviderBase provider, Object? value, ProviderContainer container) {

  }

  /* Provider 가 삭제되었을 때 */
  /* AutoDispose 같은 화면에서 사라지면 제거되는 경우 주로 보임 */
  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer containers) {
    super.didDisposeProvider(provider, containers);
  }

}
