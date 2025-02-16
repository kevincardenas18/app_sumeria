import '/components/na_bar_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nav_bar_widget.dart' show NavBarWidget;
import 'package:flutter/material.dart';

class NavBarModel extends FlutterFlowModel<NavBarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for NaBarItem component.
  late NaBarItemModel naBarItemModel1;
  // Model for llibrary.
  late NaBarItemModel llibraryModel;
  // Model for NaBarItem component.
  late NaBarItemModel naBarItemModel2;
  // Model for orders.
  late NaBarItemModel ordersModel;
  // Model for profil.
  late NaBarItemModel profilModel;

  @override
  void initState(BuildContext context) {
    naBarItemModel1 = createModel(context, () => NaBarItemModel());
    llibraryModel = createModel(context, () => NaBarItemModel());
    naBarItemModel2 = createModel(context, () => NaBarItemModel());
    ordersModel = createModel(context, () => NaBarItemModel());
    profilModel = createModel(context, () => NaBarItemModel());
  }

  @override
  void dispose() {
    naBarItemModel1.dispose();
    llibraryModel.dispose();
    naBarItemModel2.dispose();
    ordersModel.dispose();
    profilModel.dispose();
  }
}
