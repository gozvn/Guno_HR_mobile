import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import 'data/fcm_service.dart';
import 'data/notifications_api.dart';
import 'services/deep_link_dispatcher.dart';
import 'services/pending_intent_store.dart';
import 'services/token_sync_service.dart';

part 'notifications_providers.g.dart';

@riverpod
FcmService fcmService(Ref ref) =>
    FcmService(FirebaseMessaging.instance);

@riverpod
NotificationsApi notificationsApi(Ref ref) =>
    NotificationsApi(ref.watch(dioProvider));

@riverpod
TokenSyncService tokenSyncService(Ref ref) => TokenSyncService(
      fcmService: ref.watch(fcmServiceProvider),
      api: ref.watch(notificationsApiProvider),
      storage: ref.watch(secureStorageProvider),
    );

@riverpod
PendingIntentStore pendingIntentStore(Ref ref) => PendingIntentStore();

@riverpod
DeepLinkDispatcher deepLinkDispatcher(Ref ref) =>
    DeepLinkDispatcher(ref.watch(routerProvider));
