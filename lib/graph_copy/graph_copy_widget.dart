import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'graph_copy_model.dart';
export 'graph_copy_model.dart';

class GraphCopyWidget extends StatefulWidget {
  const GraphCopyWidget({Key? key}) : super(key: key);

  @override
  _GraphCopyWidgetState createState() => _GraphCopyWidgetState();
}

class _GraphCopyWidgetState extends State<GraphCopyWidget> {
  late GraphCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GraphCopyModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<TransactionsRecord>>(
      future: queryTransactionsRecordOnce(
        queryBuilder: (transactionsRecord) =>
            transactionsRecord.where('type', isEqualTo: 'Expense'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).success,
                  ),
                ),
              ),
            ),
          );
        }
        List<TransactionsRecord> graphCopyTransactionsRecordList =
            snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).success,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed('Dashboard');
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'iefhngaw' /* Graph */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(-0.05, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Container(
                                  width: 375.0,
                                  height: 350.0,
                                  child: FlutterFlowLineChart(
                                    data: [
                                      FFLineChartData(
                                        xData: graphCopyTransactionsRecordList
                                            .map((d) => d.createdAt)
                                            .toList(),
                                        yData: graphCopyTransactionsRecordList
                                            .map((d) => d.amount)
                                            .toList(),
                                        settings: LineChartBarData(
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          barWidth: 2.0,
                                          isCurved: true,
                                          preventCurveOverShooting: true,
                                        ),
                                      )
                                    ],
                                    chartStylingInfo: ChartStylingInfo(
                                      enableTooltip: true,
                                      tooltipBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      showBorder: false,
                                    ),
                                    axisBounds: AxisBounds(
                                      minX: 1.0,
                                      maxX: 31.0,
                                    ),
                                    xAxisLabelInfo: AxisLabelInfo(
                                      title:
                                          FFLocalizations.of(context).getText(
                                        'ivmzmxlr' /* Date */,
                                      ),
                                      titleTextStyle: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    yAxisLabelInfo: AxisLabelInfo(
                                      title:
                                          FFLocalizations.of(context).getText(
                                        'jqzgyrw6' /* Amount */,
                                      ),
                                      titleTextStyle: TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                ),
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
          ),
        );
      },
    );
  }
}
