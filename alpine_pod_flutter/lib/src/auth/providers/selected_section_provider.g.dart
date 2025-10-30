// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_section_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedSection)
const selectedSectionProvider = SelectedSectionProvider._();

final class SelectedSectionProvider
    extends $NotifierProvider<SelectedSection, Section?> {
  const SelectedSectionProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'selectedSectionProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$selectedSectionHash();

  @$internal
  @override
  SelectedSection create() => SelectedSection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Section? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Section?>(value),
    );
  }
}

String _$selectedSectionHash() => r'e2ec4c61451794011c148516e2cd1a2767ee1f7d';

abstract class _$SelectedSection extends $Notifier<Section?> {
  Section? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Section?, Section?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Section?, Section?>, Section?, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
