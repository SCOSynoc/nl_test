import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

@immutable
sealed class FeedsEvents {}


class FetchFeedsRequested extends FeedsEvents {
}
