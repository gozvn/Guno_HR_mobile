import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/providers.dart';
import 'data/profile_api.dart';

part 'profile_providers.g.dart';

@riverpod
ProfileApi profileApi(ProfileApiRef ref) => ProfileApi(ref.watch(dioProvider));
