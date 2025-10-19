import 'package:flutter/material.dart';
import 'package:oli/0_presentation/core/design_system.dart';
import 'package:oli/0_presentation/core/utils/lottie/asset_lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppInfinityLoadingList<T> extends StatefulWidget {
  final Future<List<T>?> Function(T lastData) getNextData;
  final Future<List<T>?> Function() getFirstData;
  final void Function()? onError;
  final bool enablePullUp;
  final Widget Function(int idx, T data) itemBuilder;
  final Widget Function(int idx, T data) separatorBuilder;
  final Widget? banner;
  final ScrollPhysics? physics;
  final ScrollController? scrollcontroller;
  final EdgeInsetsGeometry? padding;
  final bool keepAlive;
  final bool initialRefresh;

  const AppInfinityLoadingList({
    Key? key,
    required this.getFirstData,
    required this.getNextData,
    this.enablePullUp = true,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.physics = const AlwaysScrollableScrollPhysics(),
    this.padding = EdgeInsets.zero,
    this.onError,
    this.scrollcontroller,
    this.keepAlive = true,
    this.initialRefresh = false,
    this.banner,
  }) : super(key: key);

  @override
  State<AppInfinityLoadingList<T>> createState() =>
      _ppiInfinityLoadingListState<T>();
}

class _ppiInfinityLoadingListState<T> extends State<AppInfinityLoadingList<T>>
    with AutomaticKeepAliveClientMixin {
  List<T> datas = [];
  late final refreshController =
      RefreshController(initialRefresh: widget.initialRefresh);

  T? get lastData => datas.isEmpty ? null : datas.last;

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  void _error() {
    widget.onError?.call();
  }

  Future<void> _loadFirstData() async {
    final ret = await widget.getFirstData();
    if (ret == null) {
      _error();
    } else {
      _updateDatas(ret);
    }
    refreshController.refreshCompleted();
    refreshController.loadComplete();
  }

  Future<void> _loadNextData() async {
    if (lastData == null) return _loadFirstData();
    final ret = await widget.getNextData(lastData as T);
    if (ret == null) {
      _error();
    } else {
      if (ret.isEmpty) {
        refreshController.loadNoData();
      } else {
        _updateDatas([...datas, ...ret]);
      }
    }
    refreshController.loadComplete();
  }

  void _updateDatas(List<T> newDatas) {
    setState(() {
      datas = newDatas;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SmartRefresher(
      header: MaterialClassicHeader(
        backgroundColor: AppColorScheme.primaryBackground,
        color: AppColorScheme.grayScaleWhite,
      ),
      enablePullUp: true,
      controller: refreshController,
      onRefresh: _loadFirstData,
      onLoading: _loadNextData,
      footer: const AliFooter(),
      child: ListView.separated(
        padding: widget.padding,
        physics: widget.physics,
        controller: widget.scrollcontroller,
        itemCount: widget.banner == null ? datas.length : datas.length + 1,
        itemBuilder: (_, idx) {
          if (widget.banner != null) {
            if (idx == 0) {
              return widget.banner!;
            } else {
              return widget.itemBuilder(idx - 1, datas[idx - 1]);
            }
          } else {
            return widget.itemBuilder(idx, datas[idx]);
          }
        },
        separatorBuilder: (_, idx) => widget.separatorBuilder(idx, datas[idx]),
      ),
    );
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}

class AliFooter extends StatelessWidget {
  const AliFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (ctx, loadStatus) {
        if (loadStatus == LoadStatus.loading) {
          return const SizedBox(
            height: 50,
            child: Center(
              child: AppLottieAsset(
                type: AppLottieAssetType.chatbotLoading,
              ),
            ),
          );
        }
        return SizedBox(
          height: 50,
          child: Center(
            child: Text(
              '더 이상은 없어요.',
              style: AppTextTheme.body4.copyWith(
                height: 1,
              ),
            ),
          ),
        );
      },
    );
  }
}

class AliRefreshList extends StatefulWidget {
  final Future<void> Function() onRefresh;
  final bool keepAlive;
  final bool initialRefresh;
  final ListView child;

  const AliRefreshList({
    Key? key,
    required this.onRefresh,
    this.keepAlive = true,
    this.initialRefresh = false,
    required this.child,
  }) : super(key: key);

  @override
  State<AliRefreshList> createState() => _AliRefreshListState();
}

class _AliRefreshListState extends State<AliRefreshList>
    with AutomaticKeepAliveClientMixin {
  late final refreshController =
      RefreshController(initialRefresh: widget.initialRefresh);

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await widget.onRefresh();
    refreshController.refreshCompleted();
    refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SmartRefresher(
      header: MaterialClassicHeader(
        backgroundColor: AppColorScheme.primaryBackground,
        color: AppColorScheme.grayScaleWhite,
      ),
      enablePullUp: false,
      enablePullDown: true,
      controller: refreshController,
      onRefresh: _onRefresh,
      child: widget.child,
    );
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
