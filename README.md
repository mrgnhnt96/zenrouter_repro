# zen_router_poc

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Error Receiving

### Action

1. Run the app
2. Open the devtools
3. Click `Replace`

### Error

```console
#26     RendererBinding._handlePersistentFrameCallback (package:flutter/src/rendering/binding.dart:495:5)
binding.dart:495
#27     SchedulerBinding._invokeFrameCallback (package:flutter/src/scheduler/binding.dart:1434:15)
binding.dart:1434
#28     SchedulerBinding.handleDrawFrame (package:flutter/src/scheduler/binding.dart:1347:9)
binding.dart:1347
#29     SchedulerBinding._handleDrawFrame (package:flutter/src/scheduler/binding.dart:1200:5)
binding.dart:1200
#30     _invoke (dart:ui/hooks.dart:356:13)
hooks.dart:356
#31     PlatformDispatcher._drawFrame (dart:ui/platform_dispatcher.dart:444:5)
platform_dispatcher.dart:444
#32     _drawFrame (dart:ui/hooks.dart:328:31)
hooks.dart:328

The CoordinatorRouterDelegate sending notification was: Instance of 'CoordinatorRouterDelegate'
════════════════════════════════════════════════════════════════════════════════

════════ Exception caught by foundation library ════════════════════════════════
setState() or markNeedsBuild() called during build.
════════════════════════════════════════════════════════════════════════════════

════════ Exception caught by foundation library ════════════════════════════════
setState() or markNeedsBuild() called during build.
════════════════════════════════════════════════════════════════════════════════

════════ Exception caught by foundation library ════════════════════════════════
setState() or markNeedsBuild() called during build.
════════════════════════════════════════════════════════════════════════════════

════════ Exception caught by widgets library ═══════════════════════════════════
'package:flutter/src/widgets/framework.dart': Failed assertion: line 5541 pos 12: '!_dirty': is not true.
The relevant error-causing widget was:
    Scaffold Scaffold:file:///Users/morgan/Documents/develop.nosync/flutter_projects/zen_router_poc/lib/routes/coordinator.dart:133:12
════════════════════════════════════════════════════════════════════════════════
```
