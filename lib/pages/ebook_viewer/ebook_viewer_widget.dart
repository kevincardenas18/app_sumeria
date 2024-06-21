import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'ebook_viewer_model.dart';
export 'ebook_viewer_model.dart';

class EbookViewerWidget extends StatefulWidget {
  const EbookViewerWidget({
    super.key,
    required this.urlBook,
  });

  final String? urlBook;

  @override
  State<EbookViewerWidget> createState() => _EbookViewerWidgetState();
}

class _EbookViewerWidgetState extends State<EbookViewerWidget> {
  late EbookViewerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EbookViewerModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ebookViewer'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => setState(() {}),
                        child: const HeaderWidget(
                          title: 'E-book',
                          showBackButton: true,
                        ),
                      ),
                      FlutterFlowPdfViewer(
                        networkPath: widget.urlBook!,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        horizontalScroll: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
