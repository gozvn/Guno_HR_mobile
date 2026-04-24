import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/dto/request_type_dto.dart';
import '../../requests_providers.dart';
import 'details_form_step.dart';
import 'type_picker_step.dart';

/// Two-step create flow: step 1 = type grid, step 2 = form.
/// Initial type can be pre-selected via [initialTypeCode] (e.g. from WFH redirect).
class CreateRequestPage extends ConsumerStatefulWidget {
  const CreateRequestPage({super.key, this.initialTypeCode});

  final String? initialTypeCode;

  @override
  ConsumerState<CreateRequestPage> createState() => _CreateRequestPageState();
}

class _CreateRequestPageState extends ConsumerState<CreateRequestPage> {
  int _step = 0;
  RequestTypeDto? _selectedType;

  @override
  void initState() {
    super.initState();
    // Riverpod forbids provider mutation in lifecycle hooks — defer to next frame.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(createRequestNotifierProvider.notifier).startFlow();
    });
    // If launched with a pre-selected type (e.g. ?type=wfh), skip step 1.
    if (widget.initialTypeCode != null) {
      _step = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen for success to pop + show snackbar.
    ref.listen(createRequestNotifierProvider, (_, next) {
      next.maybeMap(
        success: (s) {
          if (context.mounted) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Đã gửi đơn thành công!'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        orElse: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(_step == 0 ? 'Chọn loại đơn' : 'Thông tin đơn'),
        leading: _step == 1
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() => _step = 0);
                  ref.read(createRequestNotifierProvider.notifier).startFlow();
                },
              )
            : null,
      ),
      body: _step == 0
          ? TypePickerStep(
              onSelected: (type) {
                setState(() {
                  _selectedType = type;
                  _step = 1;
                });
                ref
                    .read(createRequestNotifierProvider.notifier)
                    .selectType(type.code);
              },
            )
          : DetailsFormStep(
              typeCode: widget.initialTypeCode ??
                  (_selectedType?.code ?? ''),
              onSubmit: () {
                // Submission is handled inside notifier; listener above pops.
              },
            ),
    );
  }
}
