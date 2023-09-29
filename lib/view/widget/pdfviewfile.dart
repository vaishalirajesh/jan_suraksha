import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class MyStatefulWidget extends StatefulWidget {
  final String type; //if you have multiple values add here
  const MyStatefulWidget(this.type, {Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static const int _initialPage = 1;
  late PdfControllerPinch _pdfController;

  static const String? title = "";

  @override
  void initState() {
    super.initState();

    switch (widget.type) {
      case "1":
        _pdfController = PdfControllerPinch(
          document: PdfDocument.openAsset(
              'assets/files/jansuraksh_privacy_policy.pdf'),
          initialPage: _initialPage,
        );
        break;
      case "2":

        _pdfController = PdfControllerPinch(
          document: PdfDocument.openAsset(
              'assets/files/jansuraksha_tm.pdf'),
          initialPage: _initialPage,
        );
        break;
      case "3":
        _pdfController = PdfControllerPinch(
          document: PdfDocument.openAsset(
              'assets/files/jansurksha_disclaimer.pdf'),
          initialPage: _initialPage,
        );
        break;
    }
  }

  String getTitle() {
    switch (widget.type) {
      case "1":
        return "Privacy Policy";

      case "2":
        return "Terms & Conditions";
      case "3":
        return "Disclaimers";

      default:
        return "";
    }
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTitle()),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () {
              _pdfController.previousPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 100),
              );
            },
          ),
          PdfPageNumber(
            controller: _pdfController,
            builder: (_, loadingState, page, pagesCount) => Container(
              alignment: Alignment.center,
              child: Text(
                '$page/${pagesCount ?? 0}',
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              _pdfController.nextPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 100),
              );
            },
          ),
        ],
      ),
      body: PdfViewPinch(
        builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
          options: const DefaultBuilderOptions(),
          documentLoaderBuilder: (_) =>
              const Center(child: CircularProgressIndicator()),
          pageLoaderBuilder: (_) =>
              const Center(child: CircularProgressIndicator()),
        ),
        controller: _pdfController,
      ),
    );
  }
}
