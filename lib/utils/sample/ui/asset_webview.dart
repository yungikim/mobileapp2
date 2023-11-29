import 'package:asset_webview/asset_webview.dart';
import 'package:asset_webview/asset_webview_controller.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(mm());
}

class mm extends StatelessWidget {
  const mm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: kk(),
    );
  }
}


class kk extends StatelessWidget {
  const kk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: AssetWebview(
                initialUrl: 'asset://local/html/index.html',
                controller: NavigationAssetWebviewController(_currentContext),
              ) ,
            )
          ],
        ),
      ),
    );
  }
}

BuildContext _currentContext() => _navigatorKey.currentContext!;
final _navigatorKey = GlobalKey<NavigatorState>();