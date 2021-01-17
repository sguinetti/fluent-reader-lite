import 'package:fluent_reader_lite/components/list_tile_group.dart';
import 'package:fluent_reader_lite/components/my_list_tile.dart';
import 'package:fluent_reader_lite/generated/l10n.dart';
import 'package:fluent_reader_lite/utils/colors.dart';
import 'package:fluent_reader_lite/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class SetupPage extends StatelessWidget {
  void _configure(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    final welcomeStyle = TextStyle(
      color: CupertinoColors.label.resolveFrom(context),
      fontSize: 24,
      fontWeight: FontWeight.bold,
      height: 1.5,
    );
    final top = Container(
      padding: EdgeInsets.symmetric(vertical: 100),
      child: Column(
        children: [
          Image.asset("assets/icons/logo.png", width: 80, height: 80),
          Text(S.of(context).welcome, style: welcomeStyle),
        ],
      ),
    );
    final services = ListTileGroup([
      MyListTile(
        title: Text("Fever API"),
        onTap: () { _configure(context, "/settings/service/fever"); },
      ),
      MyListTile(
        title: Text("Google Reader API"),
      ),
      MyListTile(
        title: Text("Inoreader"),
      ),
      MyListTile(
        title: Text("Feedbin"),
      ),
    ], title: S.of(context).service);
    final page = CupertinoPageScaffold(
      backgroundColor: MyColors.background,
      child: ListView(children: [
        top,
        services,
      ]),
    );
    final b = Global.currentBrightness(context) == Brightness.light;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: b ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      child: page,
    );
  }
}