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

════════ Exception caught by foundation library ════════════════════════════════
The following assertion was thrown while dispatching notifications for CoordinatorRouterDelegate:
setState() or markNeedsBuild() called during build.
This Router<Object> widget cannot be marked as needing to build because the framework is already in the process of building widgets. A widget can be marked as needing to be built during the build phase only if one of its ancestors is currently building. This exception is allowed because the framework builds parent widgets before children, which means a dirty descendant will always be built. Otherwise, the framework might not visit this widget during this build phase.
The widget on which setState() or markNeedsBuild() was called was: Router<Object>
    dependencies: [UnmanagedRestorationScope]
    state: _RouterState<Object>#9064a
The widget which was currently being built when the offending call was made was: NavigationStack<RouteUnique>
    dependencies: [UnmanagedRestorationScope]
    state: _NavigationStackState<RouteUnique>#924b6

When the exception was thrown, this was the stack:
#0      Element.markNeedsBuild.<anonymous closure> (package:flutter/src/widgets/framework.dart:5376:9)
framework.dart:5376
#1      Element.markNeedsBuild (package:flutter/src/widgets/framework.dart:5388:6)
framework.dart:5388
#2      State.setState (package:flutter/src/widgets/framework.dart:1219:15)
framework.dart:1219
#3      _RouterState._handleRouterDelegateNotification (package:flutter/src/widgets/router.dart:833:5)
router.dart:833
#4      ChangeNotifier.notifyListeners (package:flutter/src/foundation/change_notifier.dart:435:24)
change_notifier.dart:435
#5      ChangeNotifier.notifyListeners (package:flutter/src/foundation/change_notifier.dart:435:24)
change_notifier.dart:435
#6      ChangeNotifier.notifyListeners (package:flutter/src/foundation/change_notifier.dart:435:24)
change_notifier.dart:435
#7      StackMutatable.remove (package:zenrouter/src/path/base.dart:134:18)
base.dart:134
#8      RouteTarget.onDidPop (package:zenrouter/src/mixin/target.dart:190:14)
target.dart:190
#9      _NavigationStackState._buildPage.<anonymous closure> (package:zenrouter/src/path/stack.dart:152:21)
stack.dart:152
#10     PopScope._callPopInvoked (package:flutter/src/widgets/pop_scope.dart:146:30)
pop_scope.dart:146
#11     _PopScopeState.onPopInvokedWithResult (package:flutter/src/widgets/pop_scope.dart:181:12)
#12     ModalRoute.onPopInvokedWithResult (package:flutter/src/widgets/routes.dart:2024:16)
routes.dart:2024
#13     _RouteEntry.handlePop (package:flutter/src/widgets/navigator.dart:3308:11)
navigator.dart:3308
#14     NavigatorState._flushHistoryUpdates (package:flutter/src/widgets/navigator.dart:4453:22)
navigator.dart:4453
#15     NavigatorState._updatePages (package:flutter/src/widgets/navigator.dart:4381:5)
navigator.dart:4381
#16     NavigatorState.didUpdateWidget (package:flutter/src/widgets/navigator.dart:4016:7)
navigator.dart:4016
#17     StatefulElement.update (package:flutter/src/widgets/framework.dart:5994:55)
framework.dart:5994
#18     Element.updateChild (package:flutter/src/widgets/framework.dart:4037:15)
framework.dart:4037
#19     ComponentElement.performRebuild (package:flutter/src/widgets/framework.dart:5844:16)
framework.dart:5844
#20     StatefulElement.performRebuild (package:flutter/src/widgets/framework.dart:5985:11)
framework.dart:5985
#21     Element.rebuild (package:flutter/src/widgets/framework.dart:5532:7)
framework.dart:5532
#22     BuildScope._tryRebuild (package:flutter/src/widgets/framework.dart:2750:15)
framework.dart:2750
#23     BuildScope._flushDirtyElements (package:flutter/src/widgets/framework.dart:2807:11)
framework.dart:2807
#24     BuildOwner.buildScope (package:flutter/src/widgets/framework.dart:3111:18)
framework.dart:3111
#25     WidgetsBinding.drawFrame (package:flutter/src/widgets/binding.dart:1262:21)
binding.dart:1262
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
