import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'budget_button_add_model.dart';
export 'budget_button_add_model.dart';

class BudgetButtonAddWidget extends StatefulWidget {
  const BudgetButtonAddWidget({Key? key}) : super(key: key);

  @override
  _BudgetButtonAddWidgetState createState() => _BudgetButtonAddWidgetState();
}

class _BudgetButtonAddWidgetState extends State<BudgetButtonAddWidget> {
  late BudgetButtonAddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BudgetButtonAddModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).success,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x411D2429),
            offset: Offset(0.0, -2.0),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 44.0),
        child: Text(
          FFLocalizations.of(context).getText(
            'a8u19wd8' /* Create Budget */,
          ),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryBtnText,
                fontSize: 32.0,
              ),
        ),
      ),
    );
  }
}
