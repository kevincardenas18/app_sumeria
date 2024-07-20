import '/backend/api_requests/api_calls.dart';
import '/components/address_add_or_edit_widget.dart';
import '/components/address_info_widget.dart';
import '/components/header_widget.dart';
import '/components/shimmer_addresses_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'addresses_model.dart';
export 'addresses_model.dart';

class AddressesWidget extends StatefulWidget {
  const AddressesWidget({
    super.key,
    required this.userData,
  });

  final dynamic userData;

  @override
  State<AddressesWidget> createState() => _AddressesWidgetState();
}

class _AddressesWidgetState extends State<AddressesWidget> {
  late AddressesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddressesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Addresses'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              wrapWithModel(
                model: _model.headerModel,
                updateCallback: () => setState(() {}),
                child: const HeaderWidget(
                  title: 'Direcciones',
                  showBackButton: true,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: WcGroup.getCustomerByIdCall.call(
                            id: int.parse(FFAppState().userId),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return const ShimmerAddressesWidget();
                            }
                            final addressesColumnGetCustomerByIdResponse =
                                snapshot.data!;

                            return ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Facturación',
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (!functions.isEmptyField(getJsonField(
                                  addressesColumnGetCustomerByIdResponse
                                      .jsonBody,
                                  r'''$.billing.address_1''',
                                ).toString()))
                                  wrapWithModel(
                                    model: _model.addressInfoModel1,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: AddressInfoWidget(
                                      addressData: getJsonField(
                                        addressesColumnGetCustomerByIdResponse
                                            .jsonBody,
                                        r'''$.billing''',
                                      ),
                                      actionName: 'Editar',
                                      addressType: 'billing',
                                    ),
                                  ),
                                if (functions.isEmptyField(getJsonField(
                                  addressesColumnGetCustomerByIdResponse
                                      .jsonBody,
                                  r'''$.billing.address_1''',
                                ).toString()))
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'ADDRESSES_PAGE_AGREGAR_BTN_ON_TAP');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          useSafeArea: true,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: AddressAddOrEditWidget(
                                                  actionName: 'Agregar',
                                                  addressType: 'billing',
                                                  addressData:
                                                      widget.userData!,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      text: 'Agregar',
                                      options: FFButtonOptions(
                                        height: 54.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .buttonBlack,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 10.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Envío',
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (!valueOrDefault<bool>(
                                  functions.isEmptyField(getJsonField(
                                    addressesColumnGetCustomerByIdResponse
                                        .jsonBody,
                                    r'''$.shipping.address_1''',
                                  ).toString()),
                                  false,
                                ))
                                  wrapWithModel(
                                    model: _model.addressInfoModel2,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: AddressInfoWidget(
                                      actionName: 'Editar',
                                      addressData: getJsonField(
                                        addressesColumnGetCustomerByIdResponse
                                            .jsonBody,
                                        r'''$.shipping''',
                                      ),
                                      addressType: 'shipping',
                                    ),
                                  ),
                                if (functions.isEmptyField(getJsonField(
                                  addressesColumnGetCustomerByIdResponse
                                      .jsonBody,
                                  r'''$.shipping.address_1''',
                                ).toString()))
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'ADDRESSES_PAGE_AGREGAR_BTN_ON_TAP');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          useSafeArea: true,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: AddressAddOrEditWidget(
                                                  actionName: 'Agregar',
                                                  addressType: 'shipping',
                                                  addressData:
                                                      widget.userData!,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      text: 'Agregar',
                                      options: FFButtonOptions(
                                        height: 54.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .buttonBlack,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 10.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
