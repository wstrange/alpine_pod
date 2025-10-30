import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_section_provider.g.dart';

@riverpod
class SelectedSection extends _$SelectedSection {
  @override
  Section? build() {
    return null;
  }

  void selectSection(Section section) {
    state = section;
  }

  void clear() {
    state = null;
  }
}
