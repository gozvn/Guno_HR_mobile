import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/providers.dart';

/// Loads an image URL that requires Authorization header.
/// Uses Dio so the auth interceptor attaches the Bearer token.
/// Falls back to an error icon on failure.
class AuthenticatedImage extends ConsumerWidget {
  const AuthenticatedImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  });

  final String url;
  final BoxFit fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dio = ref.watch(dioProvider);
    return FutureBuilder<Uint8List>(
      future: _fetch(dio, url),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return SizedBox(
            width: width,
            height: height,
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }
        if (snap.hasError || snap.data == null) {
          return SizedBox(
            width: width,
            height: height,
            child: const Center(child: Icon(Icons.broken_image_outlined)),
          );
        }
        return Image.memory(
          snap.data!,
          fit: fit,
          width: width,
          height: height,
        );
      },
    );
  }

  static Future<Uint8List> _fetch(Dio dio, String url) async {
    final resp = await dio.get<List<int>>(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    return Uint8List.fromList(resp.data!);
  }
}
