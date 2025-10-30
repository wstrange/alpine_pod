// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SectionNotifier)
const sectionProvider = SectionNotifierProvider._();

final class SectionNotifierProvider
    extends $NotifierProvider<SectionNotifier, Section?> {
  const SectionNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sectionProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sectionNotifierHash();

  @$internal
  @override
  SectionNotifier create() => SectionNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Section? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Section?>(value),
    );
  }
}

String _$sectionNotifierHash() => r'4aaa3ac659d3a20d2eed3a1ded1b10c1e4d27bb5';

abstract class _$SectionNotifier extends $Notifier<Section?> {
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
