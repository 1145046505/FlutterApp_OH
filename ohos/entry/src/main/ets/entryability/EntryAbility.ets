import { Any } from '@ohos/flutter_ohos';
import {
  FlutterAbility,
  FlutterEngine,
  MethodCall,
  MethodCallHandler,
  MethodChannel,
  MethodResult
} from '@ohos/flutter_ohos';
import { GeneratedPluginRegistrant } from '../plugins/GeneratedPluginRegistrant';

export default class EntryAbility extends FlutterAbility {
  private channelId: string = "my.app/harmony_ability";
  private channel: MethodChannel | null = null;
  private flutterCallbackHandler: MethodResult = {
    success: (result: Any): void => {
      console.info(`ddd >> flutter callback result success: ${JSON.stringify(result)}`);
    },
    error: (errorCode: string, errorMessage: string, errorDetails: Any): void => {
      console.info(`ddd >> flutter callback result error: ${errorCode} ${errorMessage} ${JSON.stringify(errorDetails)}`);
    },
    notImplemented: (): void => {
      console.info(`ddd >> flutter callback result notImplemented`);
    }
  };
  private channelHandler: MethodCallHandler = {
    onMethodCall(call: MethodCall, result: MethodResult) {
      console.log(`ddd >> on flutter method channel call: ${JSON.stringify(call)}, result: ${JSON.stringify(result)}`);
    }
  }

  configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    GeneratedPluginRegistrant.registerWith(flutterEngine)
    this.initChannel(flutterEngine)
  }

  initChannel(engine: FlutterEngine) {
    this.channel = new MethodChannel(engine.getDartExecutor().getBinaryMessenger(), this.channelId);
    this.channel.setMethodCallHandler(this.channelHandler);
  }

  invokeFlutterMethod(method: string, params: Any) {
    if (this.channel) {
      this.channel.invokeMethod(method, params, this.flutterCallbackHandler);
    }
  }
}
