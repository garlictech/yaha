import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_tab_controller.g.dart';

@riverpod
class MainTabController extends _$MainTabController {
  @override
  PersistentTabController build() {
    return PersistentTabController(initialIndex: 0);
  }
}
