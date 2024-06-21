import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'busqueda_sin_resultados_model.dart';
export 'busqueda_sin_resultados_model.dart';

class BusquedaSinResultadosWidget extends StatefulWidget {
  const BusquedaSinResultadosWidget({super.key});

  @override
  State<BusquedaSinResultadosWidget> createState() =>
      _BusquedaSinResultadosWidgetState();
}

class _BusquedaSinResultadosWidgetState
    extends State<BusquedaSinResultadosWidget> {
  late BusquedaSinResultadosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BusquedaSinResultadosModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.search_off_sharp,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 50.0,
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Text(
              'No se encontro el libro',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 25.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
