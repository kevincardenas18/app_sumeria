import '/components/search_products_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'categories_widget.dart' show CategoriesWidget;
import 'package:flutter/material.dart';

class CategoriesModel extends FlutterFlowModel<CategoriesWidget> {
  ///  Local state fields for this page.

  String categori = 'Todos';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for searchProducts component.
  late SearchProductsModel searchProductsModel;

  @override
  void initState(BuildContext context) {
    searchProductsModel = createModel(context, () => SearchProductsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchProductsModel.dispose();
  }
}
