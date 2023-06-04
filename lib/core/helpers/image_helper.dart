import '/core/core.dart';

class ImageHelper {
  static String getPoster({
    required String path,
    ImageSize size = ImageSize.posterOriginal,
  }) {
    return "${ImageUrl.secureBaseUrl.value}/${size.value}$path";
  }

  static String getBackdrop({
    required String path,
    ImageSize size = ImageSize.backdropOriginal,
  }) {
    return "${ImageUrl.secureBaseUrl.value}/${size.value}$path";
  }

  static String getProfile({
    required String path,
    ImageSize size = ImageSize.profileOriginal,
  }) {
    return "${ImageUrl.secureBaseUrl.value}/${size.value}$path";
  }

  static String getLogo({
    required String path,
    ImageSize size = ImageSize.logoOriginal,
  }) {
    return "${ImageUrl.secureBaseUrl.value}/${size.value}$path";
  }
}
