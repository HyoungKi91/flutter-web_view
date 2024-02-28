import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUrl = Uri.parse('https://hkkim91.tistory.com/64'); // Url을 Uri로 변환.

class  HomeScreen extends StatelessWidget {
  WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(homeUrl); // ..을 붙이면 controller에 loadRequest()가 반환되는것이 아니라 WebViewController() 가 반환된다.
                          // 즉, loadRequest를 실행 하였지만, 반환값은 받지 않는다는것.

  HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer Hkkim'),
        backgroundColor: Colors.green,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
        actions: [
          IconButton(
              onPressed: (){
                controller.loadRequest(homeUrl);
              }, //눌렀을때 실행할 함수를 입력
              icon: Icon(
                Icons.home
              ),
          ),
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}