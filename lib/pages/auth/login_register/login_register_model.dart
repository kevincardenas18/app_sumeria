import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_register_widget.dart' show LoginRegisterWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginRegisterModel extends FlutterFlowModel<LoginRegisterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El correo electrónico es requerido';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Debe ser un correo electrónico válido';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Contraseña es requerida';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (auth)] action in Button widget.
  ApiCallResponse? apiResultAuth;
  // Stores action output result for [Backend Call - API (User Profile)] action in Button widget.
  ApiCallResponse? userResponse;
  // Stores action output result for [Backend Call - API (merge cart)] action in Button widget.
  ApiCallResponse? mergeCartResult;
  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateTextController;
  String? Function(BuildContext, String?)?
      emailAddressCreateTextControllerValidator;
  String? _emailAddressCreateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email es requerido';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Debe ser un correo electrónico válido';
    }
    return null;
  }

  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateTextController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)?
      passwordCreateTextControllerValidator;
  String? _passwordCreateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Contraseña es requerida';
    }

    if (val.length < 8) {
      return 'Debe ser de almenos 8 caracteres-';
    }
    if (val.length > 20) {
      return 'No puede tener más de 20 caracteres-';
    }
    if (!RegExp('^(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_]).+\$').hasMatch(val)) {
      return 'Incluya una mayúscula, un número y un caracter especial.';
    }
    return null;
  }

  // State field(s) for birth_date_Create widget.
  FocusNode? birthDateCreateFocusNode;
  TextEditingController? birthDateCreateTextController;
  final birthDateCreateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      birthDateCreateTextControllerValidator;
  String? _birthDateCreateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Fecha requerida';
    }

    return null;
  }

  DateTime? datePicked;
  // Stores action output result for [Custom Action - isValidBirthDate] action in Button widget.
  bool? resultIsValidBirthDate;
  // Stores action output result for [Backend Call - API (create customer)] action in Button widget.
  ApiCallResponse? apiResultCreateCustomer;
  // Stores action output result for [Backend Call - API (auth)] action in Button widget.
  ApiCallResponse? loginAfterRegisterResult;
  // Stores action output result for [Backend Call - API (User Profile)] action in Button widget.
  ApiCallResponse? userCreateResponse;
  // Stores action output result for [Backend Call - API (merge cart)] action in Button widget.
  ApiCallResponse? mergeCartResultRegister;

  @override
  void initState(BuildContext context) {
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    emailAddressCreateTextControllerValidator =
        _emailAddressCreateTextControllerValidator;
    passwordCreateVisibility = false;
    passwordCreateTextControllerValidator =
        _passwordCreateTextControllerValidator;
    birthDateCreateTextControllerValidator =
        _birthDateCreateTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateTextController?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateTextController?.dispose();

    birthDateCreateFocusNode?.dispose();
    birthDateCreateTextController?.dispose();
  }
}
