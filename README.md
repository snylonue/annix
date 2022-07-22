# Annix

Desktop / Mobile client for Project Anni.

## Features

- Cross-platform player designed for Project Anni
  - Test on Linux(Manjaro KDE), macOS and Android
- Control through MPRIS on Linux

## Build

```bash
# Build models & ffi
flutter pub run build_runner build --delete-conflicting-outputs

# Build apk
flutter build apk --release --split-per-abi --split-debug-info debug --obfuscate
```

## TODOs

- [x] Audio Playback
- [ ] Annil
  - [ ] Server info
  - [x] Album list
  - [x] Cover
    - [x] Cover cache
  - [x] Audio
    - [x] Audio cache
  - [x] Annil selection based on priority
- [ ] Metadata Sources
  - [x] Anniv
  - [x] Local sqlite file
  - [x] Remote sqlite file
  - [ ] Metadata repository
- [ ] Anniv
  - [x] Server Info
  - [ ] User system
    - [x] Login
      - [ ] 2FA
    - [ ] Register
    - [x] Logout
    - [ ] ~~Revoke account~~ (Would not be implemented in Annix)
  - [ ] Playlist
    - [x] List playlist
    - [ ] Create playlist
    - [ ] Remove playlist
    - [ ] Edit playlist
      - [ ] Append
      - [ ] Remove
      - [ ] Reorder
      - [ ] Replace
  - [ ] Favorite
    - [x] Add favorite
    - [x] Remove favorite
    - [x] Favorite list
  - [ ] Credentials
    - [x] Get credentials
    - [ ] Add credential
    - [ ] Edit credential
    - [ ] Delete credential
  - [x] Lyric
  - [x] Search

