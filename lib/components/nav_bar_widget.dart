import '/components/na_bar_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    super.key,
    String? activePage,
  }) : activePage = activePage ?? 'Home';

  final String activePage;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Current naBar items:
        //
        // Home
        // Cart
        // Orders
        // Wallet
        // Profile
        Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: double.infinity,
            height: 65.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 25.0,
                  color: Color(0x1D000000),
                  offset: Offset(
                    0.0,
                    -8.0,
                  ),
                )
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'NAV_BAR_COMP_Container_khnd0gz8_ON_TAP');

                        context.pushNamed('Home');
                      },
                      child: wrapWithModel(
                        model: _model.naBarItemModel1,
                        updateCallback: () => setState(() {}),
                        child: NaBarItemWidget(
                          actiePage: widget.activePage,
                          currentItemName: 'Home',
                          unselectedIcon: const Icon(
                            Icons.home_outlined,
                            size: 24.0,
                          ),
                          selectedIcon: const Icon(
                            Icons.home,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('NAV_BAR_COMP_llibrary_ON_TAP');

                        context.pushNamed('Library');
                      },
                      child: wrapWithModel(
                        model: _model.llibraryModel,
                        updateCallback: () => setState(() {}),
                        child: NaBarItemWidget(
                          actiePage: widget.activePage,
                          currentItemName: 'Librería',
                          unselectedIcon: const Icon(
                            Icons.library_books_outlined,
                            size: 24.0,
                          ),
                          selectedIcon: const Icon(
                            Icons.library_books_rounded,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('NAV_BAR_COMP_cart_ON_TAP');

                      context.pushNamed(
                        'cart',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Stack(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.naBarItemModel2,
                            updateCallback: () => setState(() {}),
                            child: NaBarItemWidget(
                              actiePage: widget.activePage,
                              currentItemName: 'Carrito',
                              unselectedIcon: Icon(
                                Icons.shopping_cart_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              selectedIcon: Icon(
                                Icons.shopping_cart_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 5.0, 0.0),
                            child: Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).warning,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 12.0,
                                    color: Color(0x7839D2C0),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFAppState()
                                      .contador
                                      .toString()
                                      .maybeHandleOverflow(maxChars: 2),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  minFontSize: 8.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('NAV_BAR_COMP_orders_ON_TAP');

                        context.pushNamed('OrdersHistory');
                      },
                      child: wrapWithModel(
                        model: _model.ordersModel,
                        updateCallback: () => setState(() {}),
                        child: NaBarItemWidget(
                          actiePage: widget.activePage,
                          currentItemName: 'Pedidos',
                          unselectedIcon: Icon(
                            Icons.document_scanner_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          selectedIcon: Icon(
                            Icons.document_scanner,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('NAV_BAR_COMP_profil_ON_TAP');

                        context.pushNamed('Profile');
                      },
                      child: wrapWithModel(
                        model: _model.profilModel,
                        updateCallback: () => setState(() {}),
                        child: NaBarItemWidget(
                          actiePage: widget.activePage,
                          currentItemName: 'Perfil',
                          unselectedIcon: Icon(
                            Icons.people_outline,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          selectedIcon: Icon(
                            Icons.people_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
