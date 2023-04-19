
import 'package:futurama/data/character/character.dart';
import 'package:futurama/utils/helpers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'http_service.dart';

final characterServiceProvider = Provider((ref) => _CharacterService(ref: ref));


class _CharacterService {
  Ref ref;

  _CharacterService({required this.ref});

  Future<List<Character>> getCharacters() async {
    final response = await ref.read(
      httpServiceProvider(
        ApiRequestModel(
          url: 'characters',
        ),
      ),
    );

    final characterResponse = response.data as List;

    return characterResponse.map((data) => Character.fromJson(data)).toList();
  }

}