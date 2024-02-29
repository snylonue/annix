#![allow(
    non_camel_case_types,
    unused,
    clippy::redundant_closure,
    clippy::useless_conversion,
    clippy::unit_arg,
    clippy::double_parens,
    non_snake_case,
    clippy::too_many_arguments
)]
// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.82.6.

use crate::api::*;
use core::panic::UnwindSafe;
use flutter_rust_bridge::rust2dart::IntoIntoDart;
use flutter_rust_bridge::*;
use std::ffi::c_void;
use std::sync::Arc;

// Section: imports

use crate::player::PlayerStateEvent;

// Section: wire functions

fn wire_update_network_status_impl(
    port_: MessagePort,
    is_online: impl Wire2Api<bool> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "update_network_status",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_is_online = is_online.wire2api();
            move |task_callback| Result::<_, ()>::Ok(update_network_status(api_is_online))
        },
    )
}
fn wire_is_online__method__NetworkStatus_impl(
    port_: MessagePort,
    that: impl Wire2Api<NetworkStatus> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, bool, _>(
        WrapInfo {
            debug_name: "is_online__method__NetworkStatus",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_that = that.wire2api();
            move |task_callback| Result::<_, ()>::Ok(NetworkStatus::is_online(&api_that))
        },
    )
}
fn wire_new__static_method__NativePreferenceStore_impl(
    root: impl Wire2Api<String> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "new__static_method__NativePreferenceStore",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_root = root.wire2api();
            Result::<_, ()>::Ok(NativePreferenceStore::new(api_root))
        },
    )
}
fn wire_get__method__NativePreferenceStore_impl(
    that: impl Wire2Api<NativePreferenceStore> + UnwindSafe,
    key: impl Wire2Api<String> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "get__method__NativePreferenceStore",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_that = that.wire2api();
            let api_key = key.wire2api();
            Result::<_, ()>::Ok(NativePreferenceStore::get(&api_that, api_key))
        },
    )
}
fn wire_set__method__NativePreferenceStore_impl(
    that: impl Wire2Api<NativePreferenceStore> + UnwindSafe,
    key: impl Wire2Api<String> + UnwindSafe,
    value: impl Wire2Api<String> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "set__method__NativePreferenceStore",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_that = that.wire2api();
            let api_key = key.wire2api();
            let api_value = value.wire2api();
            Result::<_, ()>::Ok(NativePreferenceStore::set(&api_that, api_key, api_value))
        },
    )
}
fn wire_remove__method__NativePreferenceStore_impl(
    that: impl Wire2Api<NativePreferenceStore> + UnwindSafe,
    key: impl Wire2Api<String> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "remove__method__NativePreferenceStore",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_that = that.wire2api();
            let api_key = key.wire2api();
            Result::<_, ()>::Ok(NativePreferenceStore::remove(&api_that, api_key))
        },
    )
}
fn wire_remove_prefix__method__NativePreferenceStore_impl(
    that: impl Wire2Api<NativePreferenceStore> + UnwindSafe,
    prefix: impl Wire2Api<String> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "remove_prefix__method__NativePreferenceStore",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_that = that.wire2api();
            let api_prefix = prefix.wire2api();
            Result::<_, ()>::Ok(NativePreferenceStore::remove_prefix(&api_that, api_prefix))
        },
    )
}
fn wire_new__static_method__LocalDb_impl(
    port_: MessagePort,
    path: impl Wire2Api<String> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, LocalDb, _>(
        WrapInfo {
            debug_name: "new__static_method__LocalDb",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_path = path.wire2api();
            move |task_callback| Result::<_, ()>::Ok(LocalDb::new(api_path))
        },
    )
}
fn wire_get_album__method__LocalDb_impl(
    port_: MessagePort,
    that: impl Wire2Api<LocalDb> + UnwindSafe,
    album_id: impl Wire2Api<uuid::Uuid> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, Option<String>, _>(
        WrapInfo {
            debug_name: "get_album__method__LocalDb",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_that = that.wire2api();
            let api_album_id = album_id.wire2api();
            move |task_callback| Result::<_, ()>::Ok(LocalDb::get_album(&api_that, api_album_id))
        },
    )
}
fn wire_get_albums_by_tag__method__LocalDb_impl(
    port_: MessagePort,
    that: impl Wire2Api<LocalDb> + UnwindSafe,
    tag: impl Wire2Api<String> + UnwindSafe,
    recursive: impl Wire2Api<bool> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, Vec<uuid::Uuid>, _>(
        WrapInfo {
            debug_name: "get_albums_by_tag__method__LocalDb",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_that = that.wire2api();
            let api_tag = tag.wire2api();
            let api_recursive = recursive.wire2api();
            move |task_callback| {
                Result::<_, ()>::Ok(LocalDb::get_albums_by_tag(
                    &api_that,
                    api_tag,
                    api_recursive,
                ))
            }
        },
    )
}
fn wire_get_tags__method__LocalDb_impl(
    port_: MessagePort,
    that: impl Wire2Api<LocalDb> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, Vec<TagItem>, _>(
        WrapInfo {
            debug_name: "get_tags__method__LocalDb",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_that = that.wire2api();
            move |task_callback| Result::<_, ()>::Ok(LocalDb::get_tags(&api_that))
        },
    )
}
fn wire_new__static_method__LocalStore_impl(
    root: impl Wire2Api<String> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "new__static_method__LocalStore",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_root = root.wire2api();
            Result::<_, ()>::Ok(LocalStore::new(api_root))
        },
    )
}
fn wire_insert__method__LocalStore_impl(
    port_: MessagePort,
    that: impl Wire2Api<LocalStore> + UnwindSafe,
    category: impl Wire2Api<String> + UnwindSafe,
    key: impl Wire2Api<String> + UnwindSafe,
    value: impl Wire2Api<String> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "insert__method__LocalStore",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_that = that.wire2api();
            let api_category = category.wire2api();
            let api_key = key.wire2api();
            let api_value = value.wire2api();
            move |task_callback| {
                Result::<_, ()>::Ok(LocalStore::insert(
                    &api_that,
                    api_category,
                    api_key,
                    api_value,
                ))
            }
        },
    )
}
fn wire_get__method__LocalStore_impl(
    port_: MessagePort,
    that: impl Wire2Api<LocalStore> + UnwindSafe,
    category: impl Wire2Api<String> + UnwindSafe,
    key: impl Wire2Api<String> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, Option<String>, _>(
        WrapInfo {
            debug_name: "get__method__LocalStore",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_that = that.wire2api();
            let api_category = category.wire2api();
            let api_key = key.wire2api();
            move |task_callback| {
                Result::<_, ()>::Ok(LocalStore::get(&api_that, api_category, api_key))
            }
        },
    )
}
fn wire_clear__method__LocalStore_impl(
    port_: MessagePort,
    that: impl Wire2Api<LocalStore> + UnwindSafe,
    category: impl Wire2Api<Option<String>> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "clear__method__LocalStore",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_that = that.wire2api();
            let api_category = category.wire2api();
            move |task_callback| Result::<_, ()>::Ok(LocalStore::clear(&api_that, api_category))
        },
    )
}
fn wire_new__static_method__AnnixPlayer_impl() -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "new__static_method__AnnixPlayer",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || Result::<_, ()>::Ok(AnnixPlayer::new()),
    )
}
fn wire_play__method__AnnixPlayer_impl(
    port_: MessagePort,
    that: impl Wire2Api<AnnixPlayer> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "play__method__AnnixPlayer",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_that = that.wire2api();
            move |task_callback| Result::<_, ()>::Ok(AnnixPlayer::play(&api_that))
        },
    )
}
fn wire_pause__method__AnnixPlayer_impl(
    port_: MessagePort,
    that: impl Wire2Api<AnnixPlayer> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "pause__method__AnnixPlayer",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_that = that.wire2api();
            move |task_callback| Result::<_, ()>::Ok(AnnixPlayer::pause(&api_that))
        },
    )
}
fn wire_open_file__method__AnnixPlayer_impl(
    port_: MessagePort,
    that: impl Wire2Api<AnnixPlayer> + UnwindSafe,
    path: impl Wire2Api<String> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "open_file__method__AnnixPlayer",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_that = that.wire2api();
            let api_path = path.wire2api();
            move |task_callback| AnnixPlayer::open_file(&api_that, api_path)
        },
    )
}
fn wire_set_volume__method__AnnixPlayer_impl(
    port_: MessagePort,
    that: impl Wire2Api<AnnixPlayer> + UnwindSafe,
    volume: impl Wire2Api<f32> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "set_volume__method__AnnixPlayer",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_that = that.wire2api();
            let api_volume = volume.wire2api();
            move |task_callback| Result::<_, ()>::Ok(AnnixPlayer::set_volume(&api_that, api_volume))
        },
    )
}
fn wire_stop__method__AnnixPlayer_impl(
    port_: MessagePort,
    that: impl Wire2Api<AnnixPlayer> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "stop__method__AnnixPlayer",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_that = that.wire2api();
            move |task_callback| Result::<_, ()>::Ok(AnnixPlayer::stop(&api_that))
        },
    )
}
fn wire_seek__method__AnnixPlayer_impl(
    port_: MessagePort,
    that: impl Wire2Api<AnnixPlayer> + UnwindSafe,
    position: impl Wire2Api<u64> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "seek__method__AnnixPlayer",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_that = that.wire2api();
            let api_position = position.wire2api();
            move |task_callback| Result::<_, ()>::Ok(AnnixPlayer::seek(&api_that, api_position))
        },
    )
}
fn wire_is_playing__method__AnnixPlayer_impl(
    that: impl Wire2Api<AnnixPlayer> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "is_playing__method__AnnixPlayer",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_that = that.wire2api();
            Result::<_, ()>::Ok(AnnixPlayer::is_playing(&api_that))
        },
    )
}
fn wire_player_state_stream__method__AnnixPlayer_impl(
    port_: MessagePort,
    that: impl Wire2Api<AnnixPlayer> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "player_state_stream__method__AnnixPlayer",
            port: Some(port_),
            mode: FfiCallMode::Stream,
        },
        move || {
            let api_that = that.wire2api();
            move |task_callback| {
                Result::<_, ()>::Ok(AnnixPlayer::player_state_stream(
                    &api_that,
                    task_callback.stream_sink::<_, PlayerStateEvent>(),
                ))
            }
        },
    )
}
fn wire_progress_stream__method__AnnixPlayer_impl(
    port_: MessagePort,
    that: impl Wire2Api<AnnixPlayer> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "progress_stream__method__AnnixPlayer",
            port: Some(port_),
            mode: FfiCallMode::Stream,
        },
        move || {
            let api_that = that.wire2api();
            move |task_callback| {
                Result::<_, ()>::Ok(AnnixPlayer::progress_stream(
                    &api_that,
                    task_callback.stream_sink::<_, mirror_ProgressState>(),
                ))
            }
        },
    )
}
// Section: wrapper structs

#[derive(Clone)]
pub struct mirror_ProgressState(ProgressState);

// Section: static checks

const _: fn() = || {
    let ProgressState = None::<ProgressState>.unwrap();
    let _: u64 = ProgressState.position;
    let _: u64 = ProgressState.duration;
};
// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

pub trait Wire2Api<T> {
    fn wire2api(self) -> T;
}

impl<T, S> Wire2Api<Option<T>> for *mut S
where
    *mut S: Wire2Api<T>,
{
    fn wire2api(self) -> Option<T> {
        (!self.is_null()).then(|| self.wire2api())
    }
}

impl Wire2Api<bool> for bool {
    fn wire2api(self) -> bool {
        self
    }
}

impl Wire2Api<f32> for f32 {
    fn wire2api(self) -> f32 {
        self
    }
}
impl Wire2Api<i32> for i32 {
    fn wire2api(self) -> i32 {
        self
    }
}

impl Wire2Api<NetworkStatus> for i32 {
    fn wire2api(self) -> NetworkStatus {
        match self {
            0 => NetworkStatus::Online,
            1 => NetworkStatus::Offline,
            _ => unreachable!("Invalid variant for NetworkStatus: {}", self),
        }
    }
}

impl Wire2Api<u64> for u64 {
    fn wire2api(self) -> u64 {
        self
    }
}
impl Wire2Api<u8> for u8 {
    fn wire2api(self) -> u8 {
        self
    }
}

// Section: impl IntoDart

impl support::IntoDart for AnnixPlayer {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.player.into_dart(),
            self._state.into_dart(),
            self._progress.into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for AnnixPlayer {}
impl rust2dart::IntoIntoDart<AnnixPlayer> for AnnixPlayer {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for LocalDb {
    fn into_dart(self) -> support::DartAbi {
        vec![self.repo.into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for LocalDb {}
impl rust2dart::IntoIntoDart<LocalDb> for LocalDb {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for LocalStore {
    fn into_dart(self) -> support::DartAbi {
        vec![self.conn.into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for LocalStore {}
impl rust2dart::IntoIntoDart<LocalStore> for LocalStore {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for NativePreferenceStore {
    fn into_dart(self) -> support::DartAbi {
        vec![self.conn.into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for NativePreferenceStore {}
impl rust2dart::IntoIntoDart<NativePreferenceStore> for NativePreferenceStore {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for PlayerStateEvent {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::Play => 0,
            Self::Pause => 1,
            Self::Stop => 2,
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for PlayerStateEvent {}
impl rust2dart::IntoIntoDart<PlayerStateEvent> for PlayerStateEvent {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for mirror_ProgressState {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.0.position.into_into_dart().into_dart(),
            self.0.duration.into_into_dart().into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for mirror_ProgressState {}
impl rust2dart::IntoIntoDart<mirror_ProgressState> for ProgressState {
    fn into_into_dart(self) -> mirror_ProgressState {
        mirror_ProgressState(self)
    }
}

impl support::IntoDart for TagItem {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.name.into_into_dart().into_dart(),
            self.children.into_into_dart().into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for TagItem {}
impl rust2dart::IntoIntoDart<TagItem> for TagItem {
    fn into_into_dart(self) -> Self {
        self
    }
}

// Section: executor

support::lazy_static! {
    pub static ref FLUTTER_RUST_BRIDGE_HANDLER: support::DefaultHandler = Default::default();
}

#[cfg(not(target_family = "wasm"))]
#[path = "bridge_generated.io.rs"]
mod io;
#[cfg(not(target_family = "wasm"))]
pub use self::io::*;
