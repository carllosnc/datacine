import '/core/core.dart';
import '/imports/app.dart';

class ImageHelper {
  static String getPoster({
    required String? path,
    ImageSize size = ImageSize.posterOriginal,
  }) {
    if (path == null) return Assets.noPoster;

    return "${ImageUrl.secureBaseUrl.value}/${size.value}$path";
  }

  static String getBackdrop({
    required String? path,
    ImageSize size = ImageSize.backdropOriginal,
  }) {
    if (path == null) return Assets.noBackdrop;

    return "${ImageUrl.secureBaseUrl.value}/${size.value}$path";
  }

  static String getProfile({
    required String? path,
    ImageSize size = ImageSize.profileOriginal,
  }) {
    if (path == null) return Assets.noProfile;

    return "${ImageUrl.secureBaseUrl.value}/${size.value}$path";
  }

  static String getLogo({
    required String path,
    ImageSize size = ImageSize.logoOriginal,
  }) {
    return "${ImageUrl.secureBaseUrl.value}/${size.value}$path";
  }
}
