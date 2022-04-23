part of 'pages.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, state) {
          if (state is OnListPage) {
            context.read<ListBloc>().add(ListGetData(10, 10));
            return ReadPage();
          } else if (state is OnDetailUpdatePage) {
            context.read<ViewUpdateBloc>().add(ViewDetailGetData(state.id));
            return ViewUpdatePage(state.id);
          } else if (state is OnCreatePage) {
            return InsertPage();
          } else {
            context.read<ListBloc>().add(ListGetData(0, 10));
            return ReadPage();
          }
        });
  }
}
