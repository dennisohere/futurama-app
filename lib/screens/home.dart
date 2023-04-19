import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:futurama/components/future_data_loader.dart';
import 'package:futurama/data/show/show.dart';
import 'package:futurama/screens/layout/app_layout.dart';
import 'package:futurama/services/info_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late Future infoFuture;

  @override
  void initState() {
    super.initState();
    infoFuture = ref.read(infoServiceProvider).getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            <Widget>[
              const Icon(
                Icons.movie_creation_rounded,
                size: 55,
                color: Colors.blue,
              ),
              const SizedBox(
                width: 11,
              ),
              const Text('SHOWS').fontSize(21.sp).bold(),
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
          future: infoFuture,
          onDataLoaded: (data) {
            final shows = data as List<Show>;
            return ListView.separated(
              itemCount: shows.length,
              itemBuilder: (context, index) {
                final show = shows.elementAt(index);

                return ListTile(
                  title: Text(show.yearsAired).bold(),
                  subtitle: <Widget>[Text(show.excerpt).expanded()].toRow(),
                  onTap: () {
                    _viewShowDetails(show);
                  },
                  tileColor: Colors.grey.shade50,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          },
        ),
      ).padding(horizontal: 20.sp, top: 25.sp),
    );
  }

  _viewShowDetails(Show show) {
    showCupertinoModalBottomSheet(
        context: context,
        enableDrag: false,
        barrierColor: Colors.grey.shade800.withOpacity(0.8),
        builder: (BuildContext context) {
          return Scaffold(
            body: <Widget>[
              // modal title
              <Widget>[
                const Text('Show details')
                    .fontSize(18)
                    .fontWeight(FontWeight.bold),
                const Icon(
                  CupertinoIcons.xmark,
                  color: Colors.red,
                  size: 28,
                ).ripple().gestures(onTap: () {
                  Navigator.of(context).pop();
                })
              ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),

              // modal content
              const SizedBox(
                height: 30,
              ),

              <Widget>[const Text('Year Aired:'), Text(show.yearsAired).bold()]
                  .toColumn(crossAxisAlignment: CrossAxisAlignment.start),

              const SizedBox(
                height: 10,
              ),

              <Widget>[
                const Text('Creators:'),
                <Widget>[
                  ...show.creators.map(
                        (creator) => Text(creator.name,
                      style: TextStyle(
                          color: Colors.cyan.shade700,
                          decoration: TextDecoration.underline
                      ),
                    ).gestures(onTap: (){
                      launchUrl(Uri.parse(creator.url),);
                    }),
                  ),
                ].toRow(
                  separator: const Text(' | ').bold(),
                ),
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),

              const SizedBox(
                height: 20,
              ),

              <Widget>[Text(show.synopsis).expanded()].toRow(),
            ]
                .toColumn(crossAxisAlignment: CrossAxisAlignment.start)
                .padding(horizontal: 30, vertical: 15)
                .scrollable(),
          );
        });
  }
}
