
import 'package:futurama/data/show/show.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'http_service.dart';


final infoServiceProvider = Provider((ref) => _InfoService(ref: ref));


class _InfoService {
  Ref ref;

  _InfoService({required this.ref});

  Future<List<Show>> getInfo() async {
    final response = await ref.read(
      httpServiceProvider(
        ApiRequestModel(
          url: 'info',
        ),
      ),
    );

    final infoResponse = response.data as List;

    return infoResponse.map((data) => Show.fromJson(data)).toList();
  }
}