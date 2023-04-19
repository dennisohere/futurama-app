
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:futurama/components/network_image.dart';
import 'package:futurama/data/character/character.dart';
import 'package:futurama/services/character_service.dart';
import 'package:futurama/services/navigation_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../components/future_data_loader.dart';
import '../layout/app_layout.dart';

class CharacterDetailScreen extends ConsumerStatefulWidget {
  final Character character;

  const CharacterDetailScreen({Key? key, required this.character}) : super(key: key);

  @override
  ConsumerState<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends ConsumerState<CharacterDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            <Widget>[
              const Icon(CupertinoIcons.back, size: 20, color: Colors.white,)
                .padding(all: 10)
                .backgroundColor(Colors.purple)
                .clipOval().gestures(onTap: (){
                  NavigationService().pop();
              }),

              const SizedBox(width: 11,),

              Text(widget.character.fullName).fontSize(17.sp).bold(),
            ].toRow(
            ),
            const SizedBox(
              height: 11,
            ),
          ]
              .map((item) => SliverToBoxAdapter(
            child: item,
          ))
              .toList();
        },
        body: <Widget>[
          <Widget>[
            PNetworkImage(widget.character.images.main, width: 115.sp, height: 115.sp,),

            <Widget>[

              <Widget>[
                Icon(Icons.fiber_manual_record, size: 19.sp,),
                const SizedBox(width: 4,),
                Text(widget.character.species).fontSize(12.sp).expanded()
              ].toRow(),

              const SizedBox(height: 11,),

              <Widget>[
                Icon(Icons.place, size: 19.sp,),
                const SizedBox(width: 4,),
                Text(widget.character.homePlanet).fontSize(12.sp).expanded()
              ].toRow(crossAxisAlignment: CrossAxisAlignment.center),

              const SizedBox(height: 11,),

              <Widget>[
                Icon(Icons.work, size: 19.sp,),
                const SizedBox(width: 4,),
                Text(widget.character.occupation).fontSize(12.sp).expanded()
              ].toRow(crossAxisAlignment: CrossAxisAlignment.center),

            ].toColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
            ).expanded(),
          ].toRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween
          ),


          const SizedBox(height: 21,),

          <Widget>[
            Icon(Icons.record_voice_over_rounded, size: 24.sp,),
            const SizedBox(width: 4,),
            const Text('Sayings').fontSize(16.sp).bold().textColor(Colors.purple.shade700).expanded(),
          ].toRow(crossAxisAlignment: CrossAxisAlignment.center),
          ...widget.character.sayings.map((saying) =>
              Text("~ $saying").padding(vertical: 7)),

        ].toColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ).scrollable()
            .padding(vertical: 14, horizontal: 25),
      ).padding(horizontal: 20.sp, top: 25.sp),
    );
  }
}
