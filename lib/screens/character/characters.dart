
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:futurama/components/network_image.dart';
import 'package:futurama/data/character/character.dart';
import 'package:futurama/services/character_service.dart';
import 'package:futurama/services/navigation_service.dart';
import 'package:futurama/utils/route_paths.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../components/future_data_loader.dart';
import '../layout/app_layout.dart';

class CharacterScreen extends ConsumerStatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends ConsumerState<CharacterScreen> {
  late Future characterFuture;

  @override
  void initState() {
    super.initState();
    characterFuture = ref.read(characterServiceProvider).getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            <Widget>[
              const Icon(
                Icons.people,
                size: 55,
                color: Colors.purple,
              ),
              const SizedBox(
                width: 11,
              ),
              const Text('CHARACTERS').fontSize(21.sp).bold(),
            ].toRow(),
            const SizedBox(
              height: 11,
            ),
          ]
              .map((item) => SliverToBoxAdapter(
            child: item,
          ))
              .toList();
        },
        body: FutureDataLoader(
          future: characterFuture,
          onDataLoaded: (data) {
            final characters = data as List<Character>;
            return ListView.separated(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters.elementAt(index);
                return ListTile(
                  onTap: (){
                    NavigationService().navigateTo(RoutePaths.characterDetailScreen,
                        arguments: character);
                  },
                  leading: PNetworkImage(character.images.main, width: 35, height: 35,),
                  title: Text(character.fullName).bold(),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          },
        ),
      ).padding(horizontal: 20.sp, top: 25.sp),
    );
  }
}
