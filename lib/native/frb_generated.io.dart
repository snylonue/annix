// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.32.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/network.dart';
import 'api/player.dart';
import 'api/simple.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ffi' as ffi;
import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_io.dart';
import 'package:uuid/uuid.dart';

abstract class RustLibApiImplPlatform extends BaseApiImpl<RustLibWire> {
  RustLibApiImplPlatform({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  CrossPlatformFinalizerArg
      get rust_arc_decrement_strong_count_MutexConnectionPtr =>
          wire._rust_arc_decrement_strong_count_RustOpaque_MutexConnectionPtr;

  CrossPlatformFinalizerArg
      get rust_arc_decrement_strong_count_MutexRepoDatabaseReadPtr => wire
          ._rust_arc_decrement_strong_count_RustOpaque_MutexRepoDatabaseReadPtr;

  CrossPlatformFinalizerArg
      get rust_arc_decrement_strong_count_AnnixPlayerPtr => wire
          ._rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayerPtr;

  @protected
  AnyhowException dco_decode_AnyhowException(dynamic raw);

  @protected
  AnnixPlayer
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayer(
          dynamic raw);

  @protected
  AnnixPlayer
      dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayer(
          dynamic raw);

  @protected
  MutexConnection dco_decode_RustOpaque_MutexConnection(dynamic raw);

  @protected
  MutexRepoDatabaseRead dco_decode_RustOpaque_MutexRepoDatabaseRead(
      dynamic raw);

  @protected
  AnnixPlayer
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayer(
          dynamic raw);

  @protected
  RustStreamSink<PlayerStateEvent> dco_decode_StreamSink_player_state_event_Sse(
      dynamic raw);

  @protected
  RustStreamSink<ProgressState> dco_decode_StreamSink_progress_state_Sse(
      dynamic raw);

  @protected
  String dco_decode_String(dynamic raw);

  @protected
  UuidValue dco_decode_Uuid(dynamic raw);

  @protected
  AudioQuality dco_decode_audio_quality(dynamic raw);

  @protected
  bool dco_decode_bool(dynamic raw);

  @protected
  LocalDb dco_decode_box_autoadd_local_db(dynamic raw);

  @protected
  LocalStore dco_decode_box_autoadd_local_store(dynamic raw);

  @protected
  NativePreferenceStore dco_decode_box_autoadd_native_preference_store(
      dynamic raw);

  @protected
  double dco_decode_f_32(dynamic raw);

  @protected
  int dco_decode_i_32(dynamic raw);

  @protected
  List<String> dco_decode_list_String(dynamic raw);

  @protected
  List<UuidValue> dco_decode_list_Uuid(dynamic raw);

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw);

  @protected
  List<TagItem> dco_decode_list_tag_item(dynamic raw);

  @protected
  LocalDb dco_decode_local_db(dynamic raw);

  @protected
  LocalStore dco_decode_local_store(dynamic raw);

  @protected
  NativePreferenceStore dco_decode_native_preference_store(dynamic raw);

  @protected
  NetworkStatus dco_decode_network_status(dynamic raw);

  @protected
  String? dco_decode_opt_String(dynamic raw);

  @protected
  PlayerStateEvent dco_decode_player_state_event(dynamic raw);

  @protected
  ProgressState dco_decode_progress_state(dynamic raw);

  @protected
  TagItem dco_decode_tag_item(dynamic raw);

  @protected
  int dco_decode_u_64(dynamic raw);

  @protected
  int dco_decode_u_8(dynamic raw);

  @protected
  void dco_decode_unit(dynamic raw);

  @protected
  int dco_decode_usize(dynamic raw);

  @protected
  AnyhowException sse_decode_AnyhowException(SseDeserializer deserializer);

  @protected
  AnnixPlayer
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayer(
          SseDeserializer deserializer);

  @protected
  AnnixPlayer
      sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayer(
          SseDeserializer deserializer);

  @protected
  MutexConnection sse_decode_RustOpaque_MutexConnection(
      SseDeserializer deserializer);

  @protected
  MutexRepoDatabaseRead sse_decode_RustOpaque_MutexRepoDatabaseRead(
      SseDeserializer deserializer);

  @protected
  AnnixPlayer
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayer(
          SseDeserializer deserializer);

  @protected
  RustStreamSink<PlayerStateEvent> sse_decode_StreamSink_player_state_event_Sse(
      SseDeserializer deserializer);

  @protected
  RustStreamSink<ProgressState> sse_decode_StreamSink_progress_state_Sse(
      SseDeserializer deserializer);

  @protected
  String sse_decode_String(SseDeserializer deserializer);

  @protected
  UuidValue sse_decode_Uuid(SseDeserializer deserializer);

  @protected
  AudioQuality sse_decode_audio_quality(SseDeserializer deserializer);

  @protected
  bool sse_decode_bool(SseDeserializer deserializer);

  @protected
  LocalDb sse_decode_box_autoadd_local_db(SseDeserializer deserializer);

  @protected
  LocalStore sse_decode_box_autoadd_local_store(SseDeserializer deserializer);

  @protected
  NativePreferenceStore sse_decode_box_autoadd_native_preference_store(
      SseDeserializer deserializer);

  @protected
  double sse_decode_f_32(SseDeserializer deserializer);

  @protected
  int sse_decode_i_32(SseDeserializer deserializer);

  @protected
  List<String> sse_decode_list_String(SseDeserializer deserializer);

  @protected
  List<UuidValue> sse_decode_list_Uuid(SseDeserializer deserializer);

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer);

  @protected
  List<TagItem> sse_decode_list_tag_item(SseDeserializer deserializer);

  @protected
  LocalDb sse_decode_local_db(SseDeserializer deserializer);

  @protected
  LocalStore sse_decode_local_store(SseDeserializer deserializer);

  @protected
  NativePreferenceStore sse_decode_native_preference_store(
      SseDeserializer deserializer);

  @protected
  NetworkStatus sse_decode_network_status(SseDeserializer deserializer);

  @protected
  String? sse_decode_opt_String(SseDeserializer deserializer);

  @protected
  PlayerStateEvent sse_decode_player_state_event(SseDeserializer deserializer);

  @protected
  ProgressState sse_decode_progress_state(SseDeserializer deserializer);

  @protected
  TagItem sse_decode_tag_item(SseDeserializer deserializer);

  @protected
  int sse_decode_u_64(SseDeserializer deserializer);

  @protected
  int sse_decode_u_8(SseDeserializer deserializer);

  @protected
  void sse_decode_unit(SseDeserializer deserializer);

  @protected
  int sse_decode_usize(SseDeserializer deserializer);

  @protected
  void sse_encode_AnyhowException(
      AnyhowException self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayer(
          AnnixPlayer self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayer(
          AnnixPlayer self, SseSerializer serializer);

  @protected
  void sse_encode_RustOpaque_MutexConnection(
      MutexConnection self, SseSerializer serializer);

  @protected
  void sse_encode_RustOpaque_MutexRepoDatabaseRead(
      MutexRepoDatabaseRead self, SseSerializer serializer);

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayer(
          AnnixPlayer self, SseSerializer serializer);

  @protected
  void sse_encode_StreamSink_player_state_event_Sse(
      RustStreamSink<PlayerStateEvent> self, SseSerializer serializer);

  @protected
  void sse_encode_StreamSink_progress_state_Sse(
      RustStreamSink<ProgressState> self, SseSerializer serializer);

  @protected
  void sse_encode_String(String self, SseSerializer serializer);

  @protected
  void sse_encode_Uuid(UuidValue self, SseSerializer serializer);

  @protected
  void sse_encode_audio_quality(AudioQuality self, SseSerializer serializer);

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_local_db(LocalDb self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_local_store(
      LocalStore self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_native_preference_store(
      NativePreferenceStore self, SseSerializer serializer);

  @protected
  void sse_encode_f_32(double self, SseSerializer serializer);

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_list_String(List<String> self, SseSerializer serializer);

  @protected
  void sse_encode_list_Uuid(List<UuidValue> self, SseSerializer serializer);

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer);

  @protected
  void sse_encode_list_tag_item(List<TagItem> self, SseSerializer serializer);

  @protected
  void sse_encode_local_db(LocalDb self, SseSerializer serializer);

  @protected
  void sse_encode_local_store(LocalStore self, SseSerializer serializer);

  @protected
  void sse_encode_native_preference_store(
      NativePreferenceStore self, SseSerializer serializer);

  @protected
  void sse_encode_network_status(NetworkStatus self, SseSerializer serializer);

  @protected
  void sse_encode_opt_String(String? self, SseSerializer serializer);

  @protected
  void sse_encode_player_state_event(
      PlayerStateEvent self, SseSerializer serializer);

  @protected
  void sse_encode_progress_state(ProgressState self, SseSerializer serializer);

  @protected
  void sse_encode_tag_item(TagItem self, SseSerializer serializer);

  @protected
  void sse_encode_u_64(int self, SseSerializer serializer);

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer);

  @protected
  void sse_encode_unit(void self, SseSerializer serializer);

  @protected
  void sse_encode_usize(int self, SseSerializer serializer);
}

// Section: wire_class

class RustLibWire implements BaseWire {
  factory RustLibWire.fromExternalLibrary(ExternalLibrary lib) =>
      RustLibWire(lib.ffiDynamicLibrary);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  RustLibWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  void rust_arc_increment_strong_count_RustOpaque_MutexConnection(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_increment_strong_count_RustOpaque_MutexConnection(
      ptr,
    );
  }

  late final _rust_arc_increment_strong_count_RustOpaque_MutexConnectionPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_annix_rust_arc_increment_strong_count_RustOpaque_MutexConnection');
  late final _rust_arc_increment_strong_count_RustOpaque_MutexConnection =
      _rust_arc_increment_strong_count_RustOpaque_MutexConnectionPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void rust_arc_decrement_strong_count_RustOpaque_MutexConnection(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_decrement_strong_count_RustOpaque_MutexConnection(
      ptr,
    );
  }

  late final _rust_arc_decrement_strong_count_RustOpaque_MutexConnectionPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_annix_rust_arc_decrement_strong_count_RustOpaque_MutexConnection');
  late final _rust_arc_decrement_strong_count_RustOpaque_MutexConnection =
      _rust_arc_decrement_strong_count_RustOpaque_MutexConnectionPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void rust_arc_increment_strong_count_RustOpaque_MutexRepoDatabaseRead(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_increment_strong_count_RustOpaque_MutexRepoDatabaseRead(
      ptr,
    );
  }

  late final _rust_arc_increment_strong_count_RustOpaque_MutexRepoDatabaseReadPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_annix_rust_arc_increment_strong_count_RustOpaque_MutexRepoDatabaseRead');
  late final _rust_arc_increment_strong_count_RustOpaque_MutexRepoDatabaseRead =
      _rust_arc_increment_strong_count_RustOpaque_MutexRepoDatabaseReadPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void rust_arc_decrement_strong_count_RustOpaque_MutexRepoDatabaseRead(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_decrement_strong_count_RustOpaque_MutexRepoDatabaseRead(
      ptr,
    );
  }

  late final _rust_arc_decrement_strong_count_RustOpaque_MutexRepoDatabaseReadPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_annix_rust_arc_decrement_strong_count_RustOpaque_MutexRepoDatabaseRead');
  late final _rust_arc_decrement_strong_count_RustOpaque_MutexRepoDatabaseRead =
      _rust_arc_decrement_strong_count_RustOpaque_MutexRepoDatabaseReadPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayer(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayer(
      ptr,
    );
  }

  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayerPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_annix_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayer');
  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayer =
      _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayerPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayer(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayer(
      ptr,
    );
  }

  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayerPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_annix_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayer');
  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayer =
      _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockAnnixPlayerPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();
}
