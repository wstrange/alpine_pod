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
          isAutoDispose: false,
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

String _$sectionNotifierHash() => r'615493152c0973fbc65e0f80bd6b805290e9383b';

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

@ProviderFor(currentEvents)
const currentEventsProvider = CurrentEventsProvider._();

final class CurrentEventsProvider extends $FunctionalProvider<
        AsyncValue<List<Event>>, List<Event>, FutureOr<List<Event>>>
    with $FutureModifier<List<Event>>, $FutureProvider<List<Event>> {
  const CurrentEventsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'currentEventsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$currentEventsHash();

  @$internal
  @override
  $FutureProviderElement<List<Event>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Event>> create(Ref ref) {
    return currentEvents(ref);
  }
}

String _$currentEventsHash() => r'dca26712fe9ea50faa8f6092da10191798be03ad';
