import 'package:dsproject/cubit/WorkList/workList_cubit.dart';
import 'package:dsproject/features/screens/workList/widgets/workList_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Placeholder Cubit for future logic
class WorkListPage extends StatefulWidget {
  const WorkListPage({Key? key}) : super(key: key);

  @override
  State<WorkListPage> createState() => _WorkListPageState();
}

class _WorkListPageState extends State<WorkListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WorkListCubit()..getWorkList(context: context),
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F0F3),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF0F0F3),
          elevation: 0,
          centerTitle: true,
          title: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F3),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(color: Colors.white, offset: Offset(-3, -3), blurRadius: 6),
                    BoxShadow(color: Color(0xFFA7A9AF), offset: Offset(3, 3), blurRadius: 6),
                  ],
                ),
                child: const Text(
                  "WorkList",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 12), // Add margin under the title
            ],
          ),
        ),
        body: BlocBuilder<WorkListCubit, WorkListState>(
          builder: (context, state) {
            if (state is WorkListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WorkListFailure) {
              return Center(child: Text("Error: ${state.message}"));
            } else if (state is WorkListSuccess) {
              final cubit = WorkListCubit.get(context);
              if (cubit.WorkListList.isEmpty) {
                return const Center(child: Text("No items found."));
              }

              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: cubit.WorkListList.length,
                itemBuilder: (context, index) {
                  return WorkListCard(workListModel: cubit.WorkListList[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(height: 12),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
