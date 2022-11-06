import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yara/api/common/ps_resource.dart';
import 'package:yara/config/ps_config.dart';
import 'package:yara/provider/schedule/schedule_header_provider.dart';
import 'package:yara/repository/schedule_header_repository.dart';
import 'package:yara/ui/common/ps_ui_widget.dart';
import 'package:yara/ui/schedule_order/item/schedule_order_list_item.dart';
import 'package:yara/ui/search/search_item_view_all/search_item_view_all_container.dart';
import 'package:yara/viewobject/schedule_detail.dart';
import 'package:yara/viewobject/schedule_header.dart';
import 'package:yara/viewobject/user.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../../config/ps_colors.dart';
import '../../../constant/ps_constants.dart';
import '../../../utils/ps_curve_animation.dart';
import '../../../utils/ps_progress_dialog.dart';
import '../../../utils/utils.dart';
import '../../../viewobject/api_status.dart';
import '../../common/dialog/error_dialog.dart';
import '../../common/dialog/success_dialog.dart';

class ScheduleOrderListView extends StatefulWidget {
  const ScheduleOrderListView({
    Key? key, 
    @required this.user,
    this.isHideAppBar = false}) 
    : super(key: key);

  final User? user;
  final bool? isHideAppBar;

  @override
  State<ScheduleOrderListView> createState() => _ScheduleOrderListViewState();
}

class _ScheduleOrderListViewState extends State<ScheduleOrderListView>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? fadeAnimation;
  final ScrollController _scrollController = ScrollController();
  ScheduleHeaderProvider? scheduleHeaderProvider;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        scheduleHeaderProvider!.loadMoreScheduleHeaderList(widget.user!.userId!);
      }
    });
    controller =
        AnimationController(duration: PsConfig.animation_duration, vsync: this);
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(controller!);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ScheduleHeaderRepository _repo =
        Provider.of<ScheduleHeaderRepository>(context);
    return Scaffold(
      appBar: widget.isHideAppBar! ? null : AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Utils.getBrightnessForAppBar(context)),
        iconTheme: Theme.of(context).iconTheme.copyWith(),
        title: Text(
          Utils.getString(context, 'order_time__my_schedule'),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        elevation: 0,
      ),
      body: MultiProvider(
        providers: <SingleChildWidget>[
          ChangeNotifierProvider<ScheduleHeaderProvider>(
            lazy: false,
            create: (BuildContext context) {
              final ScheduleHeaderProvider provider = ScheduleHeaderProvider(
                  repo: _repo, psValueHolder: psValueHolder!);
              scheduleHeaderProvider = provider;
              provider.getAllScheduleHeaderList(widget.user!.userId!);
              return provider;
            },
          ),
        ],
        child: Consumer<ScheduleHeaderProvider>(
          builder: (BuildContext context, ScheduleHeaderProvider provider, _) =>
              Container(
            color: PsColors.backgroundColor,
            child: Stack(
              children: <Widget>[
                if (provider.scheduleList.data != null &&
                    provider.scheduleList.data!.isNotEmpty)
                  ListView.builder(
                    controller: _scrollController,
                    itemCount: provider.scheduleList.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ScheduleHeader scheduleHeader =
                          provider.scheduleList.data![index];
                      final List<String> itemList = <String>[];
                      for (ScheduleDetail scheduleDetail
                          in provider.scheduleList.data![index].scheduleList!) {
                        itemList.add(scheduleDetail.productName!);
                      }
                      return AnimatedBuilder(
                        animation: controller!,
                        child: ScheduleOrderListItem(
                          address: scheduleHeader.contactAddress,
                          itemList: itemList.join(' , '),
                          scheduleDay: scheduleHeader.scheduleDay,
                          scheduleTime: scheduleHeader.scheduleTime,
                          // ignore: avoid_bool_literals_in_conditional_expressions
                          isActive: scheduleHeader.scheduleStatus == PsConst.ONE
                              ? true
                              : false,
                          scheduleIndex: index + 1,
                          onDeleted: () {
                            deleteScheduleOrder(provider, scheduleHeader.id!);
                          },
                          onChanged: () async {
                            await PsProgressDialog.showDialog(context);

                            final PsResource<List<ScheduleHeader>>
                                scheduleHeaderResponse =
                                await provider.updateScheduleOrder(
                              scheduleHeader.id!,
                              scheduleHeader.scheduleStatus == PsConst.ONE
                                  ? PsConst.ZERO
                                  : PsConst.ONE,
                            );

                            await provider
                                .resetScheduleHeaderList(widget.user!.userId!);
                            PsProgressDialog.dismissDialog();
                            if (scheduleHeaderResponse.data!.isNotEmpty &&
                                scheduleHeaderResponse.data != null) {
                              showDialog<dynamic>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SuccessDialog(
                                      message: Utils.getString(
                                          context, 'Schedule Status Updated'),
                                    );
                                  });
                            } else {
                              showDialog<dynamic>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ErrorDialog(
                                      message: Utils.getString(context,
                                          'Schedule Status Updated Failed'),
                                    );
                                  });
                            }
                          },
                        ),
                        builder: (BuildContext context, Widget? child) {
                          controller!.forward();
                          return FadeTransition(
                              opacity: fadeAnimation!,
                              child: Transform(
                                transform: Matrix4.translationValues(
                                    0,
                                    100 *
                                        (1.0 -
                                            curveAnimation(controller!, index, 5)
                                                .value),
                                    0),
                                child: child,
                              ));
                        },
                      );
                    },
                  )
                else
                  Container(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: PSProgressIndicator(provider.scheduleList.status),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> deleteScheduleOrder(
      ScheduleHeaderProvider provider, String scheduleHeaderId) async {
    await PsProgressDialog.showDialog(context);
    final PsResource<ApiStatus> _apiStatus = await provider.deleteScheduleOrder(
        ScheduleHeaderMap(scheduleHeadId: scheduleHeaderId).toMap());

    await provider.resetScheduleHeaderList(widget.user!.userId!);
    PsProgressDialog.dismissDialog();
    if (_apiStatus.data != null) {
      showDialog<dynamic>(
          context: context,
          builder: (BuildContext context) {
            return SuccessDialog(
              message: _apiStatus.data!.message!,
            );
          });
    } else {
      showDialog<dynamic>(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialog(
              message: _apiStatus.message,
            );
          });
    }
  }
}
